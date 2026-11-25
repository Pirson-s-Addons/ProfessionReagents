-- Comprueba Core/Extras.lua sin el juego: tramos de desencantar, materiales y nodos.
-- uv run --no-project --with lupa python -I -c "import lupa.lua51 as l; l.LuaRuntime().execute(open('tools/test_extras.lua').read())"
local lines, hooks = {}, {}
local tip = { name = "GameTooltip" }
function tip:GetName() return self.name end
function tip:GetItem() return nil end
function tip:GetUnit() return nil end
function tip:AddDoubleLine(a, b) lines[#lines + 1] = a .. " = " .. b end
function tip:AddLine(a) lines[#lines + 1] = a end
function tip:Show() end
function tip:HookScript(_, f) hooks[#hooks + 1] = f end
GameTooltip = tip
GameTooltipTextLeft1 = { GetText = function() return tip.title end }
local itemInfo = {}
C_Item = { GetItemInfo = function(id) local t = itemInfo[id] if t then return unpack(t, 1, 12) end end }
TooltipDataProcessor = { AddTooltipPostCall = function(_, f) hooks.item = f end }
Enum = { TooltipDataType = { Item = 0 } }
local addon = { L = setmetatable({}, { __index = function(_, k) return k end }) }
addon.db = { disenchant = true, disenchantAlways = true, disenchantSources = true, disenchantPrice = true, gather = true }
addon.Divider = function(_, title) lines[#lines + 1] = "--" .. title end
addon.Ranks = function() return {} end
assert(loadfile("Data/ForeverExtras.lua"))("ProfessionReagents", addon)
assert(loadfile("Core/Extras.lua"))("ProfessionReagents", addon)

-- Verde de armadura nivel 10: polvo extrano y esencia menor de magia
local loot = addon.DisenchantResults(2, 4, 10)
assert(loot and loot[1][1] == 10940, "verde 10: " .. tostring(loot and loot[1][1]) .. " " .. tostring(#(addon.DISENCHANT or {})))
-- Arma verde nivel 10: la esencia primero
assert(addon.DisenchantResults(2, 2, 10)[1][1] == 10938, "arma verde 10: esencia")
assert(addon.DisenchantResults(2, 4, 3) == nil, "nivel 3: sin tramo")

-- Ficha de un objeto: [Guantes] verdes de nivel 12, armadura
itemInfo[100] = { "Guantes", nil, 2, 12, nil, nil, nil, nil, nil, nil, nil, 4 }
hooks.item(tip, { id = 100 })
assert(lines[1] == "--DE_TITLE" and lines[2]:find("Strange Dust"), table.concat(lines, "\n"))

-- No encantador y sin la opcion: nada
lines = {}
addon.db.disenchantAlways = false
hooks.item(tip, { id = 100 })
assert(#lines == 0, "sin encantamiento no sale")

-- Ficha del polvo extrano: de donde sale
lines = {}
itemInfo[10940] = { "Strange Dust", nil, 1, 1, nil, nil, nil, nil, nil, nil, nil, 7 }
hooks.item(tip, { id = 10940 })
assert(lines[1] == "--DE_FROM" and #lines > 1, table.concat(lines, "\n"))

-- Mena bajo el raton (nombre en ingles, sin GatherRadar)
lines = {}
tip.title = "Copper Vein"
for _, f in ipairs(hooks) do f(tip) end
assert(lines[1] == "--GATHER_TITLE" and lines[2]:find("Copper Ore"), table.concat(lines, "\n"))
lines = {}
tip.title = "Ragnaros"
for _, f in ipairs(hooks) do f(tip) end
assert(#lines == 0, "lo que no es un nodo no se toca")
print("OK")
