local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- FRANÇAIS (frFR)
-- ==========================================
local locale = GetLocale()
if locale ~= "frFR" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Options de Profession Reagents"
L["GENERAL"] = "Général"
L["TOOLTIP_HEADER"] = "Infobulles d'objet"
L["TOOLTIP_TITLE"] = "Métiers"
L["ENABLE"] = "Afficher les métiers dans l'infobulle des composants"
L["TT_ENABLE"] = "Ajoute à l'infobulle de chaque composant de métier les métiers qui l'utilisent."
L["SHOW_RANGE"] = "Afficher la tranche de niveau"
L["TT_SHOW_RANGE"] = "À côté de chaque métier, les niveaux de compétence auxquels ses recettes utilisent le composant : de la première recette apprenable à la dernière qui rapporte encore des points."
L["DEFAULTS"] = "Valeurs par défaut"
L["TT_DEFAULTS"] = "Rétablit tous les réglages à leurs valeurs par défaut."
L["VERSION"] = "Version :"
L["AUTHOR"] = "Auteur :"
L["LINKS"] = "Liens"
L["COMMANDS"] = "Commandes"
L["SELECT"] = "Sélectionner"
L["TT_SELECT"] = "Sélectionne le lien entier pour que tu puisses le copier avec Ctrl+C. WoW ne laisse pas les addons écrire dans le presse-papiers, la dernière étape est donc pour toi."
L["ABOUT_DESC"] = "Affiche dans l'infobulle de chaque composant de métier les métiers qui l'utilisent et à quels niveaux. Les réglages sont dans Général."
L["CMD_OPEN"] = "Ouvre les réglages."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Désenchantement et récolte"
L["DE_ENABLE"] = "Afficher les résultats de désenchantement"
L["TT_DE_ENABLE"] = "Sur les armes et armures vertes, bleues et violettes : les composants obtenus en les désenchantant, avec leur probabilité."
L["DE_ALWAYS"] = "Même si tu n'es pas enchanteur"
L["TT_DE_ALWAYS"] = "Par défaut, seulement pour les personnages qui connaissent l'Enchantement."
L["DE_PRICE"] = "Afficher la valeur moyenne (Auctionator)"
L["TT_DE_PRICE"] = "Avec Auctionator : la valeur moyenne à l'hôtel des ventes de ce que donne le désenchantement."
L["DE_SOURCES"] = "Afficher l'origine des composants d'enchantement"
L["TT_DE_SOURCES"] = "Sur les poussières, essences et éclats : quelles qualités et niveaux d'objet les donnent."
L["GATHER_ENABLE"] = "Afficher le butin des filons et des herbes"
L["TT_GATHER_ENABLE"] = "En survolant un filon ou une herbe : ce qu'il peut donner et la probabilité de chaque objet. Avec GatherRadar, dans toutes les langues ; sans, en anglais seulement."
L["DE_TITLE"] = "Désenchantement"
L["DE_VALUE"] = "Valeur moyenne"
L["DE_FROM"] = "Désenchanté depuis"
L["GATHER_TITLE"] = "Peut donner"
L["ILVL"] = "niv."
L["QUALITY_2"] = "Inhabituel"
L["QUALITY_3"] = "Rare"
L["QUALITY_4"] = "Épique"
L["ARMOR"] = "armure"
L["WEAPONS"] = "armes"
