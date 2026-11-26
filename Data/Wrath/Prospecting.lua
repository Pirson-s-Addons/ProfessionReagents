-- Generado por tools/emulator_extras.py desde AzerothCore: no editar a mano.
-- Probabilidades del emulador, aproximadas (no son tablas oficiales).
local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- Objeto -> lo que da: { { itemID, pct, min, max, nombre }, ... }
addon.PROSPECTING = {
    [2770] = { { 774, 50.0, 1, 1, "Malachite" }, { 818, 50.0, 1, 1, "Tigerseye" }, { 1210, 10.0, 1, 1, "Shadowgem" } }, -- Copper Ore
    [2771] = { { 1206, 33.3, 1, 2, "Moss Agate" }, { 1210, 33.3, 1, 2, "Shadowgem" }, { 1705, 33.3, 1, 2, "Lesser Moonstone" }, { 1, 10.0, 1, 1, "1" } }, -- Tin Ore
    [2772] = { { 1529, 30.0, 1, 2, "Jade" }, { 1705, 30.0, 1, 2, "Lesser Moonstone" }, { 3864, 30.0, 1, 2, "Citrine" }, { 7909, 5.0, 1, 1, "Aquamarine" }, { 7910, 5.0, 1, 1, "Star Ruby" } }, -- Iron Ore
    [3858] = { { 3864, 30.0, 1, 2, "Citrine" }, { 7909, 30.0, 1, 2, "Aquamarine" }, { 7910, 30.0, 1, 2, "Star Ruby" }, { 12361, 2.5, 1, 1, "Blue Sapphire" }, { 12364, 2.5, 1, 1, "Huge Emerald" }, { 12799, 2.5, 1, 1, "Large Opal" }, { 12800, 2.5, 1, 1, "Azerothian Diamond" } }, -- Mithril Ore
    [10620] = { { 7910, 30.0, 1, 2, "Star Ruby" }, { 12361, 15.0, 1, 2, "Blue Sapphire" }, { 12364, 15.0, 1, 2, "Huge Emerald" }, { 12799, 15.0, 1, 2, "Large Opal" }, { 12800, 15.0, 1, 2, "Azerothian Diamond" }, { 1, 10.0, 1, 1, "1" } }, -- Thorium Ore
    [23424] = { { 21929, 16.7, 1, 2, "Flame Spessarite" }, { 23077, 16.7, 1, 2, "Blood Garnet" }, { 23079, 16.7, 1, 2, "Deep Peridot" }, { 23107, 16.7, 1, 2, "Shadow Draenite" }, { 23112, 16.7, 1, 2, "Golden Draenite" }, { 23117, 16.7, 1, 2, "Azure Moonstone" }, { 23436, 4.0, 1, 1, "Living Ruby" }, { 23437, 4.0, 1, 1, "Talasite" } }, -- Fel Iron Ore
    [23425] = { { 1, 100.0, 1, 1, "1" }, { 24243, 100.0, 1, 1, "Adamantite Powder" }, { 2, 24.0, 1, 1, "2" }, { 3, 15.0, 1, 1, "3" } }, -- Adamantite Ore
    [36909] = { { 1, 100.0, 1, 1, "1" } }, -- Cobalt Ore
    [36910] = { { 2, 100.0, 1, 1, "2" }, { 3, 75.0, 1, 1, "3" }, { 46849, 75.0, 1, 1, "Titanium Powder" }, { 1, 20.0, 1, 1, "1" } }, -- Titanium Ore
    [36912] = { { 2, 100.0, 1, 1, "2" }, { 1, 85.0, 1, 1, "1" } }, -- Saronite Ore
}
