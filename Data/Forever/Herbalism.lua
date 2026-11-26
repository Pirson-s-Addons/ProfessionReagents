-- Generado por tools/forever_extras.py desde Wowhead (wowhead.com/forever): no editar a mano.
-- Probabilidades observadas por los usuarios de Wowhead, no tablas oficiales.
local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }
addon.GATHER_NODES = addon.GATHER_NODES or {}
local nodes = addon.GATHER_NODES
nodes["Arthas' Tears"] = { kind = "herb", skill = 220, loot = { { 8836, 98.8, 1, 3, "Arthas' Tears" }, { 249424, 5, 1, 1, "Rosecap" }, { 268418, 1.2, 1, 1, "Scarce Herb Seeds" } } }
nodes["Black Lotus"] = { kind = "herb", skill = 300, loot = { { 13468, 99.4, 1, 1, "Black Lotus" }, { 249274, 11.4, 1, 1, "Stranglevine" } } }
nodes["Blindweed"] = { kind = "herb", skill = 235, loot = { { 8839, 99.3, 1, 3, "Blindweed" }, { 249274, 9.9, 1, 1, "Stranglevine" }, { 268418, 1.4, 1, 1, "Scarce Herb Seeds" } } }
nodes["Briarthorn"] = { kind = "herb", skill = 70, loot = { { 2450, 96.7, 1, 3, "Briarthorn" }, { 2452, 41.2, 1, 2, "Swiftthistle" }, { 249399, 7.6, 1, 1, "Frilled Lichen" }, { 268416, 1.1, 1, 1, "Uncommon Herb Seeds" } } }
nodes["Bruiseweed"] = { kind = "herb", skill = 100, loot = { { 2453, 99.6, 1, 3, "Bruiseweed" }, { 249399, 7.6, 1, 1, "Frilled Lichen" }, { 268416, 1.1, 1, 1, "Uncommon Herb Seeds" } } }
nodes["Demonsage"] = { kind = "herb", skill = 300, loot = { { 13465, 95.3, 1, 3, "Mountain Silversage" }, { 248821, 85, 1, 3, "Demonsage" }, { 249274, 10.4, 1, 1, "Stranglevine" }, { 248822, 8.3, 1, 1, "Death Lotus" } } }
nodes["Dreamfoil"] = { kind = "herb", skill = 270, loot = { { 13463, 98.9, 1, 3, "Dreamfoil" }, { 249274, 11, 1, 1, "Stranglevine" }, { 268418, 1.3, 1, 1, "Scarce Herb Seeds" } } }
nodes["Earthroot"] = { kind = "herb", skill = 15, loot = { { 2449, 99.5, 1, 3, "Earthroot" }, { 249399, 8.1, 1, 1, "Frilled Lichen" }, { 268415, 1.1, 1, 1, "Commonplace Herb Seeds" } } }
nodes["Fadeleaf"] = { kind = "herb", skill = 160, loot = { { 3818, 99.5, 1, 3, "Fadeleaf" }, { 249424, 9.5, 1, 1, "Rosecap" }, { 268417, 1.2, 1, 1, "Unusual Herb Seeds" } } }
nodes["Firebloom"] = { kind = "herb", skill = 205, loot = { { 4625, 99.4, 1, 3, "Firebloom" }, { 249424, 8.3, 1, 1, "Rosecap" }, { 268418, 0.8, 1, 1, "Scarce Herb Seeds" } } }
nodes["Ghost Mushroom"] = { kind = "herb", skill = 245, loot = { { 8845, 96.9, 1, 1, "Ghost Mushroom" }, { 249274, 10.9, 1, 1, "Stranglevine" }, { 268418, 1.2, 1, 1, "Scarce Herb Seeds" } } }
nodes["Golden Sansam"] = { kind = "herb", skill = 260, loot = { { 13464, 99.6, 1, 3, "Golden Sansam" }, { 249274, 11.5, 1, 1, "Stranglevine" }, { 268418, 0.8, 1, 1, "Scarce Herb Seeds" } } }
nodes["Goldthorn"] = { kind = "herb", skill = 170, loot = { { 3821, 99.4, 1, 3, "Goldthorn" }, { 249424, 9.1, 1, 1, "Rosecap" }, { 268418, 1.2, 1, 1, "Scarce Herb Seeds" } } }
nodes["Grave Moss"] = { kind = "herb", skill = 120, loot = { { 3369, 99.5, 1, 3, "Grave Moss" }, { 249399, 5.3, 1, 1, "Frilled Lichen" }, { 268416, 1.2, 1, 1, "Uncommon Herb Seeds" } } }
nodes["Gromsblood"] = { kind = "herb", skill = 250, loot = { { 8846, 96.4, 1, 3, "Gromsblood" }, { 249274, 13.6, 1, 1, "Stranglevine" }, { 268418, 1, 1, 1, "Scarce Herb Seeds" } } }
nodes["Icecap"] = { kind = "herb", skill = 290, loot = { { 13467, 98.4, 1, 3, "Icecap" }, { 249274, 13.2, 1, 1, "Stranglevine" }, { 268418, 1.4, 1, 1, "Scarce Herb Seeds" } } }
nodes["Khadgar's Whisker"] = { kind = "herb", skill = 185, loot = { { 3358, 99.4, 1, 3, "Khadgar's Whisker" }, { 249424, 9.2, 1, 1, "Rosecap" }, { 268417, 1.1, 1, 1, "Unusual Herb Seeds" } } }
nodes["Kingsblood"] = { kind = "herb", skill = 125, loot = { { 3356, 99.6, 1, 3, "Kingsblood" }, { 249399, 6.4, 1, 1, "Frilled Lichen" }, { 268416, 1.1, 1, 1, "Uncommon Herb Seeds" } } }
nodes["Liferoot"] = { kind = "herb", skill = 150, loot = { { 3357, 99.4, 1, 3, "Liferoot" }, { 249424, 9.6, 1, 1, "Rosecap" }, { 268417, 1, 1, 1, "Unusual Herb Seeds" } } }
nodes["Mageroyal"] = { kind = "herb", skill = 50, loot = { { 785, 97.9, 1, 3, "Mageroyal" }, { 2452, 21.3, 1, 2, "Swiftthistle" }, { 249399, 7.7, 1, 1, "Frilled Lichen" }, { 268416, 1, 1, 1, "Uncommon Herb Seeds" } } }
nodes["Marefoil"] = { kind = "herb", skill = 300, loot = { { 13463, 87.2, 1, 3, "Dreamfoil" }, { 248823, 87.2, 1, 3, "Marefoil" }, { 249274, 12.8, 1, 1, "Stranglevine" }, { 248822, 5.3, 1, 1, "Death Lotus" } } }
nodes["Mountain Silversage"] = { kind = "herb", skill = 280, loot = { { 13465, 98.8, 1, 3, "Mountain Silversage" }, { 249274, 11.5, 1, 1, "Stranglevine" }, { 268418, 1.2, 1, 1, "Scarce Herb Seeds" } } }
nodes["Peacebloom"] = { kind = "herb", skill = 1, loot = { { 2447, 99.9, 1, 3, "Peacebloom" }, { 268415, 1.1, 1, 1, "Commonplace Herb Seeds" } } }
nodes["Plaguebloom"] = { kind = "herb", skill = 285, loot = { { 13466, 98.2, 1, 3, "Plaguebloom" }, { 249274, 13, 1, 1, "Stranglevine" }, { 268418, 1.6, 1, 1, "Scarce Herb Seeds" } } }
nodes["Purple Lotus"] = { kind = "herb", skill = 210, loot = { { 8831, 98.9, 1, 3, "Purple Lotus" }, { 8153, 10.5, 1, 3, "Wildvine" }, { 249424, 9, 1, 1, "Rosecap" }, { 268418, 1.2, 1, 1, "Scarce Herb Seeds" } } }
nodes["Silverleaf"] = { kind = "herb", skill = 1, loot = { { 765, 99.9, 1, 3, "Silverleaf" }, { 268415, 1.1, 1, 1, "Commonplace Herb Seeds" } } }
nodes["Stranglekelp"] = { kind = "herb", skill = 85, loot = { { 3820, 99.6, 1, 3, "Stranglekelp" }, { 249399, 7.1, 1, 1, "Frilled Lichen" }, { 268416, 1.1, 1, 1, "Uncommon Herb Seeds" } } }
nodes["Stunted Silverleaf"] = { kind = "herb", skill = 1, loot = { { 765, 100, 1, 1, "Silverleaf" } } }
nodes["Sungrass"] = { kind = "herb", skill = 230, loot = { { 8838, 99.1, 1, 3, "Sungrass" }, { 249274, 10.8, 1, 1, "Stranglevine" }, { 268418, 1, 1, 1, "Scarce Herb Seeds" } } }
nodes["Wild Steelbloom"] = { kind = "herb", skill = 115, loot = { { 3355, 99.7, 1, 3, "Wild Steelbloom" }, { 249399, 6.4, 1, 1, "Frilled Lichen" }, { 268416, 1, 1, 1, "Uncommon Herb Seeds" } } }
nodes["Wilted Peacebloom"] = { kind = "herb", skill = 1, loot = { { 2447, 100, 1, 1, "Peacebloom" } } }
nodes["Wintersbite"] = { kind = "herb", skill = 195, loot = { { 3819, 98.9, 1, 3, "Wintersbite" }, { 249424, 12.2, 1, 1, "Rosecap" }, { 268417, 0.8, 1, 1, "Unusual Herb Seeds" } } }
