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
L["PROSPECT_TITLE"] = "Arama verir"
L["MILL_TITLE"] = "Öğütme verir"
L["ILVL"] = "sv."
L["QUALITY_2"] = "Uncommon"
L["QUALITY_3"] = "Rare"
L["QUALITY_4"] = "Epic"
L["ARMOR"] = "zırh"
L["WEAPONS"] = "silah"
L["TT_DE_ENABLE"] = "Yeşil, mavi ve mor silah ve zırhlarda: büyüsünü bozunca çıkan malzemeler, şans ve miktarlarıyla."
L["TT_DE_ALWAYS"] = "Varsayılan olarak sonuçlar yalnızca Enchanting bilen karakterlerde görünür."
L["TT_DE_PRICE"] = "Auctionator kuruluysa: büyü bozmadan çıkanların ortalama müzayede değeri."
L["TT_DE_SOURCES"] = "Toz, öz ve kırıklarda: büyü bozulunca bunları veren eşya kaliteleri ve seviyeleri."
L["TT_GATHER_ENABLE"] = "Bir maden damarının veya bitkinin üzerine gelince: neler verebileceği ve her eşyanın şansı. GatherRadar ile her oyun dilinde çalışır; o olmadan yalnızca İngilizcede."
