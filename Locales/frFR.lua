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
