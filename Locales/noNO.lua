local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- NORSK (noNO)
-- ==========================================
local locale = GetLocale()
if locale ~= "noNO" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Innstillinger for Profession Reagents"
L["GENERAL"] = "Generelt"
L["TOOLTIP_HEADER"] = "Gjenstandsbeskrivelser"
L["TOOLTIP_TITLE"] = "Yrker"
L["ENABLE"] = "Vis yrker i beskrivelsen av ingredienser"
L["TT_ENABLE"] = "Legger til yrkene som bruker hver yrkesingrediens i beskrivelsen dens."
L["SHOW_RANGE"] = "Vis nivåområde"
L["TT_SHOW_RANGE"] = "Ved siden av hvert yrke vises ferdighetsnivåene der oppskriftene bruker ingrediensen: fra den første oppskriften du kan lære til den siste som fortsatt gir poeng."
L["DEFAULTS"] = "Standardverdier"
L["TT_DEFAULTS"] = "Tilbakestiller alle innstillinger til standardverdiene."
L["VERSION"] = "Versjon:"
L["AUTHOR"] = "Forfatter:"
L["LINKS"] = "Lenker"
L["COMMANDS"] = "Kommandoer"
L["SELECT"] = "Merk"
L["TT_SELECT"] = "Merker hele lenken slik at du kan kopiere den med Ctrl+C. WoW lar ikke tillegg skrive til utklippstavlen, så det siste steget tar du selv."
L["ABOUT_DESC"] = "Viser i beskrivelsen av hver yrkesingrediens hvilke yrker som bruker den og på hvilke nivåer. Innstillingene finner du under Generelt."
L["CMD_OPEN"] = "Åpner innstillingene."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Disenchant og innsamling"
L["DE_ENABLE"] = "Vis disenchant-resultater"
L["DE_ALWAYS"] = "Også om du ikke er enchanter"
L["DE_PRICE"] = "Vis snittverdi (Auctionator)"
L["DE_SOURCES"] = "Vis hvor enchanting-materialer kommer fra"
L["GATHER_ENABLE"] = "Vis bytte fra malmårer og urter"
L["DE_TITLE"] = "Disenchant"
L["DE_VALUE"] = "Snittverdi"
L["DE_FROM"] = "Disenchantes fra"
L["GATHER_TITLE"] = "Kan gi"
L["ILVL"] = "nivå"
