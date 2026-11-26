local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- PORTUGUÊS (ptBR)
-- ==========================================
local locale = GetLocale()
if locale ~= "ptBR" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Opções do Profession Reagents"
L["GENERAL"] = "Geral"
L["TOOLTIP_HEADER"] = "Dicas de itens"
L["TOOLTIP_TITLE"] = "Profissões"
L["ENABLE"] = "Mostrar as profissões na dica dos reagentes"
L["TT_ENABLE"] = "Adiciona à dica de cada reagente de profissão as profissões que o usam."
L["SHOW_RANGE"] = "Mostrar a faixa de nível"
L["TT_SHOW_RANGE"] = "Ao lado de cada profissão, os níveis de perícia em que suas receitas usam o reagente: da primeira receita que você pode aprender até a última que ainda dá pontos."
L["DEFAULTS"] = "Valores padrão"
L["TT_DEFAULTS"] = "Restaura todas as configurações para os valores padrão."
L["VERSION"] = "Versão:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Links"
L["COMMANDS"] = "Comandos"
L["SELECT"] = "Selecionar"
L["TT_SELECT"] = "Seleciona o link inteiro para você copiá-lo com Ctrl+C. O WoW não deixa addons escreverem na área de transferência, então o último passo é seu."
L["ABOUT_DESC"] = "Mostra na dica de cada reagente de profissão quais profissões o usam e em quais níveis. As configurações estão em Geral."
L["CMD_OPEN"] = "Abre as configurações."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Desencantar e coleta"
L["DE_ENABLE"] = "Mostrar resultados de desencantamento"
L["TT_DE_ENABLE"] = "Em armas e armaduras verdes, azuis e roxas: os materiais que saem ao desencantar, com a chance."
L["DE_ALWAYS"] = "Mesmo sem ser encantador"
L["TT_DE_ALWAYS"] = "Por padrão, só para personagens que sabem Encantamento."
L["DE_PRICE"] = "Mostrar valor médio (Auctionator)"
L["TT_DE_PRICE"] = "Com Auctionator: o valor médio no leilão do que sai ao desencantar."
L["DE_SOURCES"] = "Mostrar de onde vêm os materiais"
L["TT_DE_SOURCES"] = "Em pós, essências e fragmentos: quais qualidades e níveis de item os dão."
L["GATHER_ENABLE"] = "Mostrar o saque de veios e ervas"
L["TT_GATHER_ENABLE"] = "Ao passar o mouse por um veio ou erva: o que pode dar e a chance de cada item. Com GatherRadar em qualquer idioma; sem ele, só em inglês."
L["DE_TITLE"] = "Desencantar"
L["DE_VALUE"] = "Valor médio"
L["DE_FROM"] = "Desencantado de"
L["GATHER_TITLE"] = "Pode dar"
L["PROSPECT_TITLE"] = "Prospecção dá"
L["MILL_TITLE"] = "Moagem dá"
L["ILVL"] = "nv."
L["QUALITY_2"] = "Incomum"
L["QUALITY_3"] = "Raro"
L["QUALITY_4"] = "Épico"
L["ARMOR"] = "armadura"
L["WEAPONS"] = "armas"
