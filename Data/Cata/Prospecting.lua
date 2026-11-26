-- Generado por tools/emulator_extras.py desde TrinityCore 4.3.4 (Cataclysm Preservation Project): no editar a mano.
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
    [23424] = { { 1, 100.0, 1, 1, "1" } }, -- Fel Iron Ore
    [23425] = { { 24243, 100.0, 1, 1, "Adamantite Powder" }, { 1, 100.0, 1, 1, "1" }, { 2, 10.0, 1, 1, "2" } }, -- Adamantite Ore
    [36909] = { { 1, 100.0, 1, 1, "1" } }, -- Cobalt Ore
    [36910] = { { 2, 100.0, 1, 1, "2" }, { 46849, 75.0, 1, 1, "Titanium Powder" }, { 3, 75.0, 1, 1, "3" }, { 1, 20.0, 1, 1, "1" } }, -- Titanium Ore
    [36912] = { { 2, 100.0, 1, 1, "2" }, { 1, 85.0, 1, 1, "1" } }, -- Saronite Ore
    [52183] = { { 52327, 100.0, 1, 3, "Volatile Earth" }, { 52177, 17.0, 1, 2, "Carnelian" }, { 52178, 17.0, 1, 2, "Zephyrite" }, { 52179, 17.0, 1, 2, "Alicite" }, { 52181, 17.0, 1, 2, "Hessonite" }, { 52180, 16.0, 1, 2, "Nightstone" }, { 52182, 16.0, 1, 2, "Jasper" }, { 52190, 7.0, 1, 2, "Inferno Ruby" } }, -- Pyrite Ore
    [52185] = { { 52177, 17.0, 1, 1, "Carnelian" }, { 52178, 17.0, 1, 1, "Zephyrite" }, { 52179, 17.0, 1, 1, "Alicite" }, { 52181, 17.0, 1, 1, "Hessonite" }, { 52180, 16.0, 1, 1, "Nightstone" }, { 52182, 16.0, 1, 1, "Jasper" }, { 52190, 4.0, 1, 1, "Inferno Ruby" }, { 52191, 4.0, 1, 1, "Ocean Sapphire" } }, -- Elementium Ore
    [53038] = { { 52177, 17.0, 1, 1, "Carnelian" }, { 52178, 17.0, 1, 1, "Zephyrite" }, { 52179, 17.0, 1, 1, "Alicite" }, { 52181, 17.0, 1, 1, "Hessonite" }, { 52180, 16.0, 1, 1, "Nightstone" }, { 52182, 16.0, 1, 1, "Jasper" }, { 52190, 2.0, 1, 1, "Inferno Ruby" }, { 52191, 2.0, 1, 1, "Ocean Sapphire" } }, -- Obsidium Ore
}
