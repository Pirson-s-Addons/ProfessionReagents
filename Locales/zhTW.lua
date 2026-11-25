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

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "分解與採集"
L["DE_ENABLE"] = "顯示分解結果"
L["DE_ALWAYS"] = "即使你不是附魔師"
L["DE_PRICE"] = "顯示平均價值 (Auctionator)"
L["DE_SOURCES"] = "顯示附魔材料來源"
L["GATHER_ENABLE"] = "顯示礦脈和草藥的掉落"
L["DE_TITLE"] = "分解"
L["DE_VALUE"] = "平均價值"
L["DE_FROM"] = "分解自"
L["GATHER_TITLE"] = "可獲得"
L["ILVL"] = "等級"
L["QUALITY_2"] = "優秀"
L["QUALITY_3"] = "精良"
L["QUALITY_4"] = "史詩"
L["ARMOR"] = "護甲"
L["WEAPONS"] = "武器"
L["TT_DE_ENABLE"] = "綠色、藍色和紫色武器與護甲上：分解後能得到的材料及其機率和數量。"
L["TT_DE_ALWAYS"] = "預設只在會附魔的角色上顯示分解結果。"
L["TT_DE_PRICE"] = "安裝了 Auctionator 時，分解該物品所得的平均拍賣價值。"
L["TT_DE_SOURCES"] = "在塵、精華和碎片上：哪些品質和等級的物品分解會得到它們。"
L["TT_GATHER_ENABLE"] = "滑鼠指向礦脈或草藥時：可能獲得的物品及各自機率。安裝 GatherRadar 後支援所有遊戲語言；否則僅限英文。"
