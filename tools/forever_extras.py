#!/usr/bin/env python3
"""Genera Data/Forever/{Mining,Herbalism,Treasure,Enchanting,Skinning}.lua (solo WoW Forever) desde Wowhead.

Entradas (tools/wowhead/forever/, sacadas de wowhead.com/forever con el navegador, 10 s entre paginas):
  nodes.txt      una linea por nodo:  objectID|ore|herb|skill|nombre|muestras|id~nombre~pct~min~max;...
  skinning.txt   una linea por cuero/escama:  itemID|nombre#npc:minNivel:maxNivel:veces:muestras:cant/pct;...
               (pestana "Desollado de" de cada objeto de Objetos comerciables > Cuero)
  treasure.txt   como nodes.txt, con tipo "treasure" (cofres: pestana "Contiene" de cada objeto)
  enchanting.txt una linea por material de encantamiento:  itemID#<calidad><a|w><nivel>:pct,...
               (de la pestana "Desenchantado de" de cada material)

Uso:  python3 tools/forever_extras.py   (desde la raiz del addon)
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "tools", "wowhead", "forever")
OUT = os.path.join(ROOT, "Data", "Forever")

GATHER_MAX = 8        # lineas por nodo en la ficha
DE_MIN_PCT = 2        # menos que esto es ruido de la muestra
# Tramos de nivel de objeto del desencantamiento clasico
BRACKETS = [(5, 15), (16, 20), (21, 25), (26, 30), (31, 35), (36, 40), (41, 45), (46, 50),
            (51, 55), (56, 60), (61, 65), (66, 100)]
MATERIALS = {
    10940: "Strange Dust", 11083: "Soul Dust", 11137: "Vision Dust", 11176: "Dream Dust", 16204: "Illusion Dust",
    10938: "Lesser Magic Essence", 10939: "Greater Magic Essence", 10998: "Lesser Astral Essence",
    11082: "Greater Astral Essence", 11134: "Lesser Mystic Essence", 11135: "Greater Mystic Essence",
    11174: "Lesser Nether Essence", 11175: "Greater Nether Essence", 16202: "Lesser Eternal Essence",
    16203: "Greater Eternal Essence", 10978: "Small Glimmering Shard", 11084: "Large Glimmering Shard",
    11138: "Small Glowing Shard", 11139: "Large Glowing Shard", 11177: "Small Radiant Shard",
    11178: "Large Radiant Shard", 14343: "Small Brilliant Shard", 14344: "Large Brilliant Shard",
    20725: "Nexus Crystal",
}


def lua_str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def read_nodes():
    """Por nombre ingles, la variante con mas muestras (las demas son copias del mismo nodo)."""
    best = {}
    for path in [os.path.join(SRC, f) for f in ("nodes.txt", "treasure.txt") if os.path.exists(os.path.join(SRC, f))]:
        for line in open(path, encoding="utf-8"):
            line = line.strip()
            if not line:
                continue
            oid, kind, skill, name, samples, loot = line.split("|", 5)
            entry = (int(samples), kind, int(skill or 0), name, loot)
            if name not in best or entry[0] > best[name][0]:
                best[name] = entry
    return best


def read_disenchant():
    """{ (calidad, 'a'|'w'): { nivel: { material: pct } } }"""
    data = {}
    for line in open(os.path.join(SRC, "enchanting.txt"), encoding="utf-8"):
        line = line.strip()
        if not line:
            continue
        mat, rows = line.split("#", 1)
        for cell in rows.split(","):
            m = re.fullmatch(r"(\d)([aw])(\d+):(\d+)", cell)
            if not m:
                continue
            q, cls, lvl, pct = int(m[1]), m[2], int(m[3]), int(m[4])
            data.setdefault((q, cls), {}).setdefault(lvl, {})[int(mat)] = pct
    return data


SKIN_MIN_SAMPLES = 20
TREASURE_MIN_SAMPLES = 20  # menos desuellos que esto es ruido


def read_skinning():
    """{ npc: { 'outof': n, 'loot': { item: (pct, min, max, nombre) } } }"""
    npcs = {}
    path = os.path.join(SRC, "skinning.txt")
    if not os.path.exists(path):
        return npcs
    for line in open(path, encoding="utf-8"):
        line = line.strip()
        if not line:
            continue
        head, rows = line.split("#", 1)
        iid, iname = head.split("|", 1)
        for row in rows.split(";"):
            npc, _, _, count, outof, stack = row.split(":", 5)
            if int(outof) < SKIN_MIN_SAMPLES:
                continue
            amounts = [int(c.split(":")[0]) for c in stack.split("/") if c] or [1]
            entry = npcs.setdefault(int(npc), {"outof": int(outof), "loot": {}})
            entry["loot"][int(iid)] = (round(int(count) * 100 / int(outof), 1), min(amounts), max(amounts), iname)
    return npcs


def brackets(data):
    """Media de cada material dentro de cada tramo. Verdes: armadura y armas por separado
    (dan polvo o esencia en proporcion inversa); azules y morados: juntos."""
    out = []
    for q in (2, 3, 4):
        kinds = [("a", "armor"), ("w", "weapon")] if q == 2 else [(None, None)]
        for cls, label in kinds:
            levels = {}
            for (dq, dcls), by_level in data.items():
                if dq == q and (cls is None or dcls == cls):
                    for lvl, mats in by_level.items():
                        merged = levels.setdefault(lvl, {})
                        for mat, pct in mats.items():
                            merged[mat] = max(merged.get(mat, 0), pct)
            for lo, hi in BRACKETS:
                inside = [levels[l] for l in levels if lo <= l <= hi]
                if not inside:
                    continue
                mats = {}
                for row in inside:
                    for mat, pct in row.items():
                        mats.setdefault(mat, []).append(pct)
                loot = [(mat, round(sum(p) / len(inside), 1)) for mat, p in mats.items()]
                loot = sorted((e for e in loot if e[1] >= DE_MIN_PCT), key=lambda e: -e[1])
                if loot:
                    out.append((q, label, lo, hi, loot))
    return out


HEADER = [
    "-- Generado por tools/forever_extras.py desde Wowhead (wowhead.com/forever): no editar a mano.",
    "-- Probabilidades observadas por los usuarios de Wowhead, no tablas oficiales.",
    "local _, addon = ...",
    "addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos",
    "",
]


def write(name, lines):
    with open(os.path.join(OUT, name), "w", encoding="utf-8") as f:
        f.write("\n".join(HEADER + lines) + "\n")


def node_lines(nodes, kind):
    """Las menas o plantas de un tipo, anadidas a addon.GATHER_NODES (lo comparten los dos ficheros)."""
    lines = ["-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }",
             "addon.GATHER_NODES = addon.GATHER_NODES or {}",
             "local nodes = addon.GATHER_NODES"]
    for name in sorted(nodes):
        samples, k, skill, _, loot = nodes[name]
        if k != kind:
            continue
        cells = sorted((c.split("~") for c in loot.split(";")), key=lambda c: -float(c[2]))
        items = ", ".join("{ %s, %s, %s, %s, %s }" % (iid, pct, lo, hi, lua_str(iname))
                          for iid, iname, pct, lo, hi in cells[:GATHER_MAX])
        lines.append("nodes[%s] = { kind = %s, skill = %d, loot = { %s } }" % (lua_str(name), lua_str(k), skill, items))
    return lines


def main():
    nodes = read_nodes()
    write("Mining.lua", node_lines(nodes, "ore"))
    write("Herbalism.lua", node_lines(nodes, "herb"))
    # Cofres con pocas aperturas registradas no dicen nada fiable
    write("Treasure.lua", node_lines({n: e for n, e in nodes.items() if e[0] >= TREASURE_MIN_SAMPLES}, "treasure"))

    de = brackets(read_disenchant())
    lines = ["-- Tramos de desencantamiento: calidad, tipo (nil = cualquiera), niveles y lo que da",
             "addon.DISENCHANT = {"]
    for q, label, lo, hi, loot in de:
        items = ", ".join("{ %d, %s, 1, 1, %s }" % (mat, pct, lua_str(MATERIALS.get(mat, str(mat))))
                          for mat, pct in loot)
        cls = lua_str(label) if label else "nil"
        lines.append("    { q = %d, cls = %s, lo = %d, hi = %d, loot = { %s } }," % (q, cls, lo, hi, items))
    write("Enchanting.lua", lines + ["}"])

    skin = read_skinning()
    lines = ["-- Criatura (npcID) -> lo que da al desollarla: { { itemID, pct, min, max, nombre }, ... }",
             "addon.SKINNING = {"]
    for npc in sorted(skin):
        loot = sorted(skin[npc]["loot"].items(), key=lambda e: -e[1][0])[:GATHER_MAX]
        items = ", ".join("{ %d, %s, %d, %d, %s }" % (i, p, lo, hi, lua_str(n)) for i, (p, lo, hi, n) in loot)
        lines.append("    [%d] = { %s }," % (npc, items))
    write("Skinning.lua", lines + ["}"])
    print("%d nodos, %d tramos, %d criaturas -> Data/Forever/" % (len(nodes), len(de), len(skin)))


if __name__ == "__main__":
    sys.exit(main())
