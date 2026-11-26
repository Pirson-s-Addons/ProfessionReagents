-- Generado por tools/emulator_extras.py desde CMaNGOS-classic: no editar a mano.
-- Probabilidades del emulador, aproximadas (no son tablas oficiales).
local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }
addon.GATHER_NODES = addon.GATHER_NODES or {}
local nodes = addon.GATHER_NODES
nodes["Arthas' Tears"] = { kind = "herb", skill = 0, loot = { { 8836, 100.0, 1, 3, "Arthas' Tears" } } }
nodes["Black Lotus"] = { kind = "herb", skill = 0, loot = { { 13468, 100.0, 1, 1, "Black Lotus" } } }
nodes["Blindweed"] = { kind = "herb", skill = 0, loot = { { 8839, 100.0, 1, 3, "Blindweed" } } }
nodes["Briarthorn"] = { kind = "herb", skill = 0, loot = { { 2450, 100.0, 1, 3, "Briarthorn" }, { 2452, 40.0, 1, 3, "Swiftthistle" } } }
nodes["Bruiseweed"] = { kind = "herb", skill = 0, loot = { { 2453, 100.0, 1, 3, "Bruiseweed" } } }
nodes["Dreamfoil"] = { kind = "herb", skill = 0, loot = { { 13463, 100.0, 1, 3, "Dreamfoil" } } }
nodes["Earthroot"] = { kind = "herb", skill = 0, loot = { { 2449, 100.0, 1, 3, "Earthroot" } } }
nodes["Fadeleaf"] = { kind = "herb", skill = 0, loot = { { 3818, 100.0, 1, 3, "Fadeleaf" } } }
nodes["Fel Iron Chest"] = { kind = "herb", skill = 0, loot = { { 6037, 25.0, 1, 1, "Truesilver Bar" }, { 13463, 25.0, 1, 1, "Dreamfoil" }, { 13464, 25.0, 1, 1, "Golden Sansam" }, { 13465, 25.0, 1, 1, "Mountain Silversage" }, { 8766, 16.7, 1, 1, "Morning Glory Dew" }, { 8932, 16.7, 1, 1, "Alterac Swiss" }, { 8948, 16.7, 1, 1, "Dried King Bolete" }, { 8950, 16.7, 1, 1, "Homemade Cherry Pie" } } }
nodes["Firebloom"] = { kind = "herb", skill = 0, loot = { { 4625, 100.0, 1, 3, "Firebloom" } } }
nodes["Ghost Mushroom"] = { kind = "herb", skill = 0, loot = { { 8845, 100.0, 1, 3, "Ghost Mushroom" } } }
nodes["Golden Sansam"] = { kind = "herb", skill = 0, loot = { { 13464, 100.0, 1, 3, "Golden Sansam" } } }
nodes["Goldthorn"] = { kind = "herb", skill = 0, loot = { { 3821, 100.0, 1, 3, "Goldthorn" } } }
nodes["Grave Moss"] = { kind = "herb", skill = 0, loot = { { 3369, 100.0, 1, 3, "Grave Moss" } } }
nodes["Gromsblood"] = { kind = "herb", skill = 0, loot = { { 8846, 100.0, 1, 3, "Gromsblood" } } }
nodes["Icecap"] = { kind = "herb", skill = 0, loot = { { 13467, 100.0, 1, 3, "Icecap" } } }
nodes["Khadgar's Whisker"] = { kind = "herb", skill = 0, loot = { { 3358, 100.0, 1, 3, "Khadgar's Whisker" } } }
nodes["Kingsblood"] = { kind = "herb", skill = 0, loot = { { 3356, 100.0, 1, 3, "Kingsblood" } } }
nodes["Large Mithril Bound Chest"] = { kind = "herb", skill = 0, loot = { { 13463, 33.3, 1, 1, "Dreamfoil" }, { 13464, 33.3, 1, 1, "Golden Sansam" }, { 13465, 33.3, 1, 1, "Mountain Silversage" }, { 3945, 20.0, 1, 1, "Twill Boots" }, { 3949, 20.0, 1, 1, "Twill Pants" }, { 3990, 20.0, 1, 1, "Crested Buckler" }, { 8085, 20.0, 1, 1, "Light Plate Pants" }, { 13816, 20.0, 1, 1, "Fine Longsword" } } }
nodes["Large Solid Chest"] = { kind = "herb", skill = 0, loot = { { 13463, 33.3, 1, 1, "Dreamfoil" }, { 13464, 33.3, 1, 1, "Golden Sansam" }, { 13465, 33.3, 1, 1, "Mountain Silversage" }, { 3945, 20.0, 1, 1, "Twill Boots" }, { 3949, 20.0, 1, 1, "Twill Pants" }, { 3990, 20.0, 1, 1, "Crested Buckler" }, { 8085, 20.0, 1, 1, "Light Plate Pants" }, { 13816, 20.0, 1, 1, "Fine Longsword" } } }
nodes["Liferoot"] = { kind = "herb", skill = 0, loot = { { 3357, 100.0, 1, 3, "Liferoot" } } }
nodes["Mageroyal"] = { kind = "herb", skill = 0, loot = { { 785, 100.0, 1, 3, "Mageroyal" }, { 2452, 20.0, 1, 3, "Swiftthistle" } } }
nodes["Mountain Silversage"] = { kind = "herb", skill = 0, loot = { { 13465, 100.0, 1, 3, "Mountain Silversage" } } }
nodes["Peacebloom"] = { kind = "herb", skill = 0, loot = { { 2447, 100.0, 1, 3, "Peacebloom" } } }
nodes["Plaguebloom"] = { kind = "herb", skill = 0, loot = { { 13466, 100.0, 1, 3, "Plaguebloom" } } }
nodes["Purple Lotus"] = { kind = "herb", skill = 0, loot = { { 8831, 100.0, 1, 3, "Purple Lotus" }, { 8153, 10.0, 1, 1, "Wildvine" } } }
nodes["Silverleaf"] = { kind = "herb", skill = 0, loot = { { 765, 100.0, 1, 3, "Silverleaf" } } }
nodes["Solid Chest"] = { kind = "herb", skill = 0, loot = { { 6037, 25.0, 1, 1, "Truesilver Bar" }, { 13463, 25.0, 1, 1, "Dreamfoil" }, { 13464, 25.0, 1, 1, "Golden Sansam" }, { 13465, 25.0, 1, 1, "Mountain Silversage" }, { 8766, 16.7, 1, 1, "Morning Glory Dew" }, { 8932, 16.7, 1, 1, "Alterac Swiss" }, { 8948, 16.7, 1, 1, "Dried King Bolete" }, { 8950, 16.7, 1, 1, "Homemade Cherry Pie" } } }
nodes["Stranglekelp"] = { kind = "herb", skill = 0, loot = { { 3820, 100.0, 1, 3, "Stranglekelp" } } }
nodes["Sungrass"] = { kind = "herb", skill = 0, loot = { { 8838, 100.0, 1, 3, "Sungrass" } } }
nodes["Wild Steelbloom"] = { kind = "herb", skill = 0, loot = { { 3355, 100.0, 1, 3, "Wild Steelbloom" } } }
nodes["Wintersbite"] = { kind = "herb", skill = 0, loot = { { 3819, 100.0, 1, 3, "Wintersbite" } } }
