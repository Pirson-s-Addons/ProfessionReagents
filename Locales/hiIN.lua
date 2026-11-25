local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- हिन्दी (hiIN)
-- ==========================================
local locale = GetLocale()
if locale ~= "hiIN" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Profession Reagents विकल्प"
L["GENERAL"] = "सामान्य"
L["TOOLTIP_HEADER"] = "आइटम टूलटिप"
L["TOOLTIP_TITLE"] = "पेशे"
L["ENABLE"] = "सामग्री के टूलटिप में पेशे दिखाएँ"
L["TT_ENABLE"] = "हर पेशा सामग्री के टूलटिप में उसे इस्तेमाल करने वाले पेशे जोड़ता है।"
L["SHOW_RANGE"] = "कौशल स्तर की सीमा दिखाएँ"
L["TT_SHOW_RANGE"] = "हर पेशे के साथ वे कौशल स्तर जिन पर उसकी विधियाँ सामग्री का उपयोग करती हैं: पहली सीखी जा सकने वाली विधि से लेकर आखिरी विधि तक जो अब भी अंक देती है।"
L["DEFAULTS"] = "डिफ़ॉल्ट मान"
L["TT_DEFAULTS"] = "सभी सेटिंग्स को उनके डिफ़ॉल्ट मानों पर रीसेट करता है।"
L["VERSION"] = "संस्करण:"
L["AUTHOR"] = "लेखक:"
L["LINKS"] = "लिंक"
L["COMMANDS"] = "कमांड"
L["SELECT"] = "चुनें"
L["TT_SELECT"] = "पूरा लिंक चुनता है ताकि आप उसे Ctrl+C से कॉपी कर सकें। WoW ऐडऑन को क्लिपबोर्ड में लिखने नहीं देता, इसलिए आखिरी कदम आपका है।"
L["ABOUT_DESC"] = "हर पेशा सामग्री के टूलटिप में दिखाता है कि कौन से पेशे उसे और किन स्तरों पर इस्तेमाल करते हैं। सेटिंग्स सामान्य में हैं।"
L["CMD_OPEN"] = "सेटिंग्स खोलता है।"

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "डिसएन्चैंट और संग्रह"
L["DE_ENABLE"] = "डिसएन्चैंट परिणाम दिखाएँ"
L["DE_ALWAYS"] = "भले ही आप एन्चैंटर न हों"
L["DE_PRICE"] = "औसत मूल्य दिखाएँ (Auctionator)"
L["DE_SOURCES"] = "एन्चैंटिंग सामग्री का स्रोत दिखाएँ"
L["GATHER_ENABLE"] = "खनिज और जड़ी-बूटी लूट दिखाएँ"
L["DE_TITLE"] = "डिसएन्चैंट"
L["DE_VALUE"] = "औसत मूल्य"
L["DE_FROM"] = "इससे डिसएन्चैंट"
L["GATHER_TITLE"] = "मिल सकता है"
L["ILVL"] = "स्तर"
