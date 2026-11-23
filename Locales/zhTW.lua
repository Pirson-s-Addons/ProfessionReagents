local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- 繁體中文 (zhTW)
-- ==========================================
local locale = GetLocale()
if locale ~= "zhTW" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Profession Reagents 選項"
L["GENERAL"] = "一般"
L["TOOLTIP_HEADER"] = "物品提示"
L["TOOLTIP_TITLE"] = "專業技能"
L["ENABLE"] = "在材料提示中顯示專業"
L["TT_ENABLE"] = "在每種專業材料的提示中加入使用它的專業。"
L["SHOW_RANGE"] = "顯示技能等級範圍"
L["TT_SHOW_RANGE"] = "在每個專業旁顯示其配方使用該材料的技能等級：從可學習的第一個配方到仍能提升技能的最後一個配方。"
L["DEFAULTS"] = "預設值"
L["TT_DEFAULTS"] = "將所有設定恢復為預設值。"
L["VERSION"] = "版本："
L["AUTHOR"] = "作者："
L["LINKS"] = "連結"
L["COMMANDS"] = "指令"
L["SELECT"] = "選取"
L["TT_SELECT"] = "選取整個連結，讓你可以用 Ctrl+C 複製。WoW 不允許插件寫入剪貼簿，所以最後一步要由你完成。"
L["ABOUT_DESC"] = "在每種專業材料的提示中顯示哪些專業使用它以及在哪些技能等級使用。設定位於「一般」。"
L["CMD_OPEN"] = "開啟設定。"
