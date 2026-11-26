-- Generado por tools/emulator_extras.py desde pandaria_5.4.8: no editar a mano.
-- Probabilidades del emulador, aproximadas (no son tablas oficiales).
local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }
addon.GATHER_NODES = addon.GATHER_NODES or {}
local nodes = addon.GATHER_NODES
nodes["Adder's Tongue"] = { kind = "herb", skill = 0, loot = { { 36903, 100.0, 1, 3, "Adder's Tongue" }, { 37704, 30.0, 1, 3, "Crystallized Life" }, { 36908, 10.0, 1, 3, "Frost Lotus" } } }
nodes["Ancient Lichen"] = { kind = "herb", skill = 0, loot = { { 22790, 80.0, 1, 3, "Ancient Lichen" }, { 22575, 15.0, 1, 3, "Mote of Life" }, { 22794, 5.0, 1, 1, "Fel Lotus" } } }
nodes["Arthas' Tears"] = { kind = "herb", skill = 0, loot = { { 8836, 100.0, 1, 3, "Arthas' Tears" } } }
nodes["Azshara's Veil"] = { kind = "herb", skill = 0, loot = { { 52985, 100.0, 2, 5, "Azshara's Veil" }, { 52329, 36.0, 1, 4, "Volatile Life" }, { 63122, 10.0, 1, 1, "Lifegiving Seed" } } }
nodes["Black Lotus"] = { kind = "herb", skill = 0, loot = { { 13468, 100.0, 1, 1, "Black Lotus" } } }
nodes["Blindweed"] = { kind = "herb", skill = 0, loot = { { 8839, 100.0, 1, 3, "Blindweed" } } }
nodes["Bloodthistle"] = { kind = "herb", skill = 0, loot = { { 22710, 100.0, 1, 2, "Bloodthistle" } } }
nodes["Briarthorn"] = { kind = "herb", skill = 0, loot = { { 2450, 100.0, 1, 3, "Briarthorn" }, { 2452, 40.0, 1, 2, "Swiftthistle" } } }
nodes["Bruiseweed"] = { kind = "herb", skill = 0, loot = { { 2453, 100.0, 1, 3, "Bruiseweed" } } }
nodes["Cinderbloom"] = { kind = "herb", skill = 0, loot = { { 52983, 100.0, 2, 4, "Cinderbloom" }, { 52329, 37.0, 1, 3, "Volatile Life" }, { 63122, 10.0, 1, 1, "Lifegiving Seed" } } }
nodes["Dreamfoil"] = { kind = "herb", skill = 0, loot = { { 13463, 100.0, 1, 3, "Dreamfoil" } } }
nodes["Dreaming Glory"] = { kind = "herb", skill = 0, loot = { { 22786, 100.0, 1, 3, "Dreaming Glory" }, { 22575, 15.0, 1, 3, "Mote of Life" }, { 22794, 2.0, 1, 1, "Fel Lotus" } } }
nodes["Earthroot"] = { kind = "herb", skill = 0, loot = { { 2449, 100.0, 1, 3, "Earthroot" } } }
nodes["Fadeleaf"] = { kind = "herb", skill = 0, loot = { { 3818, 100.0, 1, 3, "Fadeleaf" } } }
nodes["Felweed"] = { kind = "herb", skill = 0, loot = { { 22785, 100.0, 1, 3, "Felweed" }, { 22575, 15.0, 1, 2, "Mote of Life" }, { 22795, 10.0, 1, 1, "Fel Blossom" }, { 22794, 2.0, 1, 1, "Fel Lotus" } } }
nodes["Firebloom"] = { kind = "herb", skill = 0, loot = { { 4625, 100.0, 1, 3, "Firebloom" } } }
nodes["Firethorn"] = { kind = "herb", skill = 0, loot = { { 39970, 100.0, 2, 3, "Fire Leaf" }, { 37704, 30.0, 1, 2, "Crystallized Life" }, { 36908, 10.0, 1, 3, "Frost Lotus" } } }
nodes["Flame Cap"] = { kind = "herb", skill = 0, loot = { { 22788, 100.0, 1, 2, "Flame Cap" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Fool's Cap"] = { kind = "herb", skill = 0, loot = { { 79011, 100.0, 1, 9, "Fool's Cap" }, { 97623, 100.0, 1, 13, "Fool's Cap Spores" }, { 89640, 10.0, 2, 3, "Life Spirit" }, { 89641, 7.0, 1, 1, "Water Spirit" }, { 72238, 1.7, 1, 4, "Golden Lotus" } } }
nodes["Frost Lotus"] = { kind = "herb", skill = 0, loot = { { 36908, 100.0, 1, 3, "Frost Lotus" }, { 37921, 35.0, 1, 3, "Deadnettle" }, { 37704, 30.0, 1, 3, "Crystallized Life" } } }
nodes["Frozen Herb"] = { kind = "herb", skill = 0, loot = { { 36901, 60.0, 1, 7, "Goldclover" }, { 36904, 20.0, 1, 7, "Tiger Lily" }, { 36907, 20.0, 1, 5, "Talandra's Rose" } } }
nodes["Ghost Mushroom"] = { kind = "herb", skill = 0, loot = { { 8845, 100.0, 1, 1, "Ghost Mushroom" } } }
nodes["Goldclover"] = { kind = "herb", skill = 0, loot = { { 36901, 100.0, 1, 3, "Goldclover" }, { 37921, 35.0, 1, 3, "Deadnettle" }, { 37704, 30.0, 1, 2, "Crystallized Life" }, { 36908, 10.0, 1, 3, "Frost Lotus" } } }
nodes["Golden Lotus"] = { kind = "herb", skill = 0, loot = { { 72238, 100.0, 1, 5, "Golden Lotus" }, { 89640, 10.0, 2, 3, "Life Spirit" }, { 89641, 5.0, 1, 1, "Water Spirit" } } }
nodes["Golden Sansam"] = { kind = "herb", skill = 0, loot = { { 13464, 100.0, 1, 3, "Golden Sansam" } } }
nodes["Goldthorn"] = { kind = "herb", skill = 0, loot = { { 3821, 100.0, 1, 3, "Goldthorn" } } }
nodes["Grave Moss"] = { kind = "herb", skill = 0, loot = { { 3369, 100.0, 1, 3, "Grave Moss" } } }
nodes["Green Tea Leaf"] = { kind = "herb", skill = 0, loot = { { 72234, 100.0, 1, 9, "Green Tea Leaf" }, { 97619, 100.0, 1, 13, "Torn Green Tea Leaf" }, { 89640, 10.0, 2, 3, "Life Spirit" }, { 89641, 7.0, 1, 1, "Water Spirit" }, { 72238, 1.4, 1, 5, "Golden Lotus" } } }
nodes["Gromsblood"] = { kind = "herb", skill = 0, loot = { { 8846, 100.0, 1, 3, "Gromsblood" } } }
nodes["Heartblossom"] = { kind = "herb", skill = 0, loot = { { 52986, 100.0, 2, 4, "Heartblossom" }, { 52329, 33.0, 1, 4, "Volatile Life" }, { 63122, 10.0, 1, 1, "Lifegiving Seed" } } }
nodes["Icecap"] = { kind = "herb", skill = 0, loot = { { 13467, 100.0, 1, 3, "Icecap" } } }
nodes["Icethorn"] = { kind = "herb", skill = 0, loot = { { 36906, 100.0, 1, 3, "Icethorn" }, { 37704, 30.0, 1, 3, "Crystallized Life" }, { 36908, 10.0, 1, 3, "Frost Lotus" } } }
nodes["Jinxed Hoodoo Pile"] = { kind = "herb", skill = 0, loot = { { 19813, 100.0, 1, 1, "Punctured Voodoo Doll" }, { 19814, 100.0, 1, 1, "Punctured Voodoo Doll" }, { 19815, 100.0, 1, 1, "Punctured Voodoo Doll" }, { 19816, 100.0, 1, 1, "Punctured Voodoo Doll" }, { 19817, 100.0, 1, 1, "Punctured Voodoo Doll" }, { 19818, 100.0, 1, 1, "Punctured Voodoo Doll" }, { 19819, 100.0, 1, 1, "Punctured Voodoo Doll" }, { 19820, 100.0, 1, 1, "Punctured Voodoo Doll" } } }
nodes["Khadgar's Whisker"] = { kind = "herb", skill = 0, loot = { { 3358, 100.0, 1, 3, "Khadgar's Whisker" } } }
nodes["Kingsblood"] = { kind = "herb", skill = 0, loot = { { 3356, 100.0, 1, 3, "Kingsblood" } } }
nodes["Lichbloom"] = { kind = "herb", skill = 0, loot = { { 36905, 100.0, 1, 3, "Lichbloom" }, { 37704, 30.0, 1, 3, "Crystallized Life" }, { 36908, 10.0, 1, 3, "Frost Lotus" } } }
nodes["Liferoot"] = { kind = "herb", skill = 0, loot = { { 3357, 100.0, 1, 3, "Liferoot" } } }
nodes["Mageroyal"] = { kind = "herb", skill = 0, loot = { { 785, 100.0, 1, 3, "Mageroyal" }, { 2452, 20.0, 1, 2, "Swiftthistle" } } }
nodes["Mana Thistle"] = { kind = "herb", skill = 0, loot = { { 22793, 100.0, 1, 2, "Mana Thistle" }, { 22575, 15.1, 1, 3, "Mote of Life" }, { 22794, 2.0, 1, 1, "Fel Lotus" } } }
nodes["Mountain Silversage"] = { kind = "herb", skill = 0, loot = { { 13465, 100.0, 1, 3, "Mountain Silversage" } } }
nodes["Netherbloom"] = { kind = "herb", skill = 0, loot = { { 22791, 100.0, 1, 3, "Netherbloom" }, { 22576, 15.0, 1, 3, "Mote of Mana" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Nightmare Vine"] = { kind = "herb", skill = 0, loot = { { 22792, 100.0, 1, 3, "Nightmare Vine" }, { 22797, 10.0, 1, 1, "Nightmare Seed" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Peacebloom"] = { kind = "herb", skill = 0, loot = { { 2447, 100.0, 1, 3, "Peacebloom" } } }
nodes["Plaguebloom"] = { kind = "herb", skill = 0, loot = { { 13466, 100.0, 1, 3, "Sorrowmoss" } } }
nodes["Purple Lotus"] = { kind = "herb", skill = 0, loot = { { 8831, 100.0, 1, 3, "Purple Lotus" }, { 8153, 10.0, 1, 1, "Wildvine" } } }
nodes["Ragveil"] = { kind = "herb", skill = 0, loot = { { 22787, 100.0, 1, 3, "Ragveil" }, { 22575, 15.0, 1, 3, "Mote of Life" }, { 22794, 2.0, 1, 1, "Fel Lotus" } } }
nodes["Rain Poppy"] = { kind = "herb", skill = 0, loot = { { 72237, 100.0, 1, 9, "Rain Poppy" }, { 97620, 100.0, 1, 12, "Rain Poppy Petal" }, { 89640, 10.0, 2, 3, "Life Spirit" }, { 89641, 7.0, 1, 1, "Water Spirit" }, { 72238, 0.9, 1, 5, "Golden Lotus" } } }
nodes["Sha-Touched Herb"] = { kind = "herb", skill = 0, loot = { { 89639, 100.0, 1, 7, "Desecrated Herb" }, { 97624, 100.0, 1, 11, "Desecrated Herb Pod" }, { 72234, 33.0, 1, 9, "Green Tea Leaf" }, { 79011, 18.0, 1, 9, "Fool's Cap" }, { 79010, 16.0, 1, 9, "Snow Lily" }, { 89640, 1.9, 2, 3, "Life Spirit" }, { 72238, 1.7, 1, 5, "Golden Lotus" }, { 89641, 1.5, 1, 1, "Water Spirit" } } }
nodes["Silkweed"] = { kind = "herb", skill = 0, loot = { { 72235, 100.0, 1, 9, "Silkweed" }, { 97621, 100.0, 1, 1, "Silkweed Stem" }, { 89640, 10.0, 2, 3, "Life Spirit" }, { 89641, 7.0, 1, 1, "Water Spirit" }, { 72238, 1.1, 1, 5, "Golden Lotus" } } }
nodes["Silverleaf"] = { kind = "herb", skill = 0, loot = { { 765, 100.0, 1, 3, "Silverleaf" } } }
nodes["Snow Lily"] = { kind = "herb", skill = 0, loot = { { 79010, 100.0, 1, 9, "Snow Lily" }, { 97622, 100.0, 1, 12, "Snow Lily Petal" }, { 89640, 10.0, 2, 3, "Life Spirit" }, { 89641, 8.0, 1, 1, "Water Spirit" }, { 72238, 0.8, 1, 4, "Golden Lotus" } } }
nodes["Stormvine"] = { kind = "herb", skill = 0, loot = { { 52984, 100.0, 2, 5, "Stormvine" }, { 52329, 36.0, 1, 4, "Volatile Life" }, { 63122, 10.0, 1, 1, "Lifegiving Seed" } } }
nodes["Stranglekelp"] = { kind = "herb", skill = 0, loot = { { 3820, 100.0, 1, 3, "Stranglekelp" } } }
nodes["Sungrass"] = { kind = "herb", skill = 0, loot = { { 8838, 100.0, 1, 3, "Sungrass" } } }
nodes["Talandra's Rose"] = { kind = "herb", skill = 0, loot = { { 36907, 100.0, 1, 3, "Talandra's Rose" }, { 37921, 35.0, 1, 3, "Deadnettle" }, { 37704, 30.0, 1, 2, "Crystallized Life" }, { 36908, 10.0, 1, 3, "Frost Lotus" } } }
nodes["Terocone"] = { kind = "herb", skill = 0, loot = { { 22789, 100.0, 1, 3, "Terocone" }, { 22575, 15.0, 1, 3, "Mote of Life" }, { 22794, 2.0, 1, 1, "Fel Lotus" } } }
nodes["Tiger Lily"] = { kind = "herb", skill = 0, loot = { { 36904, 100.0, 1, 3, "Tiger Lily" }, { 37921, 35.0, 1, 3, "Deadnettle" }, { 37704, 30.0, 1, 2, "Crystallized Life" }, { 36908, 10.0, 1, 3, "Frost Lotus" } } }
nodes["Twilight Jasmine"] = { kind = "herb", skill = 0, loot = { { 52987, 100.0, 2, 8, "Twilight Jasmine" }, { 52329, 38.0, 1, 3, "Volatile Life" }, { 63122, 10.0, 1, 1, "Lifegiving Seed" } } }
nodes["Whiptail"] = { kind = "herb", skill = 0, loot = { { 52988, 100.0, 2, 4, "Whiptail" }, { 52329, 38.0, 1, 4, "Volatile Life" }, { 63122, 10.0, 1, 1, "Lifegiving Seed" } } }
nodes["Wild Steelbloom"] = { kind = "herb", skill = 0, loot = { { 3355, 100.0, 1, 3, "Wild Steelbloom" } } }
nodes["Wintersbite"] = { kind = "herb", skill = 0, loot = { { 3819, 100.0, 1, 3, "Dragon's Teeth" } } }
