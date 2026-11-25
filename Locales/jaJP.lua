local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- 日本語 (jaJP)
-- ==========================================
local locale = GetLocale()
if locale ~= "jaJP" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Profession Reagents の設定"
L["GENERAL"] = "一般"
L["TOOLTIP_HEADER"] = "アイテムのツールチップ"
L["TOOLTIP_TITLE"] = "専門職"
L["ENABLE"] = "素材のツールチップに専門職を表示"
L["TT_ENABLE"] = "各専門職素材のツールチップに、それを使う専門職を追加します。"
L["SHOW_RANGE"] = "スキルレベルの範囲を表示"
L["TT_SHOW_RANGE"] = "各専門職の横に、そのレシピが素材を使うスキルレベルを表示します：習得できる最初のレシピから、まだポイントが上がる最後のレシピまで。"
L["DEFAULTS"] = "初期設定に戻す"
L["TT_DEFAULTS"] = "すべての設定を初期値に戻します。"
L["VERSION"] = "バージョン："
L["AUTHOR"] = "作者："
L["LINKS"] = "リンク"
L["COMMANDS"] = "コマンド"
L["SELECT"] = "選択"
L["TT_SELECT"] = "Ctrl+Cでコピーできるようにリンク全体を選択します。WoWはアドオンがクリップボードに書き込むことを許可していないため、最後の手順はご自身で行ってください。"
L["ABOUT_DESC"] = "各専門職素材のツールチップに、どの専門職がどのスキルレベルで使うかを表示します。設定は「一般」にあります。"
L["CMD_OPEN"] = "設定を開きます。"

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "分解と採集"
L["DE_ENABLE"] = "分解結果を表示"
L["DE_ALWAYS"] = "エンチャンターでなくても"
L["DE_PRICE"] = "平均価値を表示 (Auctionator)"
L["DE_SOURCES"] = "エンチャント素材の入手元を表示"
L["GATHER_ENABLE"] = "鉱脈と薬草の入手物を表示"
L["DE_TITLE"] = "分解"
L["DE_VALUE"] = "平均価値"
L["DE_FROM"] = "分解元"
L["GATHER_TITLE"] = "入手可能"
L["ILVL"] = "Lv"
