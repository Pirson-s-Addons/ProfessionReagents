--========================================================
-- ProfessionReagents.lua
--========================================================
-- En la ficha de cada componente de profesion: para que profesiones sirve y
-- en que rango de nivel se usa. Los datos (Data/<cliente>.lua) los genera
-- _project/tools/professionreagents_data.py desde las tablas del juego.
--
-- Corre en todos los clientes (2.4.3 -> Retail): la API que cambia entre
-- versiones va por Core/Compat.lua.

local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos

addon.defaults = {
    enabled = true,
    showRange = true,
}

-- Linea raiz de cada profesion -> su hechizo, que da el nombre ya traducido
local ROOT_SPELL = {
    [129] = 3273,   -- Primeros auxilios
    [164] = 2018,   -- Herreria
    [165] = 2108,   -- Peleteria
    [171] = 2259,   -- Alquimia
    [182] = 2366,   -- Herboristeria
    [185] = 2550,   -- Cocina
    [186] = 2575,   -- Mineria
    [197] = 3908,   -- Sastreria
    [202] = 4036,   -- Ingenieria
    [333] = 7411,   -- Encantamiento
    [356] = 7620,   -- Pesca
    [393] = 8613,   -- Desuello
    [755] = 25229,  -- Joyeria
    [773] = 45357,  -- Inscripcion
    [794] = 78670,  -- Arqueologia
}

--------------------------------------------------
-- DATOS
--------------------------------------------------
local names = {}

-- Nombre de la linea en el idioma del cliente. Las de Retail por expansion
-- ("Herreria de Khaz Algar") las da el cliente; si no, el de la profesion.
function addon.ProfessionName(line)
    if names[line] then return names[line] end
    local info = addon.SKILLS and addon.SKILLS[line]
    if not info then return nil end
    local root, english = info[1], info[2]
    local name = (line ~= root) and addon.GetSkillLineName(line)
    if not name then
        local spell = ROOT_SPELL[root]
        name = spell and addon.GetSpellName(spell)
    end
    if type(name) ~= "string" or name == "" then name = english end
    names[line] = name
    return name
end

-- itemID, enlace o nombre -> itemID
local function ItemID(item)
    if type(item) == "number" then return item end
    if type(item) ~= "string" then return nil end
    local id = item:match("item:(%d+)")
    if not id then
        local link = addon.GetItemLink(item)
        id = link and link:match("item:(%d+)")
    end
    return tonumber(id)
end

-- { { skillLine, root, profession, min, max }, ... } o nil. min/max son nil
-- si las recetas no traen rango (las de Dragonflight en adelante).
function addon.GetUses(item)
    local id = ItemID(item)
    local data = id and addon.REAGENTS and addon.REAGENTS[id]
    if not data then return nil end
    local out = {}
    for line, lo, hi in data:gmatch("(%d+):(%d+):(%d+)") do
        line, lo, hi = tonumber(line), tonumber(lo), tonumber(hi)
        out[#out + 1] = {
            skillLine = line,
            root = addon.SKILLS[line][1],
            profession = addon.ProfessionName(line),
            min = hi > 0 and lo or nil,
            max = hi > 0 and hi or nil,
        }
    end
    return out
end

--------------------------------------------------
-- TOOLTIP
--------------------------------------------------
-- Separador de 1 px sobre una linea vacia, de borde a borde (sigue el ancho
-- del tooltip), y debajo la cabecera "Profesiones". Se esconde al limpiar u
-- ocultar el tooltip (OnTooltipCleared no existe en todos los clientes: pcall).
local dividers = {}
local function Divider(tooltip)
    tooltip:AddLine(" ")
    local name = tooltip.GetName and tooltip:GetName()
    local text = name and _G[name .. "TextLeft" .. tooltip:NumLines()]
    if text then
        local line = dividers[tooltip]
        if not line then
            line = tooltip:CreateTexture(nil, "ARTWORK")
            line:SetHeight(1)
            addon.SetSolidColor(line, 0.6, 0.6, 0.65, 0.6)
            local hide = function() line:Hide() end
            tooltip:HookScript("OnHide", hide)
            pcall(tooltip.HookScript, tooltip, "OnTooltipCleared", hide)
            dividers[tooltip] = line
        end
        line:ClearAllPoints()
        line:SetPoint("LEFT", text, "LEFT", 0, 0)
        line:SetPoint("RIGHT", tooltip, "RIGHT", -10, 0)
        line:Show()
    end
    tooltip:AddLine(addon.L["TOOLTIP_TITLE"], 0.55, 0.55, 0.6)
end

-- Icono recortado (64x64, del 5 al 59): sin el marco de Blizzard
local icons = {}
local function Icon(root)
    if icons[root] == nil then
        local spell = ROOT_SPELL[root]
        local icon = spell and addon.GetSpellIcon(spell)
        icons[root] = icon and ("|T" .. icon .. ":16:16:0:0:64:64:5:59:5:59|t  ") or ""
    end
    return icons[root]
end

-- Nivel del jugador en cada profesion: { [raiz] = nivel }.
-- GetProfessions (4.0+ y Forever) o GetSkillLineInfo (clientes clasicos).
-- ponytail: en GetSkillLineInfo las cabeceras plegadas esconden sus lineas.
local function Ranks()
    local byName, ranks = {}, {}
    for root, spell in pairs(ROOT_SPELL) do
        local n = addon.GetSpellName(spell)
        if n then byName[n] = root end
    end
    if GetProfessions and GetProfessionInfo then
        for _, index in pairs({ GetProfessions() }) do
            local name, _, rank, _, _, _, line = GetProfessionInfo(index)
            local root = (ROOT_SPELL[line] and line) or (addon.SKILLS[line] and addon.SKILLS[line][1]) or byName[name]
            if root then ranks[root] = rank end
        end
    elseif GetNumSkillLines and GetSkillLineInfo then
        for i = 1, GetNumSkillLines() do
            local name, isHeader, _, rank = GetSkillLineInfo(i)
            if not isHeader and byName[name] then ranks[byName[name]] = rank end
        end
    end
    return ranks
end

-- Nivel en una linea. En Retail cada expansion tiene el suyo (Herreria
-- clasica, de Khaz Algar...); en Forever las lineas hijas son la misma
-- profesion y comparten el de la raiz.
local RETAIL = WOW_PROJECT_ID and WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
local function RankFor(use, ranks)
    if use.skillLine ~= use.root and RETAIL then
        local get = C_TradeSkillUI and C_TradeSkillUI.GetProfessionInfoBySkillLineID
        local info = get and get(use.skillLine)
        local level = type(info) == "table" and info.skillLevel
        return (type(level) == "number" and level > 0) and level or nil
    end
    return ranks[use.root]
end

-- Colores de dificultad del juego: rojo = aun no; naranja/amarillo/verde =
-- te sirve (cada vez menos); gris = ya te has pasado. Sin la profesion, gris azulado.
function addon.RangeColor(rank, lo, hi)
    if not rank then return 0.6, 0.6, 0.65 end
    if rank < lo then return 1, 0.25, 0.25 end
    if rank >= hi then return 0.5, 0.5, 0.5 end
    local t = (rank - lo) / (hi - lo)
    if t < 0.5 then return 1, 0.5, 0.25 end
    if t < 0.8 then return 1, 1, 0 end
    return 0.25, 0.75, 0.25
end

local function AddLines(tooltip, itemID)
    local db = addon.db
    if not (db and db.enabled) then return end
    local uses = addon.GetUses(itemID)
    if not uses then return end
    Divider(tooltip)
    -- El color es un extra: si algo falla (API distinta, valor secreto), el
    -- rango sale sin color pero las lineas salen siempre
    local okRanks, ranks = pcall(Ranks)
    for _, use in ipairs(uses) do
        local label = Icon(use.root) .. use.profession
        if db.showRange and use.max then
            local ok, rank = pcall(RankFor, use, okRanks and ranks or {})
            if not ok or type(rank) ~= "number" or (issecretvalue and issecretvalue(rank)) then rank = nil end
            local r, g, b = addon.RangeColor(rank, use.min, use.max)
            tooltip:AddDoubleLine(label, use.min .. " - " .. use.max, 0.95, 0.95, 0.95, r, g, b)
        else
            tooltip:AddLine(label, 0.95, 0.95, 0.95)
        end
    end
    tooltip:Show() -- recoloca el alto del tooltip con las lineas nuevas
end

-- 10.0.2+ (y Forever): un unico gancho para todos los tooltips de objeto.
-- Antes, OnTooltipSetItem en cada tooltip que enseña objetos.
if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall and Enum and Enum.TooltipDataType then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(tooltip, data)
        local id = data and data.id
        if id == nil or (issecretvalue and issecretvalue(id)) then return end
        AddLines(tooltip, id)
    end)
else
    local function OnSetItem(tooltip)
        local _, link = tooltip:GetItem()
        local id = ItemID(link)
        if id then AddLines(tooltip, id) end
    end
    for _, tooltip in ipairs({ GameTooltip, ItemRefTooltip, ShoppingTooltip1, ShoppingTooltip2 }) do
        if tooltip then tooltip:HookScript("OnTooltipSetItem", OnSetItem) end
    end
end

--------------------------------------------------
-- API PUBLICA (solo lectura)
--------------------------------------------------
-- Para otros addons (p. ej. Azeroth AI: "¿para que sirve el cobre?" o "¿que
-- necesito para subir herreria?"). Devuelve siempre tablas nuevas.
--
--   item:      itemID, enlace o nombre (el nombre solo si el cliente ya conoce
--              el objeto: en ingles o en su idioma)
--   skillLine: linea de profesion. Las raiz son las de siempre (164 Herreria,
--              186 Mineria...); en Retail cada expansion tiene la suya
--              (2477 Herreria clasica, 2872 de Khaz Algar...) y root dice de cual cuelga
--
-- version solo sube si cambia el significado de algo ya existente; anadir
-- funciones o campos no la sube.
--
--   local api = ProfessionReagentsAPI
--   if api and api.version == 1 then
--       for _, use in ipairs(api.GetUses(2770) or {}) do
--           print(use.profession, use.min, use.max) -- Mineria 1 70
--       end
--   end
ProfessionReagentsAPI = {
    version = 1,

    -- { { skillLine, root, profession (idioma del cliente), min, max }, ... } o nil
    -- si no es componente de ninguna receta. min/max nil = sin rango conocido.
    GetUses = addon.GetUses,

    IsReagent = function(item)
        return addon.GetUses(item) ~= nil
    end,

    -- Nombre de una linea de profesion en el idioma del cliente
    GetProfessionName = addon.ProfessionName,

    -- Componentes de una profesion (skillLine raiz o de expansion); con level,
    -- solo los que se usan a ese nivel: { { itemID, skillLine, min, max }, ... }
    GetReagentsFor = function(skillLine, level)
        local out = {}
        for itemID in pairs(addon.REAGENTS or {}) do
            for _, use in ipairs(addon.GetUses(itemID)) do
                if (use.skillLine == skillLine or use.root == skillLine)
                    and (not level or (use.max and use.min <= level and level <= use.max)) then
                    out[#out + 1] = { itemID = itemID, skillLine = use.skillLine, min = use.min, max = use.max }
                end
            end
        end
        table.sort(out, function(a, b) return (a.min or 0) < (b.min or 0) end)
        return out
    end,
}

--------------------------------------------------
-- ARRANQUE
--------------------------------------------------
local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:SetScript("OnEvent", function(self, _, name)
    if name ~= addon.NAME then return end
    ProfessionReagentsDB = ProfessionReagentsDB or {}
    for k, v in pairs(addon.defaults) do
        if ProfessionReagentsDB[k] == nil then ProfessionReagentsDB[k] = v end
    end
    addon.db = ProfessionReagentsDB
    self:UnregisterEvent("ADDON_LOADED")
end)

SLASH_PROFESSIONREAGENTS1 = "/preag"
SLASH_PROFESSIONREAGENTS2 = "/professionreagents"
SlashCmdList["PROFESSIONREAGENTS"] = function()
    addon.OpenConfig()
end

-- Menu de addons del minimapa (## AddonCompartmentFunc del .toc): lo mismo que el comando
function ProfessionReagents_OnAddonCompartmentClick()
    addon.OpenConfig()
end
