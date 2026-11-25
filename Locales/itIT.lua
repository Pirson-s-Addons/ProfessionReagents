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

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Disincanto e raccolta"
L["DE_ENABLE"] = "Mostra i risultati del disincanto"
L["TT_DE_ENABLE"] = "Su armi e armature verdi, blu e viola: i materiali ottenuti disincantandole, con la probabilità."
L["DE_ALWAYS"] = "Anche se non sei incantatore"
L["TT_DE_ALWAYS"] = "Di base solo per i personaggi che conoscono Incantamento."
L["DE_PRICE"] = "Mostra valore medio (Auctionator)"
L["TT_DE_PRICE"] = "Con Auctionator: il valore medio all'asta di ciò che si ottiene disincantando."
L["DE_SOURCES"] = "Mostra da dove vengono i materiali"
L["TT_DE_SOURCES"] = "Su polveri, essenze e frammenti: quali qualità e livelli oggetto li danno."
L["GATHER_ENABLE"] = "Mostra il bottino di filoni ed erbe"
L["TT_GATHER_ENABLE"] = "Passando sopra un filone o un'erba: cosa può dare e la probabilità di ogni oggetto. Con GatherRadar in ogni lingua; senza, solo in inglese."
L["DE_TITLE"] = "Disincanto"
L["DE_VALUE"] = "Valore medio"
L["DE_FROM"] = "Disincantato da"
L["GATHER_TITLE"] = "Può dare"
L["ILVL"] = "liv."
L["QUALITY_2"] = "Non comune"
L["QUALITY_3"] = "Raro"
L["QUALITY_4"] = "Epico"
L["ARMOR"] = "armatura"
L["WEAPONS"] = "armi"
