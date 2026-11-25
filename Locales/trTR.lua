local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- TÜRKÇE (trTR)
-- ==========================================
local locale = GetLocale()
if locale ~= "trTR" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Profession Reagents Seçenekleri"
L["GENERAL"] = "Genel"
L["TOOLTIP_HEADER"] = "Eşya İpuçları"
L["TOOLTIP_TITLE"] = "Meslekler"
L["ENABLE"] = "Malzeme ipuçlarında meslekleri göster"
L["TT_ENABLE"] = "Her meslek malzemesinin ipucuna onu kullanan meslekleri ekler."
L["SHOW_RANGE"] = "Beceri seviyesi aralığını göster"
L["TT_SHOW_RANGE"] = "Her mesleğin yanında, tariflerinin malzemeyi kullandığı beceri seviyeleri: öğrenebileceğin ilk tariften hâlâ puan veren son tarife kadar."
L["DEFAULTS"] = "Varsayılan Değerler"
L["TT_DEFAULTS"] = "Tüm ayarları varsayılan değerlerine sıfırlar."
L["VERSION"] = "Sürüm:"
L["AUTHOR"] = "Yazar:"
L["LINKS"] = "Bağlantılar"
L["COMMANDS"] = "Komutlar"
L["SELECT"] = "Seç"
L["TT_SELECT"] = "Ctrl+C ile kopyalayabilmen için bağlantının tamamını seçer. WoW eklentilerin panoya yazmasına izin vermez, bu yüzden son adım sana kalıyor."
L["ABOUT_DESC"] = "Her meslek malzemesinin ipucunda onu hangi mesleklerin ve hangi seviyelerde kullandığını gösterir. Ayarlar Genel bölümündedir."
L["CMD_OPEN"] = "Ayarları açar."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Büyü bozma ve toplama"
L["DE_ENABLE"] = "Büyü bozma sonuçlarını göster"
L["DE_ALWAYS"] = "Büyücü olmasan da"
L["DE_PRICE"] = "Ortalama değeri göster (Auctionator)"
L["DE_SOURCES"] = "Büyü malzemelerinin kaynağını göster"
L["GATHER_ENABLE"] = "Maden ve bitki ganimetini göster"
L["DE_TITLE"] = "Büyü bozma"
L["DE_VALUE"] = "Ortalama değer"
L["DE_FROM"] = "Bozulduğu eşyalar"
L["GATHER_TITLE"] = "Verebilir"
L["ILVL"] = "sv."
