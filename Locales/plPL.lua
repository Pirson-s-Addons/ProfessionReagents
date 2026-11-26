local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- ==========================================
-- POLSKI (plPL)
-- ==========================================
local locale = GetLocale()
if locale ~= "plPL" then return end
local L = addon.L

L["OPTIONS_TITLE"] = "Opcje Profession Reagents"
L["GENERAL"] = "Ogólne"
L["TOOLTIP_HEADER"] = "Podpowiedzi przedmiotów"
L["TOOLTIP_TITLE"] = "Profesje"
L["ENABLE"] = "Pokazuj profesje w podpowiedzi składników"
L["TT_ENABLE"] = "Dodaje do podpowiedzi każdego składnika profesji profesje, które go używają."
L["SHOW_RANGE"] = "Pokazuj zakres poziomu"
L["TT_SHOW_RANGE"] = "Obok każdej profesji poziomy umiejętności, na których jej przepisy używają składnika: od pierwszego przepisu, którego możesz się nauczyć, do ostatniego, który wciąż daje punkty."
L["DEFAULTS"] = "Wartości domyślne"
L["TT_DEFAULTS"] = "Przywraca wszystkie ustawienia do wartości domyślnych."
L["VERSION"] = "Wersja:"
L["AUTHOR"] = "Autor:"
L["LINKS"] = "Linki"
L["COMMANDS"] = "Polecenia"
L["SELECT"] = "Zaznacz"
L["TT_SELECT"] = "Zaznacza cały link, abyś mógł go skopiować skrótem Ctrl+C. WoW nie pozwala dodatkom zapisywać do schowka, więc ostatni krok należy do ciebie."
L["ABOUT_DESC"] = "Pokazuje w podpowiedzi każdego składnika profesji, które profesje go używają i na jakich poziomach. Ustawienia są w zakładce Ogólne."
L["CMD_OPEN"] = "Otwiera ustawienia."

-- Desencantar y recoleccion (Core/Extras.lua)
L["EXTRAS_HEADER"] = "Odczarowywanie i zbieranie"
L["DE_ENABLE"] = "Pokaż wyniki odczarowania"
L["DE_ALWAYS"] = "Także gdy nie jesteś zaklinaczem"
L["DE_PRICE"] = "Pokaż średnią wartość (Auctionator)"
L["DE_SOURCES"] = "Pokaż skąd pochodzą materiały"
L["GATHER_ENABLE"] = "Pokaż łup z żył i ziół"
L["DE_TITLE"] = "Odczarowanie"
L["DE_VALUE"] = "Średnia wartość"
L["DE_FROM"] = "Odczarowane z"
L["GATHER_TITLE"] = "Może dać"
L["PROSPECT_TITLE"] = "Poszukiwanie daje"
L["MILL_TITLE"] = "Mielenie daje"
L["ILVL"] = "poz."
L["QUALITY_2"] = "Uncommon"
L["QUALITY_3"] = "Rare"
L["QUALITY_4"] = "Epic"
L["ARMOR"] = "pancerz"
L["WEAPONS"] = "broń"
L["TT_DE_ENABLE"] = "Na zielonej, niebieskiej i fioletowej broni i zbroi: materiały z odczarowania, z szansą i ilością."
L["TT_DE_ALWAYS"] = "Domyślnie wyniki odczarowania widzą tylko postacie znające Enchanting."
L["TT_DE_PRICE"] = "Z Auctionatorem: średnia wartość na aukcji tego, co daje odczarowanie przedmiotu."
L["TT_DE_SOURCES"] = "Na pyłach, esencjach i odłamkach: jakie jakości i poziomy przedmiotów je dają po odczarowaniu."
L["TT_GATHER_ENABLE"] = "Po najechaniu na żyłę rudy lub zioło: co może dać i z jaką szansą. Z GatherRadar działa w każdym języku gry; bez niego tylko po angielsku."
