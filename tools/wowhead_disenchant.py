#!/usr/bin/env python3
"""Genera Data/<Cliente>/Enchanting.lua desde la pestana "Desencantado de" de Wowhead.

Entradas:
  tools/wowhead/<cliente>/enchanting.txt  una linea por material:
      materialID|nombre#calidad:clase:nivel:veces:muestras:cantMin-cantMax;...
      (clase 2 = arma, 4 = armadura; "veces" de "muestras" desencantes de ese objeto dieron el material)
  ItemDisenchantLoot.csv (https://wago.tools/db2/ItemDisenchantLoot/csv): los tramos oficiales
      (calidad x arma/armadura x nivel de objeto) en los que se agrupa el resultado.

Uso:  python3 -I tools/wowhead_disenchant.py <cliente> <Cliente> <ItemDisenchantLoot.csv> [nivel minimo]
      p. ej.  python3 -I tools/wowhead_disenchant.py mists Mists ~/idl.csv 364
"""
import csv
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MIN_PCT = 2  # menos que esto es ruido de la muestra


def lua_str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def main(folder, client, idl_csv, min_level="0"):
    raw = []  # (material, nombre, calidad, clase, nivel, veces, muestras, lo, hi)
    for line in open(os.path.join(ROOT, "tools", "wowhead", folder, "enchanting.txt"), encoding="utf-8"):
        line = line.strip()
        if not line:
            continue
        head, rows = line.split("#", 1)
        mat, name = head.split("|", 1)
        for cell in rows.split(";"):
            q, cls, lvl, count, outof, qty = cell.split(":")
            lo, hi = qty.split("-")
            raw.append((int(mat), name, int(q), int(cls), int(lvl), int(count), int(outof), int(lo), int(hi)))

    lines = ["-- Generado por tools/wowhead_disenchant.py desde Wowhead: no editar a mano.",
             "-- Probabilidades observadas por los usuarios de Wowhead, agrupadas en los tramos de ItemDisenchantLoot.",
             "local _, addon = ...", "addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos", "",
             "-- Tramos de desencantamiento: calidad, tipo, niveles y lo que da",
             "addon.DISENCHANT = {"]
    n = 0
    for b in sorted(csv.DictReader(open(idl_csv, encoding="utf-8")),
                    key=lambda r: (int(r["Quality"]), r["Class"], int(r["MinLevel"]))):
        q, cls, lo, hi = int(b["Quality"]), int(b["Class"]), int(b["MinLevel"]), int(b["MaxLevel"])
        if hi < int(min_level) or cls not in (2, 4):
            continue
        inside = [r for r in raw if r[2] == q and r[3] == cls and lo <= r[4] <= hi]
        # Cada material con sus propias filas: de las veces que se desencanto un objeto que lo da,
        # cuantas lo dio (las paginas de Wowhead traen como mucho 200 objetos, distintos en cada material)
        mats = {}
        for mat, name, _, _, _, count, outof, qlo, qhi in inside:
            m = mats.setdefault(mat, [0, 0, qlo, qhi, name])
            m[0] += count
            m[1] += outof
            m[2], m[3] = min(m[2], qlo), max(m[3], qhi)
        if not mats:
            continue
        loot = sorted(((mat, min(100.0, round(100 * c / t, 1)), a, z, nm) for mat, (c, t, a, z, nm) in mats.items()),
                      key=lambda e: -e[1])
        loot = [e for e in loot if e[1] >= MIN_PCT]
        if not loot:
            continue
        items = ", ".join("{ %d, %s, %d, %d, %s }" % (m, p, a, z, lua_str(nm)) for m, p, a, z, nm in loot)
        lines.append('    { q = %d, cls = %s, lo = %d, hi = %d, loot = { %s } },' % (
            q, lua_str("weapon" if cls == 2 else "armor"), lo, hi, items))
        n += 1
    with open(os.path.join(ROOT, "Data", client, "Enchanting.lua"), "w", encoding="utf-8") as f:
        f.write("\n".join(lines + ["}"]) + "\n")
    print("%s: %d tramos" % (client, n))


if __name__ == "__main__":
    if len(sys.argv) not in (4, 5):
        sys.exit(__doc__)
    main(*sys.argv[1:])
