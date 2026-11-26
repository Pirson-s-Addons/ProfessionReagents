"""Nombre de cada nodo (menas, plantas, tesoros) en los idiomas del cliente, desde
Wowhead (seccion WoW Forever), para reconocer la ficha del nodo sin GatherRadar.

Cache en tools/wowhead/forever/node_names.txt (oid|locale|nombre): solo pide lo que falta.
Escribe Data/Forever/NodeNames.lua. Uso: python tools/wowhead_node_names.py
"""
import json, os, time, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(HERE, "wowhead", "forever")
CACHE = os.path.join(SRC, "node_names.txt")
OUT = os.path.join(HERE, "..", "Data", "Forever", "NodeNames.lua")
# locale de Wowhead -> locale del cliente (itIT no tiene nombres propios: sale en ingles)
LOCALES = {1: "koKR", 2: "frFR", 3: "deDE", 4: "zhCN", 6: "esES", 7: "ruRU", 8: "ptBR", 9: "itIT", 10: "zhTW", 11: "esMX"}


def nodes():
    """Nombre ingles -> ID de objeto con mas muestras (como forever_extras.py)."""
    best = {}
    for f in ("nodes.txt", "treasure.txt"):
        for line in open(os.path.join(SRC, f), encoding="utf-8"):
            if line.strip():
                oid, _, _, name, samples, _ = line.strip().split("|", 5)
                if name not in best or int(samples) > best[name][0]:
                    best[name] = (int(samples), int(oid))
    return {name: oid for name, (_, oid) in best.items()}


def fetch(oid, loc):
    url = f"https://nether.wowhead.com/forever/tooltip/object/{oid}?locale={loc}"
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    for attempt in range(4):
        try:
            with urllib.request.urlopen(req, timeout=20) as r:
                return json.load(r).get("name")
        except Exception:
            time.sleep(5 * (attempt + 1))
    return None


def lua_str(s):
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def main():
    cache = {}
    if os.path.exists(CACHE):
        for line in open(CACHE, encoding="utf-8"):
            oid, loc, name = line.rstrip("\n").split("|", 2)
            cache[(int(oid), loc)] = name
    with open(CACHE, "a", encoding="utf-8") as out:
        for english, oid in sorted(nodes().items()):
            for wloc, loc in LOCALES.items():
                if (oid, loc) in cache:
                    continue
                name = fetch(oid, wloc)
                if name:
                    cache[(oid, loc)] = name
                    out.write(f"{oid}|{loc}|{name}\n")
                    out.flush()
                time.sleep(1.1)  # mas de 1 peticion/s da 403

    by_loc = {}
    for english, oid in nodes().items():
        for loc in LOCALES.values():
            name = cache.get((oid, loc))
            if name and name != english:
                by_loc.setdefault(loc, {})[name] = english
    lines = [
        "-- Generado por tools/wowhead_node_names.py desde Wowhead (wowhead.com/forever): no editar a mano.",
        "-- Nombre del nodo en el idioma del cliente -> nombre ingles (clave de GATHER_NODES).",
        "local _, addon = ...",
        "local NAMES = {",
    ]
    for loc in sorted(by_loc):
        lines.append(f"    {loc} = {{")
        for name in sorted(by_loc[loc]):
            lines.append(f"        [{lua_str(name)}] = {lua_str(by_loc[loc][name])},")
        lines.append("    },")
    lines += ["}", "addon.NODE_NAMES = NAMES[GetLocale()] or {}", ""]
    with open(OUT, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines))
    print(f"{len(cache)} nombres en cache; {sum(len(v) for v in by_loc.values())} traducciones")


if __name__ == "__main__":
    main()
