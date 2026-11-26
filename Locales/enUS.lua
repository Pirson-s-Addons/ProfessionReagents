local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- IDIOMA POR DEFECTO (enUS / enGB)
-- ==========================================
-- Este fichero define TODAS las claves. Los demas Locales/<idioma>.lua se
-- cargan despues y sobrescriben las suyas; lo que falte se queda en ingles.

local L = addon.L or {}
addon.L = L

L["OPTIONS_TITLE"] = "Profession Reagents Options"
L["GENERAL"] = "General"
L["TOOLTIP_HEADER"] = "Item Tooltips"
L["TOOLTIP_TITLE"] = "Professions"
L["ENABLE"] = "Show professions in reagent tooltips"
L["TT_ENABLE"] = "Adds to the tooltip of every profession reagent the professions that use it."
L["SHOW_RANGE"] = "Show skill level range"
L["TT_SHOW_RANGE"] = "Next to each profession, the skill levels at which its recipes use the reagent: from the first recipe you can learn to the last one that still gives skill points."
L["DEFAULTS"] = "Default Values"
L["TT_DEFAULTS"] = "Reset all settings to their default values."
L["VERSION"] = "Version:"
L["AUTHOR"] = "Author:"
L["LINKS"] = "Links"
L["COMMANDS"] = "Commands"
L["SELECT"] = "Select"
L["TT_SELECT"] = "Selects the whole link so you can copy it with Ctrl+C. WoW does not let addons write to the clipboard, so the last step is yours."
L["ABOUT_DESC"] = "Shows in the tooltip of every profession reagent which professions use it and at what skill levels. The settings are in General."
L["CMD_OPEN"] = "Opens the settings."

-- Desencantar y recoleccion (Core/Extras.lua, solo WoW Forever)
L["EXTRAS_HEADER"] = "Disenchanting and Gathering"
L["DE_ENABLE"] = "Show disenchant results"
L["TT_DE_ENABLE"] = "On green, blue and purple weapons and armor: the materials you can get by disenchanting them, with their chance and amount."
L["DE_ALWAYS"] = "Also if you are not an enchanter"
L["TT_DE_ALWAYS"] = "By default the disenchant results only show on characters that know Enchanting."
L["DE_PRICE"] = "Show average value (Auctionator)"
L["TT_DE_PRICE"] = "With Auctionator installed, the average auction value of what you get by disenchanting the item."
L["DE_SOURCES"] = "Show where enchanting materials come from"
L["TT_DE_SOURCES"] = "On dusts, essences and shards: which item qualities and levels give them when disenchanted."
L["GATHER_ENABLE"] = "Show loot of ore veins and herbs"
L["TT_GATHER_ENABLE"] = "When you hover an ore vein or a herb: what it can give and the chance of each item. With GatherRadar installed it works in every game language; without it, only in English."
L["DE_TITLE"] = "Disenchant"
L["DE_VALUE"] = "Average value"
L["DE_FROM"] = "Disenchanted from"
L["GATHER_TITLE"] = "Can give"
L["PROSPECT_TITLE"] = "Prospecting gives"
L["MILL_TITLE"] = "Milling gives"
L["ILVL"] = "ilvl"
L["ARMOR"] = "armor"
L["WEAPONS"] = "weapons"
L["QUALITY_2"] = "Uncommon"
L["QUALITY_3"] = "Rare"
L["QUALITY_4"] = "Epic"
