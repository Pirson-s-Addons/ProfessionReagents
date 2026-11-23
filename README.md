<h1 align="center">Profession Reagents</h1>

<p align="center"><b>English</b> · <a href="README.es.md">Español</a></p>

<p align="center">
<a href="https://www.curseforge.com/wow/addons/profession-reagents"><b>CurseForge</b></a> ·
<a href="https://github.com/Pirson-s-Addons/ProfessionReagents/releases/latest"><b>Download</b></a>
</p>

## What it does

**Profession Reagents** adds to the tooltip of every profession reagent the professions that use it and the skill levels where they do: from the first recipe you can learn to the last one that still gives skill points.

```
Copper Ore
Crafting Reagent
Mining                 1-70
```

## Features

- **Every profession**: Alchemy, Blacksmithing, Enchanting, Engineering, Jewelcrafting, Inscription, Leatherworking, Tailoring, Mining (smelting), Cooking and First Aid.
- **Data for your client**: built from the game's own recipe tables for WoW Forever, Classic Era, TBC, Wrath, Cataclysm, Mists, Legion (also WoD), BfA, Shadowlands and Retail. In Retail each expansion line shows on its own (Classic Blacksmithing, Khaz Algar Blacksmithing...).
- Profession names in your game language, settings in the game's own **Options → AddOns** panel, 20 languages, no libraries.

## Usage

- Hover any reagent. That's it. If you know the profession, the range takes the game's difficulty colors for your skill: red = not yet, orange/yellow/green = useful now, gray = you're past it.
- `/preag` opens the settings: turn the tooltip lines on or off, and show or hide the level range.

## Installation

1. Download the zip from [CurseForge](https://www.curseforge.com/wow/addons/profession-reagents) or the [latest release](https://github.com/Pirson-s-Addons/ProfessionReagents/releases/latest).
2. Extract the `ProfessionReagents` folder into `World of Warcraft/<_forever_ | _classic_era_ | _classic_ | _retail_>/Interface/AddOns/`.
3. Restart WoW and enable the addon.

## Notes

- Retail recipes from Dragonflight on have no skill range in the game data (they use recipe difficulty instead): for them only the profession shows.

## For addon authors

<details>
<summary><b>Public API</b></summary>

Read-only, versioned, always returns new tables. Add `## OptionalDeps: ProfessionReagents` to your TOC. `item` is an itemID, an item link or a name (the name only if the client already knows the item).

```lua
local api = ProfessionReagentsAPI
if api and api.version == 1 then
    api.GetUses(2770)          -- { { skillLine, root, profession, min, max }, ... } or nil
    api.IsReagent("Copper Ore") -- true / false
    api.GetProfessionName(164) -- "Blacksmithing" in the client language
    api.GetReagentsFor(164, 50) -- { { itemID, skillLine, min, max }, ... } used at skill 50
end
```

`skillLine` is the profession line (164 Blacksmithing, 186 Mining...). In Retail every expansion has its own line and `root` says which profession it belongs to. `min`/`max` are nil when the recipes have no range.
</details>

<br/>

<p align="center"><a href="https://github.com/Pirson-s-Addons"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-footer-en.svg" width="100%" alt="Part of Pirson's Addons. See all addons."/></a></p>
