local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- ITALIANO (itIT)
-- ==========================================
local locale = GetLocale()
if locale ~= "itIT" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Opzioni di Profession Reagents"
L["GENERAL"] = "Generale"
L["TOOLTIP_HEADER"] = "Tooltip degli oggetti"
L["TOOLTIP_TITLE"] = "Professioni"
L["ENABLE"] = "Mostra le professioni nel tooltip dei reagenti"
L["TT_ENABLE"] = "Aggiunge al tooltip di ogni reagente di professione le professioni che lo usano."
L["SHOW_RANGE"] = "Mostra l'intervallo di livello"
L["TT_SHOW_RANGE"] = "Accanto a ogni professione, i livelli di abilità in cui le sue ricette usano il reagente: dalla prima ricetta che puoi imparare all'ultima che dà ancora punti."
L["DEFAULTS"] = "Valori predefiniti"
L["TT_DEFAULTS"] = "Ripristina tutte le impostazioni ai valori predefiniti."
L["VERSION"] = "Versione:"
L["AUTHOR"] = "Autore:"
L["LINKS"] = "Collegamenti"
L["COMMANDS"] = "Comandi"
L["SELECT"] = "Seleziona"
L["TT_SELECT"] = "Seleziona l'intero link così puoi copiarlo con Ctrl+C. WoW non permette agli addon di scrivere negli appunti, quindi l'ultimo passo spetta a te."
L["ABOUT_DESC"] = "Mostra nel tooltip di ogni reagente di professione quali professioni lo usano e a quali livelli. Le impostazioni sono in Generale."
L["CMD_OPEN"] = "Apre le impostazioni."
