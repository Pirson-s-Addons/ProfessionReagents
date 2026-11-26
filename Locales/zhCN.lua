local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- 简体中文 (zhCN)
-- ==========================================
local locale = GetLocale()
if locale ~= "zhCN" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Profession Reagents 选项"
L["GENERAL"] = "常规"
L["TOOLTIP_HEADER"] = "物品提示"
L["TOOLTIP_TITLE"] = "专业技能"
L["ENABLE"] = "在材料提示中显示专业"
L["TT_ENABLE"] = "在每种专业材料的提示中添加使用它的专业。"
L["SHOW_RANGE"] = "显示技能等级范围"
L["TT_SHOW_RANGE"] = "在每个专业旁显示其配方使用该材料的技能等级：从可学习的第一个配方到仍能提升技能的最后一个配方。"
L["DEFAULTS"] = "默认值"
L["TT_DEFAULTS"] = "将所有设置恢复为默认值。"
L["VERSION"] = "版本："
L["AUTHOR"] = "作者："
L["LINKS"] = "链接"
L["COMMANDS"] = "命令"
L["SELECT"] = "选择"
L["TT_SELECT"] = "选中整个链接，以便你用 Ctrl+C 复制。WoW 不允许插件写入剪贴板，所以最后一步需要你自己完成。"
L["ABOUT_DESC"] = "在每种专业材料的提示中显示哪些专业使用它以及在哪些技能等级使用。设置位于“一般”。"
L["CMD_OPEN"] = "打开设置。"

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "分解与采集"
L["DE_ENABLE"] = "显示分解结果"
L["DE_ALWAYS"] = "即使你不是附魔师"
L["DE_PRICE"] = "显示平均价值 (Auctionator)"
L["DE_SOURCES"] = "显示附魔材料来源"
L["GATHER_ENABLE"] = "显示矿脉和草药的掉落"
L["DE_TITLE"] = "分解"
L["DE_VALUE"] = "平均价值"
L["DE_FROM"] = "分解自"
L["GATHER_TITLE"] = "可获得"
L["PROSPECT_TITLE"] = "勘探可得"
L["MILL_TITLE"] = "研磨可得"
L["ILVL"] = "等级"
L["QUALITY_2"] = "优秀"
L["QUALITY_3"] = "精良"
L["QUALITY_4"] = "史诗"
L["ARMOR"] = "护甲"
L["WEAPONS"] = "武器"
L["TT_DE_ENABLE"] = "绿色、蓝色和紫色武器与护甲上：分解后能得到的材料及其几率和数量。"
L["TT_DE_ALWAYS"] = "默认只在会附魔的角色上显示分解结果。"
L["TT_DE_PRICE"] = "安装了 Auctionator 时，分解该物品所得的平均拍卖价值。"
L["TT_DE_SOURCES"] = "在尘、精华和碎片上：哪些品质和等级的物品分解会得到它们。"
L["TT_GATHER_ENABLE"] = "鼠标指向矿脉或草药时：可能获得的物品及各自几率。安装 GatherRadar 后支持所有游戏语言；否则仅限英文。"
