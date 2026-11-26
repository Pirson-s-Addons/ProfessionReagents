-- Generado por tools/emulator_extras.py desde CMaNGOS-tbc: no editar a mano.
-- Probabilidades del emulador, aproximadas (no son tablas oficiales).
local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- Objeto -> lo que da: { { itemID, pct, min, max, nombre }, ... }
addon.PROSPECTING = {
    [2770] = { { 24186, 100.0, 1, 1, "Copper Powder" }, { 818, 50.0, 1, 1, "Tigerseye" }, { 774, 50.0, 1, 1, "Malachite" }, { 1210, 10.0, 1, 1, "Shadowgem" } }, -- Copper Ore
    [2771] = { { 24188, 100.0, 1, 1, "Tin Powder" }, { 1705, 33.3, 1, 2, "Lesser Moonstone" }, { 1210, 33.3, 1, 2, "Shadowgem" }, { 1206, 33.3, 1, 2, "Moss Agate" }, { 7909, 3.3, 1, 1, "Aquamarine" }, { 3864, 3.3, 1, 1, "Citrine" }, { 1529, 3.3, 1, 1, "Jade" } }, -- Tin Ore
    [2772] = { { 24190, 100.0, 1, 1, "Iron Powder" }, { 3864, 33.3, 1, 2, "Citrine" }, { 1705, 33.3, 1, 2, "Lesser Moonstone" }, { 1529, 33.3, 1, 2, "Jade" }, { 7910, 5.0, 1, 1, "Star Ruby" }, { 7909, 5.0, 1, 1, "Aquamarine" } }, -- Iron Ore
    [3858] = { { 24234, 100.0, 1, 1, "Mithril Powder" }, { 7910, 33.3, 1, 2, "Star Ruby" }, { 7909, 33.3, 1, 2, "Aquamarine" }, { 3864, 33.3, 1, 2, "Citrine" }, { 12800, 2.5, 1, 1, "Azerothian Diamond" }, { 12799, 2.5, 1, 1, "Large Opal" }, { 12364, 2.5, 1, 1, "Huge Emerald" }, { 12361, 2.5, 1, 1, "Blue Sapphire" } }, -- Mithril Ore
    [10620] = { { 24235, 100.0, 1, 1, "Thorium Powder" }, { 12800, 22.0, 1, 2, "Azerothian Diamond" }, { 12799, 22.0, 1, 2, "Large Opal" }, { 12364, 22.0, 1, 2, "Huge Emerald" }, { 12361, 22.0, 1, 2, "Blue Sapphire" }, { 7910, 12.0, 1, 2, "Star Ruby" } }, -- Thorium Ore
    [23424] = { { 24242, 100.0, 1, 1, "Fel Iron Powder" }, { 23117, 17.5, 1, 1, "Azure Moonstone" }, { 23112, 17.5, 1, 1, "Golden Draenite" }, { 23107, 17.5, 1, 1, "Shadow Draenite" }, { 23079, 17.5, 1, 1, "Deep Peridot" }, { 23077, 17.5, 1, 1, "Blood Garnet" }, { 21929, 17.5, 1, 1, "Flame Spessarite" }, { 23441, 1.2, 1, 1, "Nightseye" } }, -- Fel Iron Ore
    [23425] = { { 24243, 100.0, 1, 1, "Adamantite Powder" }, { 23117, 19.2, 1, 1, "Azure Moonstone" }, { 23112, 19.2, 1, 1, "Golden Draenite" }, { 23107, 19.2, 1, 1, "Shadow Draenite" }, { 23079, 19.2, 1, 1, "Deep Peridot" }, { 23077, 19.2, 1, 1, "Blood Garnet" }, { 21929, 19.2, 1, 1, "Flame Spessarite" }, { 23441, 4.0, 1, 1, "Nightseye" } }, -- Adamantite Ore
}
