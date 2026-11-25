local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- ČEŠTINA (csCZ)
-- ==========================================
local locale = GetLocale()
if locale ~= "csCZ" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Nastavení Profession Reagents"
L["GENERAL"] = "Obecné"
L["TOOLTIP_HEADER"] = "Popisky předmětů"
L["TOOLTIP_TITLE"] = "Profese"
L["ENABLE"] = "Zobrazovat profese v popisku surovin"
L["TT_ENABLE"] = "Přidá do popisku každé profesní suroviny profese, které ji používají."
L["SHOW_RANGE"] = "Zobrazovat rozsah úrovně"
L["TT_SHOW_RANGE"] = "Vedle každé profese úrovně dovednosti, na kterých její recepty surovinu používají: od prvního receptu, který se můžeš naučit, po poslední, který ještě dává body."
L["DEFAULTS"] = "Výchozí hodnoty"
L["TT_DEFAULTS"] = "Obnoví všechna nastavení na výchozí hodnoty."
L["VERSION"] = "Verze:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Odkazy"
L["COMMANDS"] = "Příkazy"
L["SELECT"] = "Vybrat"
L["TT_SELECT"] = "Vybere celý odkaz, abys ho mohl zkopírovat pomocí Ctrl+C. WoW nedovolí doplňkům zapisovat do schránky, takže poslední krok je na tobě."
L["ABOUT_DESC"] = "Zobrazuje v popisku každé profesní suroviny, které profese ji používají a na jakých úrovních. Nastavení najdeš v sekci Obecné."
L["CMD_OPEN"] = "Otevře nastavení."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Rozčarování a sběr"
L["DE_ENABLE"] = "Zobrazit výsledky rozčarování"
L["DE_ALWAYS"] = "I když nejsi enchanter"
L["DE_PRICE"] = "Zobrazit průměrnou hodnotu (Auctionator)"
L["DE_SOURCES"] = "Zobrazit původ materiálů"
L["GATHER_ENABLE"] = "Zobrazit kořist z žil a bylin"
L["DE_TITLE"] = "Rozčarování"
L["DE_VALUE"] = "Průměrná hodnota"
L["DE_FROM"] = "Rozčarováno z"
L["GATHER_TITLE"] = "Může dát"
L["ILVL"] = "úr."
