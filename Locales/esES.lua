local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- ESPAÑOL (esES / esMX)
-- ==========================================
local locale = GetLocale()
if locale ~= "esES" and locale ~= "esMX" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Opciones de Profession Reagents"
L["GENERAL"] = "General"
L["TOOLTIP_HEADER"] = "Fichas de objeto"
L["TOOLTIP_TITLE"] = "Profesiones"
L["ENABLE"] = "Mostrar las profesiones en la ficha de los componentes"
L["TT_ENABLE"] = "Añade a la ficha de cada componente de profesión las profesiones que lo usan."
L["SHOW_RANGE"] = "Mostrar el rango de nivel"
L["TT_SHOW_RANGE"] = "Junto a cada profesión, los niveles en los que sus recetas usan el componente: desde la primera receta que puedes aprender hasta la última que aún da puntos."
L["DEFAULTS"] = "Valores por defecto"
L["TT_DEFAULTS"] = "Restablece todos los ajustes a sus valores por defecto."
L["VERSION"] = "Versión:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Enlaces"
L["COMMANDS"] = "Comandos"
L["SELECT"] = "Seleccionar"
L["TT_SELECT"] = "Selecciona el enlace entero para que puedas copiarlo con Ctrl+C. WoW no deja a los addons escribir en el portapapeles, así que el último paso lo das tú."
L["ABOUT_DESC"] = "Muestra en la ficha de cada componente de profesión qué profesiones lo usan y en qué niveles. Los ajustes están en General."
L["CMD_OPEN"] = "Abre los ajustes."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Desencantar y recolección"
L["DE_ENABLE"] = "Mostrar qué sale al desencantar"
L["TT_DE_ENABLE"] = "En armas y armaduras verdes, azules y moradas: los materiales que salen al desencantarlas y su probabilidad."
L["DE_ALWAYS"] = "También si no eres encantador"
L["TT_DE_ALWAYS"] = "Por defecto solo sale en personajes que saben Encantamiento."
L["DE_PRICE"] = "Mostrar valor medio (Auctionator)"
L["TT_DE_PRICE"] = "Con Auctionator instalado, el valor medio en subasta de lo que sale al desencantar el objeto."
L["DE_SOURCES"] = "Mostrar de dónde salen los materiales de encantamiento"
L["TT_DE_SOURCES"] = "En polvos, esencias y fragmentos: qué calidades y niveles de objeto los dan al desencantar."
L["GATHER_ENABLE"] = "Mostrar qué sale de menas y plantas"
L["TT_GATHER_ENABLE"] = "Al pasar el ratón por una mena o una planta: lo que puede dar y la probabilidad de cada objeto. Con GatherRadar instalado funciona en cualquier idioma del juego; sin él, solo en inglés."
L["DE_TITLE"] = "Desencantar"
L["DE_VALUE"] = "Valor medio"
L["DE_FROM"] = "Sale al desencantar"
L["GATHER_TITLE"] = "Puede dar"
L["ILVL"] = "nv."
