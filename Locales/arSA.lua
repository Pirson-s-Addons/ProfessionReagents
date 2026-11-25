local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- العربية (arSA)
-- ==========================================
local locale = GetLocale()
if locale ~= "arSA" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "خيارات Profession Reagents"
L["GENERAL"] = "عام"
L["TOOLTIP_HEADER"] = "تلميحات العناصر"
L["TOOLTIP_TITLE"] = "المهن"
L["ENABLE"] = "إظهار المهن في تلميح المكونات"
L["TT_ENABLE"] = "يضيف إلى تلميح كل مكوّن مهنة المهن التي تستخدمه."
L["SHOW_RANGE"] = "إظهار نطاق المستوى"
L["TT_SHOW_RANGE"] = "بجانب كل مهنة، مستويات المهارة التي تستخدم فيها وصفاتها المكوّن: من أول وصفة يمكنك تعلمها إلى آخر وصفة لا تزال تمنح نقاطًا."
L["DEFAULTS"] = "القيم الافتراضية"
L["TT_DEFAULTS"] = "يعيد جميع الإعدادات إلى قيمها الافتراضية."
L["VERSION"] = "الإصدار:"
L["AUTHOR"] = "المؤلف:"
L["LINKS"] = "روابط"
L["COMMANDS"] = "الأوامر"
L["SELECT"] = "تحديد"
L["TT_SELECT"] = "يحدد الرابط كاملاً لتتمكن من نسخه باستخدام Ctrl+C. لا تسمح WoW للإضافات بالكتابة في الحافظة، لذا الخطوة الأخيرة عليك."
L["ABOUT_DESC"] = "يعرض في تلميح كل مكوّن مهنة المهن التي تستخدمه وفي أي مستويات. الإعدادات موجودة في عام."
L["CMD_OPEN"] = "يفتح الإعدادات."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "التفكيك والجمع"
L["DE_ENABLE"] = "عرض نتائج التفكيك"
L["DE_ALWAYS"] = "حتى لو لم تكن ساحرًا"
L["DE_PRICE"] = "عرض متوسط القيمة (Auctionator)"
L["DE_SOURCES"] = "عرض مصدر مواد السحر"
L["GATHER_ENABLE"] = "عرض غنائم العروق والأعشاب"
L["DE_TITLE"] = "التفكيك"
L["DE_VALUE"] = "متوسط القيمة"
L["DE_FROM"] = "يُفكك من"
L["GATHER_TITLE"] = "قد يعطي"
L["ILVL"] = "مستوى"
