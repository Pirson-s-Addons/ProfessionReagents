local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- SVENSKA (svSE)
-- ==========================================
local locale = GetLocale()
if locale ~= "svSE" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Inställningar för Profession Reagents"
L["GENERAL"] = "Allmänt"
L["TOOLTIP_HEADER"] = "Föremålsbeskrivningar"
L["TOOLTIP_TITLE"] = "Yrken"
L["ENABLE"] = "Visa yrken i beskrivningen av ingredienser"
L["TT_ENABLE"] = "Lägger till yrkena som använder varje yrkesingrediens i dess beskrivning."
L["SHOW_RANGE"] = "Visa nivåintervall"
L["TT_SHOW_RANGE"] = "Bredvid varje yrke visas färdighetsnivåerna där dess recept använder ingrediensen: från det första receptet du kan lära dig till det sista som fortfarande ger poäng."
L["DEFAULTS"] = "Standardvärden"
L["TT_DEFAULTS"] = "Återställer alla inställningar till standardvärdena."
L["VERSION"] = "Version:"
L["AUTHOR"] = "Författare:"
L["LINKS"] = "Länkar"
L["COMMANDS"] = "Kommandon"
L["SELECT"] = "Markera"
L["TT_SELECT"] = "Markerar hela länken så att du kan kopiera den med Ctrl+C. WoW låter inte tillägg skriva till urklipp, så det sista steget gör du själv."
L["ABOUT_DESC"] = "Visar i beskrivningen av varje yrkesingrediens vilka yrken som använder den och på vilka nivåer. Inställningarna finns under Allmänt."
L["CMD_OPEN"] = "Öppnar inställningarna."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Disenchant och insamling"
L["DE_ENABLE"] = "Visa disenchant-resultat"
L["DE_ALWAYS"] = "Även om du inte är enchanter"
L["DE_PRICE"] = "Visa medelvärde (Auctionator)"
L["DE_SOURCES"] = "Visa var enchanting-material kommer ifrån"
L["GATHER_ENABLE"] = "Visa byte från malmådror och örter"
L["DE_TITLE"] = "Disenchant"
L["DE_VALUE"] = "Medelvärde"
L["DE_FROM"] = "Disenchantas från"
L["GATHER_TITLE"] = "Kan ge"
L["ILVL"] = "nivå"
