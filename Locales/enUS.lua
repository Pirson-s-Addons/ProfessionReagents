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
