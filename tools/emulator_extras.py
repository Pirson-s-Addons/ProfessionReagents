#!/usr/bin/env python3
"""Genera Data/<Cliente>/{Mining,Herbalism,Treasure,Enchanting,Skinning,Prospecting,Milling}.lua desde
las tablas de botin de un emulador de servidor (volcados SQL de MySQL).

Emuladores (formato de columnas detectado solo):
  AzerothCore / TrinityCore:  Entry, Item, Reference, Chance, QuestRequired, GroupId, MinCount, MaxCount
  TrinityCore antiguo:        entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount
  CMaNGOS / VMaNGOS:          entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount

Uso:  python3 -I tools/emulator_extras.py <carpeta con los .sql> <Cliente> <emulador> [carpeta con item_template]
      (la ultima, si el volcado no trae item_template: p. ej. Cata 4.3.4 coge el de Mists 5.4.8)
      p. ej.  python3 -I tools/emulator_extras.py ~/emu/acore Wrath AzerothCore
Los .sql necesarios: gameobject_loot_template, gameobject_template, skinning_loot_template,
creature_template, disenchant_loot_template, prospecting_loot_template, milling_loot_template,
reference_loot_template, item_template; y, si los objetos no traen DisenchantID, ItemDisenchantLoot.csv
(https://wago.tools/db2/ItemDisenchantLoot/csv) para saber a que tramo corresponde cada tabla.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LOOT_MAX = 8          # lineas por ficha
MIN_PCT = 0.5         # menos que esto no se ensena
ORE, HERB = (7, 7), (7, 9)  # (clase, subclase) de Objetos comerciables: Metal y piedra / Hierba
GO_CHEST = 3          # gameobject_template.type
# Cofres del mundo (los demas "cofres" del juego son objetos de mision)
TREASURE = re.compile(r"\b(Chest|Strongbox|Locker|Trunk|Coffer|Treasure|Cache|Stash|Footlocker)\b", re.I)


# ---------------------------------------------------------------- volcados SQL

def read_table(folder, table):
    """[ {columna: valor} ] de un volcado mysqldump (CREATE TABLE + INSERT ... VALUES (...),(...);)."""
    path = os.path.join(folder, table + ".sql")
    text = open(path, encoding="utf-8", errors="replace").read()
    create = re.search(r"CREATE TABLE[^(]*\((.*?)\n\)", text, re.S)
    cols = re.findall(r"^\s*`(\w+)`", create.group(1), re.M)
    rows = []
    # "INSERT INTO `t` VALUES" o "insert  into `t`(`col`,...) values" (SQLyog)
    for m in re.finditer(r"INSERT\s+INTO\s+`%s`[^;(]*(?:\([^)]*\))?\s*VALUES\s*" % table, text, re.I):
        rows.extend(parse_values(text, m.end(), cols))
    return rows


def parse_values(text, i, cols):
    """Tuplas desde text[i] hasta el ';' que cierra el INSERT."""
    out, n = [], len(text)
    while i < n:
        while text[i] in " \t\r\n,":
            i += 1
        if text[i] == ";":
            return out
        assert text[i] == "(", text[i:i + 40]
        i += 1
        vals = []
        while True:
            if text[i] == "'":
                j, buf = i + 1, []
                while text[j] != "'":
                    if text[j] == "\\":
                        j += 1
                    buf.append(text[j])
                    j += 1
                vals.append("".join(buf))
                i = j + 1
            else:
                j = i
                while text[j] not in ",)":
                    j += 1
                raw = text[i:j].strip()
                vals.append(None if raw == "NULL" else (float(raw) if "." in raw or "e" in raw.lower() else int(raw)))
                i = j
            if text[i] == ",":
                i += 1
                continue
            i += 1  # ')'
            break
        out.append(dict(zip(cols, vals)))
    return out


def col(row, *names, default=0):
    for name in names:
        if name in row:
            return row[name]
    return default


def norm_loot(rows):
    """{ entry: [ (item, ref, chance, group, lo, hi) ] } sin objetos de mision."""
    out = {}
    for r in rows:
        chance = col(r, "Chance", "ChanceOrQuestChance")
        if chance < 0 or col(r, "QuestRequired"):  # objeto de mision
            continue
        if "Reference" in r:
            ref, lo, hi = r["Reference"], col(r, "MinCount"), col(r, "MaxCount")
            # TDB 4.3.4: dentro de reference_loot_template cada fila repite su Entry en Reference
            if ref and col(r, "Item", "item") not in (0, ref):
                ref = 0
        else:
            m = col(r, "mincountOrRef")
            ref, lo, hi = (-m, 1, 1) if m < 0 else (0, m, col(r, "maxcount"))
        item = col(r, "Item", "item")
        out.setdefault(col(r, "Entry", "entry"), []).append(
            (0 if ref else item, ref, chance, col(r, "GroupId", "groupid"), lo, hi))
    return out


# ---------------------------------------------------------------- probabilidades

def resolve(table, refs, entry, depth=0):
    """{ item: [pct, lo, hi] } con la probabilidad de que salga cada objeto (0-100).
    Grupos: sale uno; los de Chance 0 se reparten lo que dejan los demas a partes iguales.
    Referencias: su tabla entera, escalada por la probabilidad de la fila."""
    out = {}

    def add(item, pct, lo, hi):
        e = out.setdefault(item, [0.0, lo, hi])
        e[0] = min(100.0, e[0] + pct)
        e[1], e[2] = min(e[1], lo), max(e[2], hi)

    def take(item, ref, pct, lo, hi):
        if ref:
            if depth < 4 and ref in refs:
                for it, (p, l, h) in resolve(refs, refs, ref, depth + 1).items():
                    add(it, pct * p / 100, l, h)
        else:
            add(item, pct, lo, hi)

    groups = {}
    for item, ref, chance, group, lo, hi in table.get(entry, []):
        if group:
            groups.setdefault(group, []).append((item, ref, chance, lo, hi))
        else:
            take(item, ref, chance or 100, lo, hi)
    for rows in groups.values():
        fixed = sum(c for _, _, c, _, _ in rows if c)
        free = [r for r in rows if not r[2]]
        share = max(0.0, 100 - fixed) / len(free) if free else 0
        for item, ref, chance, lo, hi in rows:
            take(item, ref, chance or share, lo, hi)
    return out


def loot_list(probs, names):
    rows = sorted(((i, p, lo, hi) for i, (p, lo, hi) in probs.items() if p >= MIN_PCT), key=lambda e: -e[1])
    return [(i, round(p, 1), max(1, lo), max(1, hi), names.get(i, str(i))) for i, p, lo, hi in rows[:LOOT_MAX]]


def lua_str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def lua_loot(loot):
    return ", ".join("{ %d, %s, %d, %d, %s }" % (i, p, lo, hi, lua_str(n)) for i, p, lo, hi, n in loot)


# ---------------------------------------------------------------- ficheros

def main(folder, client, emulator, items_folder=None):
    out_dir = os.path.join(ROOT, "Data", client)
    header = ["-- Generado por tools/emulator_extras.py desde %s: no editar a mano." % emulator,
              "-- Probabilidades del emulador, aproximadas (no son tablas oficiales).",
              "local _, addon = ...", "addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos", ""]

    def write(name, lines):
        with open(os.path.join(out_dir, name), "w", encoding="utf-8") as f:
            f.write("\n".join(header + lines) + "\n")

    items = {r["entry"]: r for r in read_table(items_folder or folder, "item_template")}
    names = {i: r["name"] for i, r in items.items()}
    kind_of = {i: (r["class"], r["subclass"]) for i, r in items.items()}
    refs = norm_loot(read_table(folder, "reference_loot_template"))

    # Menas y plantas: cofres (tipo 3) cuyo botin trae metal/piedra o hierbas
    go_loot = norm_loot(read_table(folder, "gameobject_loot_template"))
    nodes = {"ore": {}, "herb": {}, "treasure": {}}
    for go in read_table(folder, "gameobject_template"):
        loot_id = col(go, "Data1", "data1")
        if go["type"] != GO_CHEST or loot_id not in go_loot:
            continue
        probs = resolve(go_loot, refs, loot_id)
        kinds = {kind_of.get(i) for i, (p, _, _) in probs.items() if p >= 20}
        # Antes de TBC los minerales no tenian subclase propia (0): se reconocen por el nombre
        ores = ORE in kinds or any(p >= 20 and names.get(i, "").endswith(" Ore") for i, (p, _, _) in probs.items())
        kind = "ore" if ores else "herb" if HERB in kinds else "treasure" if TREASURE.search(go["name"]) else None
        if kind and go["name"] not in nodes[kind]:
            nodes[kind][go["name"]] = loot_list(probs, names)
    for kind, fname in (("ore", "Mining.lua"), ("herb", "Herbalism.lua"), ("treasure", "Treasure.lua")):
        lines = ["-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }",
                 "addon.GATHER_NODES = addon.GATHER_NODES or {}", "local nodes = addon.GATHER_NODES"]
        for name in sorted(nodes[kind]):
            lines.append("nodes[%s] = { kind = %s, skill = 0, loot = { %s } }" % (
                lua_str(name), lua_str(kind), lua_loot(nodes[kind][name])))
        write(fname, lines)

    # Desencantar: tramos (calidad, armadura/arma, nivel de objeto) segun los objetos que usan cada tabla
    de_loot = norm_loot(read_table(folder, "disenchant_loot_template"))
    brackets = {}
    for r in items.values():
        de = r.get("DisenchantID") or 0
        if de in de_loot and r["Quality"] in (2, 3, 4) and r["class"] in (2, 4):
            cls = ("weapon" if r["class"] == 2 else "armor") if r["Quality"] == 2 else None
            b = brackets.setdefault((r["Quality"], cls, de), [r["ItemLevel"], r["ItemLevel"], 0])
            b[0], b[1], b[2] = min(b[0], r["ItemLevel"]), max(b[1], r["ItemLevel"]), b[2] + 1
    # Sin DisenchantID en los objetos (Cata 4.3.4): los tramos salen de ItemDisenchantLoot (wago.tools, CSV)
    idl = os.path.join(folder, "ItemDisenchantLoot.csv")
    if not brackets and os.path.exists(idl):
        import csv
        for r in csv.DictReader(open(idl, encoding="utf-8")):
            de = int(r["ID"])
            if de in de_loot and r["Class"] in ("2", "4"):
                cls = "weapon" if r["Class"] == "2" else "armor"
                brackets[(int(r["Quality"]), cls, de)] = [int(r["MinLevel"]), int(r["MaxLevel"]), 1]
    lines = ["-- Tramos de desencantamiento: calidad, tipo (nil = cualquiera), niveles y lo que da",
             "addon.DISENCHANT = {"]
    # Si dos tablas se solapan, la del addon coge la primera: primero la que usan mas objetos
    for (q, cls, de), (lo, hi, _) in sorted(brackets.items(), key=lambda e: (e[0][0], str(e[0][1]), -e[1][2])):
        lines.append("    { q = %d, cls = %s, lo = %d, hi = %d, loot = { %s } }," % (
            q, lua_str(cls) if cls else "nil", lo, hi, lua_loot(loot_list(resolve(de_loot, refs, de), names))))
    if brackets:
        write("Enchanting.lua", lines + ["}"])
    else:  # sin datos: que Opciones no ensene la casilla (si el fichero es nuestro; el de Wowhead se queda)
        old = os.path.join(out_dir, "Enchanting.lua")
        if os.path.exists(old) and "emulator_extras.py" in open(old, encoding="utf-8").readline():
            os.remove(old)

    # Desuello: criatura -> su skinloot
    skin_loot = norm_loot(read_table(folder, "skinning_loot_template"))
    lines = ["-- Criatura (npcID) -> lo que da al desollarla: { { itemID, pct, min, max, nombre }, ... }",
             "addon.SKINNING = {"]
    cache, skinned = {}, 0
    for c in read_table(folder, "creature_template"):
        sid = col(c, "skinloot", "SkinningLootId")
        if sid in skin_loot:
            if sid not in cache:
                cache[sid] = lua_loot(loot_list(resolve(skin_loot, refs, sid), names))
            lines.append("    [%d] = { %s }," % (col(c, "entry", "Entry"), cache[sid]))
            skinned += 1
    write("Skinning.lua", lines + ["}"])

    # Prospectar y moler: mineral/hierba (itemID) -> lo que da
    for table, var, fname in (("prospecting_loot_template", "PROSPECTING", "Prospecting.lua"),
                              ("milling_loot_template", "MILLING", "Milling.lua")):
        if not os.path.exists(os.path.join(folder, table + ".sql")):
            continue
        loot = norm_loot(read_table(folder, table))
        lines = ["-- Objeto -> lo que da: { { itemID, pct, min, max, nombre }, ... }", "addon.%s = {" % var]
        for entry in sorted(loot):
            lines.append("    [%d] = { %s }, -- %s" % (entry, lua_loot(loot_list(resolve(loot, refs, entry), names)),
                                                     names.get(entry, "")))
        write(fname, lines + ["}"])

    print("%s: %d menas, %d plantas, %d cofres, %d tramos, %d criaturas desollables" % (
        client, len(nodes["ore"]), len(nodes["herb"]), len(nodes["treasure"]), len(brackets), skinned))


if __name__ == "__main__":
    if len(sys.argv) not in (4, 5):
        sys.exit(__doc__)
    main(*sys.argv[1:])
