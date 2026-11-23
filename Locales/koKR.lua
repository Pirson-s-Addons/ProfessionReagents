local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- 한국어 (koKR)
-- ==========================================
local locale = GetLocale()
if locale ~= "koKR" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Profession Reagents 설정"
L["GENERAL"] = "일반"
L["TOOLTIP_HEADER"] = "아이템 툴팁"
L["TOOLTIP_TITLE"] = "전문 기술"
L["ENABLE"] = "재료 툴팁에 전문 기술 표시"
L["TT_ENABLE"] = "모든 전문 기술 재료의 툴팁에 그 재료를 사용하는 전문 기술을 추가합니다."
L["SHOW_RANGE"] = "숙련도 범위 표시"
L["TT_SHOW_RANGE"] = "각 전문 기술 옆에 해당 제조법이 재료를 사용하는 숙련도 범위를 표시합니다: 배울 수 있는 첫 제조법부터 아직 숙련도가 오르는 마지막 제조법까지."
L["DEFAULTS"] = "기본값"
L["TT_DEFAULTS"] = "모든 설정을 기본값으로 되돌립니다."
L["VERSION"] = "버전:"
L["AUTHOR"] = "제작자:"
L["LINKS"] = "링크"
L["COMMANDS"] = "명령어"
L["SELECT"] = "선택"
L["TT_SELECT"] = "Ctrl+C로 복사할 수 있도록 링크 전체를 선택합니다. WoW는 애드온이 클립보드에 쓰는 것을 허용하지 않으므로 마지막 단계는 직접 해야 합니다."
L["ABOUT_DESC"] = "모든 전문 기술 재료의 툴팁에 어떤 전문 기술이 어느 숙련도에서 사용하는지 보여줍니다. 설정은 일반에 있습니다."
L["CMD_OPEN"] = "설정을 엽니다."
