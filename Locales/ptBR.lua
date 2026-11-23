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
