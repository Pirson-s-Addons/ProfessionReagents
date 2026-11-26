-- Generado por tools/emulator_extras.py desde CMaNGOS-tbc: no editar a mano.
-- Probabilidades del emulador, aproximadas (no son tablas oficiales).
local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }
addon.GATHER_NODES = addon.GATHER_NODES or {}
local nodes = addon.GATHER_NODES
nodes["Ancient Lichen"] = { kind = "herb", skill = 0, loot = { { 22790, 100.0, 1, 3, "Ancient Lichen" }, { 22575, 14.7, 1, 3, "Mote of Life" }, { 22794, 5.0, 1, 1, "Fel Lotus" } } }
nodes["Arthas' Tears"] = { kind = "herb", skill = 0, loot = { { 8836, 100.0, 1, 3, "Arthas' Tears" } } }
nodes["Black Lotus"] = { kind = "herb", skill = 0, loot = { { 13468, 100.0, 1, 1, "Black Lotus" } } }
nodes["Blindweed"] = { kind = "herb", skill = 0, loot = { { 8839, 100.0, 1, 3, "Blindweed" } } }
nodes["Bloodthistle"] = { kind = "herb", skill = 0, loot = { { 22710, 100.0, 1, 3, "Bloodthistle" } } }
nodes["Briarthorn"] = { kind = "herb", skill = 0, loot = { { 2450, 100.0, 1, 3, "Briarthorn" }, { 2452, 40.0, 1, 2, "Swiftthistle" } } }
nodes["Bruiseweed"] = { kind = "herb", skill = 0, loot = { { 2453, 100.0, 1, 3, "Bruiseweed" } } }
nodes["Dreamfoil"] = { kind = "herb", skill = 0, loot = { { 13463, 100.0, 1, 3, "Dreamfoil" } } }
nodes["Dreaming Glory"] = { kind = "herb", skill = 0, loot = { { 22786, 100.0, 1, 3, "Dreaming Glory" }, { 22575, 14.9, 1, 3, "Mote of Life" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Earthroot"] = { kind = "herb", skill = 0, loot = { { 2449, 100.0, 1, 3, "Earthroot" } } }
nodes["Fadeleaf"] = { kind = "herb", skill = 0, loot = { { 3818, 100.0, 1, 3, "Fadeleaf" } } }
nodes["Felweed"] = { kind = "herb", skill = 0, loot = { { 22785, 100.0, 1, 3, "Felweed" }, { 22575, 14.9, 1, 2, "Mote of Life" }, { 22795, 10.0, 1, 1, "Fel Blossom" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Firebloom"] = { kind = "herb", skill = 0, loot = { { 4625, 100.0, 1, 3, "Firebloom" } } }
nodes["Flame Cap"] = { kind = "herb", skill = 0, loot = { { 22788, 100.0, 1, 3, "Flame Cap" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Ghost Mushroom"] = { kind = "herb", skill = 0, loot = { { 8845, 100.0, 1, 3, "Ghost Mushroom" } } }
nodes["Golden Sansam"] = { kind = "herb", skill = 0, loot = { { 13464, 100.0, 1, 3, "Golden Sansam" } } }
nodes["Goldthorn"] = { kind = "herb", skill = 0, loot = { { 3821, 100.0, 1, 3, "Goldthorn" } } }
nodes["Grave Moss"] = { kind = "herb", skill = 0, loot = { { 3369, 100.0, 1, 3, "Grave Moss" } } }
nodes["Gromsblood"] = { kind = "herb", skill = 0, loot = { { 8846, 100.0, 1, 3, "Gromsblood" } } }
nodes["Icecap"] = { kind = "herb", skill = 0, loot = { { 13467, 100.0, 1, 3, "Icecap" } } }
nodes["Jinxed Hoodoo Pile"] = { kind = "herb", skill = 0, loot = { { 19727, 22.5, 1, 1, "Blood Scythe" }, { 14047, 10.0, 2, 5, "Runecloth" }, { 19821, 7.5, 1, 1, "Punctured Voodoo Doll" }, { 19820, 7.5, 1, 1, "Punctured Voodoo Doll" }, { 19819, 7.5, 1, 1, "Punctured Voodoo Doll" }, { 19818, 7.5, 1, 1, "Punctured Voodoo Doll" }, { 19817, 7.5, 1, 1, "Punctured Voodoo Doll" }, { 19816, 7.5, 1, 1, "Punctured Voodoo Doll" } } }
nodes["Khadgar's Whisker"] = { kind = "herb", skill = 0, loot = { { 3358, 100.0, 1, 3, "Khadgar's Whisker" } } }
nodes["Kingsblood"] = { kind = "herb", skill = 0, loot = { { 3356, 100.0, 1, 3, "Kingsblood" } } }
nodes["Large Mithril Bound Chest"] = { kind = "herb", skill = 0, loot = { { 13465, 33.3, 1, 1, "Mountain Silversage" }, { 13464, 33.3, 1, 1, "Golden Sansam" }, { 13463, 33.3, 1, 1, "Dreamfoil" }, { 13816, 20.0, 1, 1, "Fine Longsword" }, { 8085, 20.0, 1, 1, "Light Plate Pants" }, { 3990, 20.0, 1, 1, "Crested Buckler" }, { 3949, 20.0, 1, 1, "Twill Pants" }, { 3945, 20.0, 1, 1, "Twill Boots" } } }
nodes["Large Solid Chest"] = { kind = "herb", skill = 0, loot = { { 13465, 33.3, 1, 1, "Mountain Silversage" }, { 13464, 33.3, 1, 1, "Golden Sansam" }, { 13463, 33.3, 1, 1, "Dreamfoil" }, { 13816, 20.0, 1, 1, "Fine Longsword" }, { 8085, 20.0, 1, 1, "Light Plate Pants" }, { 3990, 20.0, 1, 1, "Crested Buckler" }, { 3949, 20.0, 1, 1, "Twill Pants" }, { 3945, 20.0, 1, 1, "Twill Boots" } } }
nodes["Liferoot"] = { kind = "herb", skill = 0, loot = { { 3357, 100.0, 1, 3, "Liferoot" } } }
nodes["Mageroyal"] = { kind = "herb", skill = 0, loot = { { 785, 100.0, 1, 3, "Mageroyal" }, { 2452, 20.0, 1, 2, "Swiftthistle" } } }
nodes["Mana Thistle"] = { kind = "herb", skill = 0, loot = { { 22793, 100.0, 1, 3, "Mana Thistle" }, { 22575, 15.0, 1, 3, "Mote of Life" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Mountain Silversage"] = { kind = "herb", skill = 0, loot = { { 13465, 100.0, 1, 3, "Mountain Silversage" } } }
nodes["Netherbloom"] = { kind = "herb", skill = 0, loot = { { 22791, 100.0, 1, 3, "Netherbloom" }, { 22576, 14.8, 1, 3, "Mote of Mana" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Nightmare Vine"] = { kind = "herb", skill = 0, loot = { { 22792, 100.0, 1, 3, "Nightmare Vine" }, { 22797, 9.7, 1, 3, "Nightmare Seed" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Peacebloom"] = { kind = "herb", skill = 0, loot = { { 2447, 100.0, 1, 3, "Peacebloom" } } }
nodes["Plaguebloom"] = { kind = "herb", skill = 0, loot = { { 13466, 100.0, 1, 3, "Plaguebloom" } } }
nodes["Purple Lotus"] = { kind = "herb", skill = 0, loot = { { 8831, 100.0, 1, 3, "Purple Lotus" }, { 8153, 10.0, 1, 1, "Wildvine" } } }
nodes["Ragveil"] = { kind = "herb", skill = 0, loot = { { 22787, 100.0, 1, 3, "Ragveil" }, { 22575, 15.0, 1, 3, "Mote of Life" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Silverleaf"] = { kind = "herb", skill = 0, loot = { { 765, 100.0, 1, 3, "Silverleaf" } } }
nodes["Stranglekelp"] = { kind = "herb", skill = 0, loot = { { 3820, 100.0, 1, 3, "Stranglekelp" } } }
nodes["Sungrass"] = { kind = "herb", skill = 0, loot = { { 8838, 100.0, 1, 3, "Sungrass" } } }
nodes["Terocone"] = { kind = "herb", skill = 0, loot = { { 22789, 100.0, 1, 3, "Terocone" }, { 22575, 14.8, 1, 3, "Mote of Life" }, { 22794, 3.0, 1, 1, "Fel Lotus" } } }
nodes["Wild Steelbloom"] = { kind = "herb", skill = 0, loot = { { 3355, 100.0, 1, 3, "Wild Steelbloom" } } }
nodes["Wintersbite"] = { kind = "herb", skill = 0, loot = { { 3819, 100.0, 1, 3, "Wintersbite" } } }
