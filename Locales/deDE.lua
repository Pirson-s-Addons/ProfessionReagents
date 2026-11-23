local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- DEUTSCH (deDE)
-- ==========================================
local locale = GetLocale()
if locale ~= "deDE" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Profession Reagents – Optionen"
L["GENERAL"] = "Allgemein"
L["TOOLTIP_HEADER"] = "Gegenstands-Tooltips"
L["TOOLTIP_TITLE"] = "Berufe"
L["ENABLE"] = "Berufe im Tooltip von Reagenzien anzeigen"
L["TT_ENABLE"] = "Fügt dem Tooltip jedes Berufsreagenz die Berufe hinzu, die es verwenden."
L["SHOW_RANGE"] = "Fertigkeitsbereich anzeigen"
L["TT_SHOW_RANGE"] = "Neben jedem Beruf die Fertigkeitsstufen, auf denen seine Rezepte das Reagenz verwenden: vom ersten erlernbaren Rezept bis zum letzten, das noch Punkte gibt."
L["DEFAULTS"] = "Standardwerte"
L["TT_DEFAULTS"] = "Setzt alle Einstellungen auf ihre Standardwerte zurück."
L["VERSION"] = "Version:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Links"
L["COMMANDS"] = "Befehle"
L["SELECT"] = "Auswählen"
L["TT_SELECT"] = "Markiert den ganzen Link, damit du ihn mit Strg+C kopieren kannst. WoW erlaubt Addons nicht, in die Zwischenablage zu schreiben, den letzten Schritt machst also du."
L["ABOUT_DESC"] = "Zeigt im Tooltip jedes Berufsreagenz, welche Berufe es verwenden und auf welchen Fertigkeitsstufen. Die Einstellungen findest du unter Allgemein."
L["CMD_OPEN"] = "Öffnet die Einstellungen."
