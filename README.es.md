<h1 align="center">Profession Reagents</h1>

<p align="center"><a href="README.md">English</a> · <b>Español</b></p>

<p align="center">
<a href="https://www.curseforge.com/wow/addons/profession-reagents"><b>CurseForge</b></a> ·
<a href="https://github.com/Pirson-s-Addons/ProfessionReagents/releases/latest"><b>Descargar</b></a>
</p>

## Qué hace

**Profession Reagents** añade a la ficha de cada componente de profesión las profesiones que lo usan y los niveles en los que lo hacen: desde la primera receta que puedes aprender hasta la última que aún da puntos.

```
Mineral de cobre
Componente de profesión
Minería                1-70
```

## Funciones

- **Todas las profesiones**: Alquimia, Herrería, Encantamiento, Ingeniería, Joyería, Inscripción, Peletería, Sastrería, Minería (fundición), Cocina y Primeros auxilios.
- **Datos de tu cliente**: sacados de las tablas de recetas del propio juego para WoW Forever, Classic Era, TBC, Wrath, Cataclysm, Mists, Legion (también WoD), BfA, Shadowlands y Retail. En Retail cada línea de expansión sale aparte (Herrería clásica, Herrería de Khaz Algar...).
- **Extras en WoW Forever**: qué sale al desencantar un objeto verde, azul o morado (si eres encantador, o para todos con una opción) y su valor medio con Auctionator; en polvos, esencias y fragmentos, de qué objetos salen; y al pasar el ratón por una mena o una planta, qué puede dar y con qué frecuencia.
- Nombres de las profesiones en el idioma de tu juego, ajustes en el panel **Opciones → Accesorios** del propio juego, 20 idiomas, sin librerías.

## Uso

- Pasa el ratón por cualquier componente. Nada más. Si conoces la profesión, el rango sale con los colores de dificultad del juego según tu nivel: rojo = aún no, naranja/amarillo/verde = te sirve ahora, gris = ya te has pasado.
- `/preag` abre los ajustes: activar o quitar las líneas de la ficha, y mostrar u ocultar el rango de nivel.

## Instalación

1. Descarga el zip de [CurseForge](https://www.curseforge.com/wow/addons/profession-reagents) o de la [última versión](https://github.com/Pirson-s-Addons/ProfessionReagents/releases/latest).
2. Extrae la carpeta `ProfessionReagents` en `World of Warcraft/<_forever_ | _classic_era_ | _classic_ | _retail_>/Interface/AddOns/`.
3. Reinicia WoW y activa el addon.

## Notas

- Las probabilidades de desencantar y de recolección son las observadas por los usuarios de [Wowhead](https://www.wowhead.com/forever), no tablas oficiales. Las fichas de los nodos funcionan en cualquier idioma del juego con [GatherRadar](https://www.curseforge.com/wow/addons/gather-radar) instalado; sin él, solo en inglés.

- Las recetas de Retail desde Dragonflight no traen rango de nivel en los datos del juego (usan la dificultad de la receta): en esas solo sale la profesión.

## Para autores de addons

<details>
<summary><b>API pública</b></summary>

Solo lectura, versionada, siempre devuelve tablas nuevas. Añade `## OptionalDeps: ProfessionReagents` a tu TOC. `item` es un itemID, un enlace o un nombre (el nombre solo si el cliente ya conoce el objeto).

```lua
local api = ProfessionReagentsAPI
if api and api.version == 1 then
    api.GetUses(2770)          -- { { skillLine, root, profession, min, max }, ... } o nil
    api.IsReagent("Copper Ore") -- true / false
    api.GetProfessionName(164) -- "Herrería" en el idioma del cliente
    api.GetReagentsFor(164, 50) -- { { itemID, skillLine, min, max }, ... } usados a nivel 50
end
```

`skillLine` es la línea de profesión (164 Herrería, 186 Minería...). En Retail cada expansión tiene la suya y `root` dice de qué profesión cuelga. `min`/`max` son nil si las recetas no traen rango.
</details>

<br/>

<p align="center"><a href="https://github.com/Pirson-s-Addons"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-footer-es.svg" width="100%" alt="Parte de Pirson's Addons. Ver todos los addons."/></a></p>
