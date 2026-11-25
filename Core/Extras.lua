--========================================================
-- Extras.lua (solo WoW Forever)
--========================================================
-- Tres lineas mas en las fichas, cada una con su casilla en Opciones:
--   * Objeto verde/azul/morado: que sale al desencantarlo (si eres encantador
--     o con "disenchantAlways"), con su valor medio si esta Auctionator.
--   * Material de encantamiento: de que objetos sale.
--   * Mena o planta bajo el raton: lo que puede salir y con que probabilidad.
-- Los datos (Data/ForeverExtras.lua) los genera tools/forever_extras.py
-- desde Wowhead (seccion WoW Forever).

local _, addon = ...
local L = addon.L

if not (addon.GATHER_NODES or addon.DISENCHANT) then return end -- otro cliente: sin datos

local ENCHANTING = 333
local GetItemInfo = (C_Item and C_Item.GetItemInfo) or GetItemInfo

-- Nombre del objeto en el idioma del cliente; si aun no lo tiene en cache, el
-- ingles de los datos (y se le pide para la proxima vez)
local function ItemName(id, english)
    local name, _, quality = GetItemInfo(id)
    if not name then
        if C_Item and C_Item.RequestLoadItemDataByID then C_Item.RequestLoadItemDataByID(id) end
        return english
    end
    local color = ITEM_QUALITY_COLORS and quality and ITEM_QUALITY_COLORS[quality]
    return color and (color.hex .. name .. "|r") or name
end

local function Amount(lo, hi)
    if lo == hi then return lo > 1 and (" x" .. lo) or "" end
    return (" x%d-%d"):format(lo, hi)
end

local function Pct(p)
    if p >= 10 then return ("%d%%"):format(math.floor(p + 0.5)) end
    return ("%.1f%%"):format(p)
end

-- Icono del objeto (GetItemInfoInstant lo da aunque no este en cache), recortado como en las bolsas
local GetItemInfoInstant = (C_Item and C_Item.GetItemInfoInstant) or GetItemInfoInstant
local function Icon(id)
    local icon = GetItemInfoInstant and select(5, GetItemInfoInstant(id))
    return icon and ("|T" .. icon .. ":14:14:0:0:64:64:5:59:5:59|t ") or ""
end

-- Las lineas de una tabla de botin: { { itemID, pct, min, max, nombre }, ... }
local function AddLoot(tooltip, loot)
    for _, e in ipairs(loot) do
        tooltip:AddDoubleLine("  " .. Icon(e[1]) .. ItemName(e[1], e[5]) .. Amount(e[3], e[4]), Pct(e[2]),
            0.95, 0.95, 0.95, 0.8, 0.8, 0.8)
    end
end

--------------------------------------------------
-- DESENCANTAR
--------------------------------------------------
local ARMOR, WEAPON = 4, 2 -- classID

local function IsEnchanter()
    local ok, ranks = pcall(addon.Ranks)
    return ok and ranks and ranks[ENCHANTING] ~= nil
end

-- El tramo de DISENCHANT de esa calidad, tipo y nivel de objeto
function addon.DisenchantResults(quality, classID, itemLevel)
    local kind = classID == WEAPON and "weapon" or "armor"
    for _, b in ipairs(addon.DISENCHANT or {}) do
        if b.q == quality and (b.cls == nil or b.cls == kind) and itemLevel >= b.lo and itemLevel <= b.hi then
            return b.loot
        end
    end
end

-- Precio en subasta segun Auctionator (cobre) o nil
local function Price(itemID)
    local api = Auctionator and Auctionator.API and Auctionator.API.v1
    if not (api and api.GetAuctionPriceByItemID) then return nil end
    local ok, price = pcall(api.GetAuctionPriceByItemID, "ProfessionReagents", itemID)
    return ok and type(price) == "number" and price or nil
end

local function AddDisenchant(tooltip, itemID)
    local db = addon.db
    if not (db.disenchant and (db.disenchantAlways or IsEnchanter())) then return end
    local _, _, quality, itemLevel, _, _, _, _, _, _, _, classID = GetItemInfo(itemID)
    if not (quality and quality >= 2 and quality <= 4 and (classID == ARMOR or classID == WEAPON)) then return end
    local loot = addon.DisenchantResults(quality, classID, itemLevel or 0)
    if not loot then return end
    addon.Divider(tooltip, L["DE_TITLE"])
    AddLoot(tooltip, loot)
    if db.disenchantPrice then
        local value, known = 0, true
        for _, e in ipairs(loot) do
            local p = Price(e[1])
            if not p then known = false break end
            value = value + p * e[2] / 100 * (e[3] + e[4]) / 2
        end
        if known and value > 0 and GetCoinTextureString then
            tooltip:AddDoubleLine("  " .. L["DE_VALUE"], GetCoinTextureString(math.floor(value + 0.5)),
                0.8, 0.8, 0.8, 1, 1, 1)
        end
    end
    return true
end

-- Material -> de que tramos sale: { { q, cls, lo, hi, pct }, ... }
local sources
local function SourcesOf(itemID)
    if not sources then
        sources = {}
        for _, b in ipairs(addon.DISENCHANT or {}) do
            for _, e in ipairs(b.loot) do
                sources[e[1]] = sources[e[1]] or {}
                table.insert(sources[e[1]], { q = b.q, cls = b.cls, lo = b.lo, hi = b.hi, pct = e[2] })
            end
        end
    end
    return sources[itemID]
end

local function AddSources(tooltip, itemID)
    if not addon.db.disenchantSources then return end
    local list = SourcesOf(itemID)
    if not list then return end
    addon.Divider(tooltip, L["DE_FROM"])
    for _, s in ipairs(list) do
        local color = ITEM_QUALITY_COLORS and ITEM_QUALITY_COLORS[s.q]
        -- Calidad y tipo con los textos del propio juego (ya traducidos); si faltan, los nuestros
        local quality = _G["ITEM_QUALITY" .. s.q .. "_DESC"] or L["QUALITY_" .. s.q]
        local kind = s.cls == "weapon" and (AUCTION_CATEGORY_WEAPONS or L["WEAPONS"])
            or s.cls == "armor" and (AUCTION_CATEGORY_ARMOR or L["ARMOR"])
        local label = (color and color.hex or "") .. quality .. "|r" .. (kind and (" (" .. kind .. ")") or "")
        tooltip:AddDoubleLine("  " .. label .. "  " .. L["ILVL"] .. " " .. s.lo .. "-" .. s.hi, Pct(s.pct),
            0.95, 0.95, 0.95, 0.8, 0.8, 0.8)
    end
    return true
end

-- Forever tiene TooltipDataProcessor: un gancho para todas las fichas de objeto
-- (misma guarda que Core/ProfessionReagents.lua: sin el, este fichero no puede romper la carga)
if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall and Enum and Enum.TooltipDataType then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, data)
        local id = data and data.id
        if not addon.db or id == nil or (issecretvalue and issecretvalue(id)) then return end
        local added = AddDisenchant(tooltip, id)
        if AddSources(tooltip, id) then added = true end
        if added then tooltip:Show() end
    end)
end

--------------------------------------------------
-- MENAS Y PLANTAS
--------------------------------------------------
-- El nodo bajo el raton solo trae su nombre (en el idioma del cliente). Con
-- GatherRadar se pasa a ingles con su API; sin el, vale el nombre tal cual
-- (clientes en ingles).
local function NodeByName(text)
    local data = addon.GATHER_NODES
    if data[text] then return data[text] end
    local api = GatherRadarAPI
    if type(api) == "table" and api.version == 1 and api.FindNode and api.GetNodeInfo then
        local ok, id = pcall(api.FindNode, text)
        local okInfo, info = pcall(api.GetNodeInfo, ok and id or nil)
        local english = okInfo and type(info) == "table" and info.englishName
        if english and data[english] then return data[english] end
    end
end

local lastNode
GameTooltip:HookScript("OnShow", function(tooltip)
    local db = addon.db
    if not (db and db.gather) then return end
    if tooltip:GetItem() or tooltip:GetUnit() then return end
    local first = _G[tooltip:GetName() .. "TextLeft1"]
    local text = first and first:GetText()
    if not text or (issecretvalue and issecretvalue(text)) then return end
    local node = NodeByName(text)
    if not node then return end
    lastNode = text
    addon.Divider(tooltip, L["GATHER_TITLE"])
    AddLoot(tooltip, node.loot)
    tooltip:Show()
end)
addon.LastNode = function() return lastNode end -- para depurar con /dump
