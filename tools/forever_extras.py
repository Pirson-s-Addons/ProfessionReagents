#!/usr/bin/env python3
"""Genera Data/ForeverExtras.lua (solo WoW Forever) desde lo sacado de Wowhead.

Entradas (tools/wowhead/, sacadas de wowhead.com/forever con el navegador, 10 s entre paginas):
  nodes_*.txt  una linea por nodo:  objectID|ore|herb|skill|nombre|muestras|id~nombre~pct~min~max;...
  de_raw.txt   una linea por material de encantamiento:  itemID#<calidad><a|w><nivel>:pct,...
               (de la pestana "Desenchantado de" de cada material)

Uso:  python3 tools/forever_extras.py   (desde la raiz del addon)
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "tools", "wowhead")
OUT = os.path.join(ROOT, "Data", "ForeverExtras.lua")

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
    for path in sorted(glob.glob(os.path.join(SRC, "nodes_*.txt"))):
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
    for line in open(os.path.join(SRC, "de_raw.txt"), encoding="utf-8"):
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


def main():
    nodes = read_nodes()
    de = brackets(read_disenchant())
    lines = [
        "-- Generado por tools/forever_extras.py desde Wowhead (wowhead.com/forever): no editar a mano.",
        "-- Probabilidades observadas por los usuarios de Wowhead, no tablas oficiales.",
        "local _, addon = ...",
        "",
        "-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }",
        "addon.GATHER_NODES = {",
    ]
    for name in sorted(nodes):
        samples, kind, skill, _, loot = nodes[name]
        cells = sorted((c.split("~") for c in loot.split(";")), key=lambda c: -float(c[2]))
        items = []
        for iid, iname, pct, lo, hi in cells[:GATHER_MAX]:
            items.append("{ %s, %s, %s, %s, %s }" % (iid, pct, lo, hi, lua_str(iname)))
        lines.append("    [%s] = { kind = %s, skill = %d, loot = { %s } }," % (
            lua_str(name), lua_str(kind), skill, ", ".join(items)))
    lines += ["}", "",
              "-- Tramos de desencantamiento: calidad, tipo (nil = cualquiera), niveles y lo que da",
              "addon.DISENCHANT = {"]
    for q, label, lo, hi, loot in de:
        items = ", ".join("{ %d, %s, 1, 1, %s }" % (mat, pct, lua_str(MATERIALS.get(mat, str(mat))))
                          for mat, pct in loot)
        cls = lua_str(label) if label else "nil"
        lines.append("    { q = %d, cls = %s, lo = %d, hi = %d, loot = { %s } }," % (q, cls, lo, hi, items))
    lines.append("}")
    with open(OUT, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print("%d nodos, %d tramos -> %s" % (len(nodes), len(de), os.path.relpath(OUT, ROOT)))


if __name__ == "__main__":
    sys.exit(main())
