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

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Entzaubern und Sammeln"
L["DE_ENABLE"] = "Entzauberungsergebnisse anzeigen"
L["TT_DE_ENABLE"] = "Bei grünen, blauen und lila Waffen und Rüstungen: die Materialien, die beim Entzaubern entstehen, mit Wahrscheinlichkeit."
L["DE_ALWAYS"] = "Auch wenn du kein Verzauberer bist"
L["TT_DE_ALWAYS"] = "Standardmäßig nur bei Charakteren, die Verzauberkunst beherrschen."
L["DE_PRICE"] = "Durchschnittswert anzeigen (Auctionator)"
L["TT_DE_PRICE"] = "Mit Auctionator: der durchschnittliche Auktionswert dessen, was beim Entzaubern entsteht."
L["DE_SOURCES"] = "Herkunft von Verzauberungsmaterialien anzeigen"
L["TT_DE_SOURCES"] = "Bei Staub, Essenzen und Splittern: welche Qualitäten und Gegenstandsstufen sie beim Entzaubern geben."
L["GATHER_ENABLE"] = "Beute von Erzadern und Kräutern anzeigen"
L["TT_GATHER_ENABLE"] = "Beim Überfahren einer Erzader oder eines Krauts: was es geben kann und mit welcher Wahrscheinlichkeit. Mit GatherRadar in jeder Spielsprache, sonst nur auf Englisch."
L["DE_TITLE"] = "Entzaubern"
L["DE_VALUE"] = "Durchschnittswert"
L["DE_FROM"] = "Entzaubert aus"
L["GATHER_TITLE"] = "Kann geben"
L["ILVL"] = "Stufe"
L["QUALITY_2"] = "Selten"
L["QUALITY_3"] = "Rar"
L["QUALITY_4"] = "Episch"
L["ARMOR"] = "Rüstung"
L["WEAPONS"] = "Waffen"
