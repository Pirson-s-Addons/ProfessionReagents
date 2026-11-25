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

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "마력 추출과 채집"
L["DE_ENABLE"] = "마력 추출 결과 표시"
L["DE_ALWAYS"] = "마법부여사가 아니어도"
L["DE_PRICE"] = "평균 가치 표시 (Auctionator)"
L["DE_SOURCES"] = "마법부여 재료 출처 표시"
L["GATHER_ENABLE"] = "광맥과 약초 전리품 표시"
L["DE_TITLE"] = "마력 추출"
L["DE_VALUE"] = "평균 가치"
L["DE_FROM"] = "추출 출처"
L["GATHER_TITLE"] = "획득 가능"
L["ILVL"] = "레벨"
L["QUALITY_2"] = "고급"
L["QUALITY_3"] = "희귀"
L["QUALITY_4"] = "영웅"
L["ARMOR"] = "방어구"
L["WEAPONS"] = "무기"
L["TT_DE_ENABLE"] = "녹색, 파란색, 보라색 무기와 방어구에서: 마력 추출로 얻는 재료와 확률, 수량."
L["TT_DE_ALWAYS"] = "기본적으로 마력 추출 결과는 마법부여를 아는 캐릭터에만 표시됩니다."
L["TT_DE_PRICE"] = "Auctionator가 설치되어 있으면, 마력 추출로 얻는 것의 평균 경매장 가치."
L["TT_DE_SOURCES"] = "가루, 정수, 파편에서: 마력 추출 시 이를 주는 아이템 등급과 레벨."
L["TT_GATHER_ENABLE"] = "광맥이나 약초에 마우스를 올리면: 얻을 수 있는 것과 각 아이템의 확률. GatherRadar가 있으면 모든 언어에서, 없으면 영어에서만 작동합니다."
