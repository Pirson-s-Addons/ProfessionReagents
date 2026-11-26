-- Generado por tools/forever_extras.py desde Wowhead (wowhead.com/forever): no editar a mano.
-- Probabilidades observadas por los usuarios de Wowhead, no tablas oficiales.
local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

-- Nodo (nombre en ingles) -> { kind, skill, loot = { { itemID, pct, min, max, nombre }, ... } }
addon.GATHER_NODES = addon.GATHER_NODES or {}
local nodes = addon.GATHER_NODES
nodes["Admiral's Treasure Chest"] = { kind = "treasure", skill = 0, loot = { { 268506, 100.0, 1, 1, "Lamora's Loot" } } }
nodes["Alexston's Chest"] = { kind = "treasure", skill = 0, loot = { { 2998, 100.0, 1, 1, "A Simple Compass" } } }
nodes["Alliance Chest"] = { kind = "treasure", skill = 0, loot = { { 1205, 34.4, 1, 1, "Melon Juice" }, { 4606, 16.3, 1, 1, "Spongy Morel" }, { 422, 16.1, 1, 1, "Dwarven Mild" }, { 4538, 15.6, 1, 1, "Snapvine Watermelon" }, { 3770, 14.9, 1, 1, "Mutton Chop" }, { 4542, 14.9, 1, 1, "Moist Cornbread" }, { 3385, 14.3, 1, 2, "Lesser Mana Potion" }, { 929, 14.0, 1, 2, "Healing Potion" } } }
nodes["Anastasia's Stash"] = { kind = "treasure", skill = 0, loot = { { 275709, 100.0, 1, 1, "Stolen Funds" } } }
nodes["Ancient Chest"] = { kind = "treasure", skill = 0, loot = { { 4631, 100.0, 1, 1, "Tablet of Ryun'eh" } } }
nodes["Ancient Treasure"] = { kind = "treasure", skill = 0, loot = { { 7909, 5.3, 1, 1, "Aquamarine" }, { 3914, 5.0, 1, 1, "Journeyman's Backpack" }, { 1613, 2.7, 1, 1, "Spiritchaser Staff" }, { 1640, 2.7, 1, 1, "Monstrous War Axe" }, { 4087, 2.7, 1, 1, "Trueshot Bow" }, { 7472, 2.7, 1, 1, "Regal Boots" }, { 15244, 2.7, 1, 1, "Razor Blade" }, { 15287, 2.7, 1, 1, "Crusader Bow" } } }
nodes["Arena Treasure Chest"] = { kind = "treasure", skill = 0, loot = { { 277534, 100.0, 1, 1, "Arena Spoils" }, { 3914, 2.1, 1, 1, "Journeyman's Backpack" }, { 7910, 1.2, 1, 1, "Star Ruby" }, { 15217, 1.2, 1, 1, "Widow Blade" }, { 4500, 1.2, 1, 1, "Traveler's Backpack" }, { 15280, 0.9, 1, 1, "Wizard's Hand" }, { 7909, 0.8, 1, 1, "Aquamarine" }, { 10099, 0.8, 1, 1, "Councillor's Gloves" } } }
nodes["Baelog's Chest"] = { kind = "treasure", skill = 0, loot = { { 7740, 100.0, 1, 1, "Gni'kiv Medallion" } } }
nodes["Barrow Cache"] = { kind = "treasure", skill = 0, loot = { { 5691, 100.0, 1, 1, "Barrow Key" } } }
nodes["Battered Chest"] = { kind = "treasure", skill = 0, loot = { { 159, 32.1, 1, 1, "Refreshing Spring Water" }, { 4540, 17.6, 1, 1, "Tough Hunk of Bread" }, { 2070, 17.4, 1, 1, "Darnassian Bleu" }, { 117, 16.4, 1, 1, "Tough Jerky" }, { 4536, 16.1, 1, 1, "Shiny Red Apple" }, { 1377, 5.3, 1, 1, "Frayed Gloves" }, { 1380, 5.3, 1, 1, "Frayed Robe" }, { 1376, 5.0, 1, 1, "Frayed Cloak" } } }
nodes["Burning Blade Stash"] = { kind = "treasure", skill = 0, loot = { { 6535, 100.0, 1, 1, "Tablet of Verga" }, { 2589, 0.8, 1, 2, "Linen Cloth" }, { 117, 0.2, 2, 2, "Tough Jerky" }, { 118, 0.2, 3, 3, "Minor Healing Potion" }, { 1369, 0.2, 1, 1, "Ragged Leather Belt" }, { 2070, 0.2, 1, 1, "Darnassian Bleu" }, { 2211, 0.2, 1, 1, "Bent Large Shield" }, { 2449, 0.2, 2, 2, "Earthroot" } } }
nodes["Cache of the Firelord"] = { kind = "treasure", skill = 0, loot = { { 18646, 49.0, 1, 1, "The Eye of Divinity" }, { 18703, 47.5, 1, 1, "Ancient Petrified Leaf" }, { 19140, 21.6, 1, 1, "Cauterizing Band" } } }
nodes["Captain's Chest"] = { kind = "treasure", skill = 0, loot = { { 9356, 31.7, 1, 1, "A Wooden Leg" }, { 9358, 30.1, 1, 1, "A Head Rag" }, { 9355, 28.2, 1, 1, "Hoop Earring" }, { 9357, 27.4, 1, 1, "A Parrot Skeleton" }, { 3914, 2.9, 1, 1, "Journeyman's Backpack" }, { 9359, 2.9, 1, 1, "Southsea Lamp" }, { 866, 2.4, 1, 1, "Monk's Staff" }, { 7909, 2.4, 1, 1, "Aquamarine" } } }
nodes["Captain's Footlocker"] = { kind = "treasure", skill = 0, loot = { { 5882, 100.0, 1, 1, "Captain's Documents" } } }
nodes["Caravan Chest"] = { kind = "treasure", skill = 0, loot = { { 6170, 100.0, 1, 1, "Wizards' Reagents" } } }
nodes["Chest of Containment Coffers"] = { kind = "treasure", skill = 0, loot = { { 7247, 100.0, 1, 1, "Chest of Containment Coffers" } } }
nodes["Chest of Nesting"] = { kind = "treasure", skill = 0, loot = { { 3408, 100.0, 1, 1, "Rune of Nesting" }, { 2589, 0.2, 1, 2, "Linen Cloth" }, { 1372, 0.2, 1, 1, "Ragged Cloak" }, { 2652, 0.1, 1, 1, "Flimsy Chain Cloak" } } }
nodes["Chest of The Seven"] = { kind = "treasure", skill = 0, loot = { { 11921, 26.3, 1, 1, "Impervious Giant" }, { 11920, 25.4, 1, 1, "Wraith Scythe" }, { 11922, 23.4, 1, 1, "Blood-Etched Blade" }, { 11925, 23.3, 1, 1, "Ghostshroud" }, { 11926, 23.1, 1, 1, "Deathdealer Breastplate" }, { 11927, 23.1, 1, 1, "Legplates of the Eternal Guardian" }, { 11923, 23.0, 1, 1, "The Hammer of Grace" }, { 11929, 22.1, 1, 1, "Haunting Specter Leggings" } } }
nodes["Chest of the Black Feather"] = { kind = "treasure", skill = 0, loot = { { 3406, 100.0, 1, 1, "Black Feather Quill" }, { 2589, 0.2, 1, 2, "Linen Cloth" }, { 4604, 0.2, 1, 1, "Forest Mushroom Cap" }, { 7074, 0.2, 1, 1, "Chipped Claw" } } }
nodes["Chest of the Raven Claw"] = { kind = "treasure", skill = 0, loot = { { 3405, 100.0, 1, 1, "Raven Claw Talisman" }, { 1376, 0.2, 1, 1, "Frayed Cloak" }, { 4536, 0.1, 1, 1, "Shiny Red Apple" }, { 7101, 0.1, 1, 1, "Bug Eye" } } }
nodes["Chest of the Sky"] = { kind = "treasure", skill = 0, loot = { { 3407, 100.0, 1, 1, "Sapphire of Sky" }, { 1476, 0.2, 1, 2, "Snapped Spider Limb" }, { 159, 0.1, 1, 1, "Refreshing Spring Water" } } }
nodes["Damaged Chest"] = { kind = "treasure", skill = 0, loot = { { 6997, 100.0, 1, 1, "Tattered Manuscript" } } }
nodes["Dark Coffer"] = { kind = "treasure", skill = 0, loot = { { 11752, 31.1, 1, 2, "Black Blood of the Tormented" }, { 11753, 26.3, 1, 1, "Eye of Kajal" }, { 11751, 22.5, 1, 2, "Burning Essence" }, { 15324, 2.4, 1, 1, "Burnside Rifle" }, { 4500, 2.0, 1, 1, "Traveler's Backpack" }, { 7910, 1.7, 1, 1, "Star Ruby" }, { 10100, 1.7, 1, 1, "Councillor's Shoulders" }, { 15218, 1.7, 1, 1, "Crystal Sword" } } }
nodes["Dead-tooth's Strongbox"] = { kind = "treasure", skill = 0, loot = { { 6782, 100.0, 1, 1, "Marshal Haggard's Badge" }, { 2589, 0.3, 1, 2, "Linen Cloth" }, { 771, 0.2, 1, 1, "Chipped Boar Tusk" } } }
nodes["Defias Strongbox"] = { kind = "treasure", skill = 0, loot = { { 5947, 100.0, 1, 1, "Defias Docket" } } }
nodes["Dented Chest"] = { kind = "treasure", skill = 0, loot = { { 252031, 31.1, 1, 1, "Crisp Spring Water" }, { 255663, 20.0, 1, 2, "Windstone" }, { 252032, 19.1, 1, 1, "Red Delicious Stormapple" }, { 252022, 17.8, 1, 1, "Galestrider Jerky" }, { 252023, 17.2, 1, 1, "Zaalanarr Sharp" }, { 252028, 16.6, 1, 1, "Fresh Gustberry Bread" }, { 1380, 5.0, 1, 1, "Frayed Robe" }, { 1374, 4.6, 1, 1, "Frayed Shoes" } } }
nodes["Doan's Strongbox"] = { kind = "treasure", skill = 0, loot = { { 7146, 100.0, 1, 1, "The Scarlet Key" } } }
nodes["Document Chest"] = { kind = "treasure", skill = 0, loot = { { 12765, 100.0, 1, 1, "Secret Note #1" } } }
nodes["Doomrigger's Coffer"] = { kind = "treasure", skill = 0, loot = { { 12352, 100.0, 1, 1, "Doomrigger's Clasp" } } }
nodes["Druids' Cache"] = { kind = "treasure", skill = 0, loot = { { 5690, 100.0, 1, 1, "Claw Key" } } }
nodes["Felix's Chest"] = { kind = "treasure", skill = 0, loot = { { 16313, 100.0, 1, 1, "Felix's Chest" } } }
nodes["Fengus's Chest"] = { kind = "treasure", skill = 0, loot = { { 18266, 100.0, 1, 1, "Gordok Courtyard Key" } } }
nodes["Filled Containment Coffer"] = { kind = "treasure", skill = 0, loot = { { 7292, 100.0, 1, 1, "Filled Containment Coffer" } } }
nodes["Four Horsemen Chest"] = { kind = "treasure", skill = 0, loot = { { 22350, 59.0, 1, 1, "Desecrated Tunic" }, { 22349, 46.2, 1, 1, "Desecrated Breastplate" }, { 22351, 41.0, 1, 1, "Desecrated Robe" }, { 22726, 28.2, 1, 1, "Splinter of Atiesh" }, { 23025, 12.8, 1, 1, "Seal of the Damned" }, { 23027, 12.8, 1, 1, "Warmth of Forgiveness" } } }
nodes["Garrett Family Chest"] = { kind = "treasure", skill = 0, loot = { { 8026, 100.0, 1, 1, "Garrett Family Treasure" } } }
nodes["General Twinbraid's Strongbox"] = { kind = "treasure", skill = 0, loot = { { 5038, 100.0, 1, 1, "Tear of the Moons" } } }
nodes["Hidden Strongbox"] = { kind = "treasure", skill = 0, loot = { { 3766, 40.8, 1, 1, "Gryphon Feather Quill" }, { 3769, 40.8, 1, 1, "Broken Wand" }, { 3767, 39.4, 1, 1, "Fine Parchment" }, { 3384, 7.0, 1, 1, "Minor Magic Resistance Potion" }, { 1710, 4.2, 1, 1, "Greater Healing Potion" } } }
nodes["Horde Chest"] = { kind = "treasure", skill = 0, loot = { { 1708, 37.6, 1, 1, "Sweet Nectar" }, { 1707, 18.8, 1, 1, "Stormwind Brie" }, { 1710, 18.8, 1, 2, "Greater Healing Potion" }, { 929, 16.7, 2, 4, "Healing Potion" }, { 4539, 16.7, 1, 1, "Goldenbark Apple" }, { 3827, 16.1, 1, 2, "Mana Potion" }, { 3385, 15.6, 2, 4, "Lesser Mana Potion" }, { 4607, 15.1, 1, 1, "Delicious Cave Mold" } } }
nodes["Ironband's Strongbox"] = { kind = "treasure", skill = 0, loot = { { 6800, 100.0, 1, 1, "Umbral Ore" }, { 2589, 0.3, 1, 2, "Linen Cloth" }, { 1372, 0.1, 1, 1, "Ragged Cloak" } } }
nodes["Kerlonian's Chest"] = { kind = "treasure", skill = 0, loot = { { 13536, 100.0, 1, 1, "Horn of Awakening" } } }
nodes["Knot Thimblejack's Cache"] = { kind = "treasure", skill = 0, loot = { { 8170, 48.0, 5, 14, "Rugged Leather" }, { 14047, 48.0, 5, 16, "Runecloth" }, { 8171, 43.1, 1, 5, "Rugged Hide" }, { 8165, 30.4, 1, 5, "Worn Dragonscale" }, { 18240, 29.4, 1, 1, "Ogre Tannin" }, { 8154, 28.4, 1, 5, "Scorpid Scale" }, { 15408, 27.5, 1, 4, "Heavy Scorpid Scale" }, { 8150, 23.5, 2, 6, "Deeprock Salt" } } }
nodes["Krom Stoutarm's Chest"] = { kind = "treasure", skill = 0, loot = { { 8027, 100.0, 1, 1, "Krom Stoutarm's Treasure" } } }
nodes["Large Battered Chest"] = { kind = "treasure", skill = 0, loot = { { 2996, 21.4, 1, 2, "Bolt of Linen Cloth" }, { 4605, 21.0, 1, 2, "Red-speckled Mushroom" }, { 1179, 19.1, 1, 2, "Ice Cold Milk" }, { 2318, 17.9, 2, 3, "Light Leather" }, { 2455, 14.3, 2, 5, "Minor Mana Potion" }, { 858, 13.7, 2, 5, "Lesser Healing Potion" }, { 6545, 13.2, 1, 1, "Soldier's Armor" }, { 15926, 12.7, 1, 1, "Spellbinder Orb" } } }
nodes["Large Darkwood Chest"] = { kind = "treasure", skill = 0, loot = { { 1645, 26.7, 1, 2, "Moonberry Juice" }, { 3927, 13.3, 1, 2, "Fine Aged Cheddar" }, { 4599, 13.3, 1, 2, "Cured Ham Steak" }, { 4602, 9.5, 1, 2, "Moon Harvest Pumpkin" }, { 4608, 9.5, 1, 2, "Raw Black Truffle" }, { 8169, 8.6, 1, 2, "Thick Hide" }, { 4601, 6.7, 1, 2, "Soft Banana Bread" }, { 1710, 5.7, 2, 4, "Greater Healing Potion" } } }
nodes["Large Solid Chest"] = { kind = "treasure", skill = 0, loot = { { 1205, 31.2, 1, 2, "Melon Juice" }, { 3770, 15.6, 1, 2, "Mutton Chop" }, { 4542, 15.3, 1, 2, "Moist Cornbread" }, { 4606, 14.7, 1, 2, "Spongy Morel" }, { 4538, 14.5, 1, 2, "Snapvine Watermelon" }, { 422, 14.2, 1, 2, "Dwarven Mild" }, { 2319, 11.9, 2, 3, "Medium Leather" }, { 3385, 9.5, 2, 4, "Lesser Mana Potion" } } }
nodes["MacGrann's Meat Locker"] = { kind = "treasure", skill = 0, loot = { { 2667, 100.0, 1, 1, "MacGrann's Dried Meats" }, { 4813, 0.2, 1, 1, "Small Leather Collar" }, { 2589, 0.1, 1, 1, "Linen Cloth" }, { 3171, 0.1, 1, 1, "Broken Boar Tusk" }, { 7074, 0.1, 1, 1, "Chipped Claw" } } }
nodes["Malor's Strongbox"] = { kind = "treasure", skill = 0, loot = { { 12845, 100.0, 1, 1, "Medallion of Faith" } } }
nodes["Marshal Haggard's Chest"] = { kind = "treasure", skill = 0, loot = { { 921, 100.0, 1, 1, "A Faded Journal Page" } } }
nodes["Marvon's Chest"] = { kind = "treasure", skill = 0, loot = { { 10556, 100.0, 1, 1, "Stone Circle" } } }
nodes["Mok'Morokk's Strongbox"] = { kind = "treasure", skill = 0, loot = { { 5836, 100.0, 1, 1, "Mok'Morokk's Strongbox" } } }
nodes["Old Treasure Chest"] = { kind = "treasure", skill = 0, loot = { { 10106, 5.6, 1, 1, "Wanderer's Boots" }, { 10219, 5.2, 1, 1, "Elegant Circlet" }, { 10212, 4.8, 1, 1, "Elegant Cloak" }, { 10121, 4.4, 1, 1, "Ornate Gauntlets" }, { 10169, 4.4, 1, 1, "Templar Legplates" }, { 10147, 4.0, 1, 1, "Mighty Armsplints" }, { 10155, 4.0, 1, 1, "Mercurial Greaves" }, { 10222, 4.0, 1, 1, "Nightshade Boots" } } }
nodes["Ornate Chest"] = { kind = "treasure", skill = 0, loot = { { 11179, 100.0, 1, 1, "Golden Flame" } } }
nodes["Perrine's Chest"] = { kind = "treasure", skill = 0, loot = { { 6285, 100.0, 1, 1, "Egalin's Grimoire" }, { 4865, 0.3, 1, 1, "Ruined Pelt" }, { 774, 0.2, 1, 1, "Malachite" }, { 1414, 0.2, 1, 1, "Cracked Sledge" }, { 2070, 0.2, 1, 1, "Darnassian Bleu" } } }
nodes["Pitted Iron Chest"] = { kind = "treasure", skill = 0, loot = { { 5359, 100.0, 1, 1, "Lorgalis Manuscript" } } }
nodes["Relic Coffer"] = { kind = "treasure", skill = 0, loot = { { 11940, 62.3, 1, 1, "Sparkly Necklace" }, { 11966, 59.9, 1, 1, "Small Sack of Coins" }, { 11939, 59.8, 1, 1, "Shiny Bracelet" }, { 11941, 21.9, 1, 1, "False Documents" }, { 11942, 15.5, 1, 1, "Legal Documents" }, { 11937, 8.3, 1, 1, "Fat Sack of Coins" }, { 11938, 8.0, 1, 1, "Sack of Gems" }, { 11944, 4.0, 1, 1, "Dark Iron Baby Booties" } } }
nodes["Rusty Chest"] = { kind = "treasure", skill = 0, loot = { { 16747, 38.4, 1, 1, "Broken Lock" }, { 16748, 38.2, 1, 1, "Padded Lining" }, { 5519, 12.2, 1, 1, "Iron Pommel" }, { 2592, 9.9, 1, 1, "Wool Cloth" }, { 6712, 6.2, 1, 1, "Practice Lock" }, { 4306, 4.0, 1, 1, "Silk Cloth" } } }
nodes["Sandfury Cache"] = { kind = "treasure", skill = 0, loot = { { 217717, 100.0, 1, 1, "Hollow Emblem" } } }
nodes["Shadowforge Cache"] = { kind = "treasure", skill = 0, loot = { { 7669, 100.0, 1, 1, "Shattered Necklace Ruby" } } }
nodes["Shay's Chest"] = { kind = "treasure", skill = 0, loot = { { 9189, 100.0, 1, 1, "Shay's Bell" } } }
nodes["Sleepers' Cache"] = { kind = "treasure", skill = 0, loot = { { 5689, 100.0, 1, 1, "Sleepers' Key" } } }
nodes["Solid Chest"] = { kind = "treasure", skill = 0, loot = { { 1205, 33.9, 1, 1, "Melon Juice" }, { 4538, 16.5, 1, 1, "Snapvine Watermelon" }, { 422, 16.4, 1, 1, "Dwarven Mild" }, { 4606, 16.3, 1, 1, "Spongy Morel" }, { 4542, 16.1, 1, 1, "Moist Cornbread" }, { 3770, 15.9, 1, 1, "Mutton Chop" }, { 858, 14.5, 2, 4, "Lesser Healing Potion" }, { 3385, 14.5, 1, 2, "Lesser Mana Potion" } } }
nodes["Stolen Iron Chest"] = { kind = "treasure", skill = 0, loot = { { 6534, 100.0, 1, 1, "Forged Steel Bars" } } }
nodes["Stone Coffer"] = { kind = "treasure", skill = 0, loot = { { 210968, 100.0, 1, 1, "Reliquary Key" } } }
nodes["Storage Chest"] = { kind = "treasure", skill = 0, loot = { { 910, 100.0, 1, 1, "An Undelivered Letter" } } }
nodes["Sunken Chest"] = { kind = "treasure", skill = 0, loot = { { 1309, 100.0, 1, 1, "Oslow's Toolbox" } } }
nodes["Supply Cache"] = { kind = "treasure", skill = 0, loot = { { 252760, 100.0, 1, 1, "Stolen Shen'dar Supplies" } } }
nodes["The Prince's Chest"] = { kind = "treasure", skill = 0, loot = { { 18336, 100.0, 1, 1, "Gauntlet of Gordok Might" } } }
nodes["Trelane's Chest"] = { kind = "treasure", skill = 0, loot = { { 4531, 100.0, 1, 1, "Trelane's Orb" } } }
nodes["Trelane's Footlocker"] = { kind = "treasure", skill = 0, loot = { { 4530, 100.0, 1, 1, "Trelane's Phylactery" } } }
nodes["Troll Chest"] = { kind = "treasure", skill = 0, loot = { { 16602, 100.0, 1, 1, "Troll Charm" } } }
nodes["Velinde's Locker"] = { kind = "treasure", skill = 0, loot = { { 5520, 100.0, 1, 1, "Velinde's Journal" } } }
nodes["Warden's Footlocker"] = { kind = "treasure", skill = 0, loot = { { 279469, 100.0, 1, 1, "Grimy Key" } } }
nodes["Witch Doctor's Chest"] = { kind = "treasure", skill = 0, loot = { { 4338, 18.8, 1, 4, "Mageweave Cloth" }, { 4306, 17.1, 1, 4, "Silk Cloth" }, { 8151, 9.5, 1, 1, "Flask of Mojo" }, { 4599, 5.0, 1, 1, "Cured Ham Steak" }, { 9242, 2.2, 1, 1, "Ancient Tablet" }, { 1645, 1.6, 1, 1, "Moonberry Juice" }, { 3928, 1.4, 1, 1, "Superior Healing Potion" }, { 4017, 1.1, 1, 1, "Sharp Shortsword" } } }
nodes["Worn Chest"] = { kind = "treasure", skill = 0, loot = { { 5464, 100.0, 1, 1, "Iron Shaft" } } }
nodes["Worn Wooden Chest"] = { kind = "treasure", skill = 0, loot = { { 3706, 100.0, 1, 1, "Ensorcelled Parchment" } } }
