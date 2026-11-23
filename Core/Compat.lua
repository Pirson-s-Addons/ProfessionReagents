--========================================================
-- Compat.lua
--========================================================
-- El addon esta escrito contra la API moderna. Aqui vive TODO lo que hace falta
-- para que el mismo codigo arranque en un cliente viejo de servidor privado:
-- 2.4.3 (TBC), 3.3.5a (WotLK), 4.3.4 (Cata), 5.4.8 (MoP), 6.2.4 (WoD),
-- 7.3.5 (Legion), 8.3.7 (BfA) y 9.2.5 (Shadowlands). Mismas ramas que
-- Core/Compat.lua de WoWTranslator, que estan contrastadas con el codigo de
-- interfaz de Blizzard de cada version.
--
-- Fuera de este fichero, una regla para no romper 2.4.3: nada de
-- :SetSize(w, h), que no existe; se usa addon.SetSize.
--
-- Carga EL PRIMERO: monta el namespace que recogen los demas ficheros.
--
-- Regla al tocar esto: detectar la FUNCION, no la version del cliente. Solo se
-- mira la version donde no hay nada que detectar (una firma que cambio).

local ADDON_NAME, addon = ...

--------------------------------------------------
-- NAMESPACE
--------------------------------------------------
-- Clientes < 3.0 cargan los ficheros sin argumentos: el namespace es el global
-- ProfessionReagents y cada fichero lo recoge en la segunda linea de su cabecera.
addon = addon or ProfessionReagents or {}
ProfessionReagents = addon
addon.NAME = ADDON_NAME or "ProfessionReagents"

--------------------------------------------------
-- ITEMS Y HECHIZOS
--------------------------------------------------

-- C_Spell.GetSpellName llega en 11.0 y GetSpellInfo desaparece alli.
function addon.GetSpellName(spellID)
    if C_Spell and C_Spell.GetSpellName then return C_Spell.GetSpellName(spellID) end
    return GetSpellInfo and (GetSpellInfo(spellID))
end

-- Icono de un hechizo por id. GetSpellTexture en clientes antiguos pide el
-- indice del libro, no el id: por eso el tercer valor de GetSpellInfo.
function addon.GetSpellIcon(spellID)
    if C_Spell and C_Spell.GetSpellTexture then return C_Spell.GetSpellTexture(spellID) end
    return GetSpellInfo and select(3, GetSpellInfo(spellID))
end

-- C_Item.GetItemInfo llega en 10.2 (y el global se va en 11.0). Acepta id,
-- enlace o nombre (este ultimo solo si el objeto esta en la cache del cliente).
function addon.GetItemLink(item)
    local get = (C_Item and C_Item.GetItemInfo) or GetItemInfo
    local _, link = get(item)
    return link
end

-- Etiquetas de las lineas de profesion por expansion (Retail): llega en 7.x.
function addon.GetSkillLineName(skillLine)
    local get = C_TradeSkillUI and C_TradeSkillUI.GetTradeSkillDisplayName
    local ok, name = false, nil
    if get then ok, name = pcall(get, skillLine) end
    if ok and type(name) == "string" and name ~= "" then return name end
end

--------------------------------------------------
-- WIDGETS
--------------------------------------------------

-- Region:SetSize no existe en 2.4.3.
function addon.SetSize(region, w, h)
    region:SetWidth(w)
    region:SetHeight(h)
end

-- Texture:SetColorTexture llega en 7.0. Antes, SetTexture con cuatro numeros
-- hacia lo mismo (y en los clientes modernos esa forma ya no existe).
function addon.SetSolidColor(texture, r, g, b, a)
    if texture.SetColorTexture then
        texture:SetColorTexture(r, g, b, a)
    else
        texture:SetTexture(r, g, b, a)
    end
end



-- C_AddOns.GetAddOnMetadata llega en 10.1; el global de siempre ya no existe.
function addon.GetMetadata(field)
    local get = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata
    return get(addon.NAME, field)
end


function addon.GetVersion()
    return addon.GetMetadata("Version")
end

--------------------------------------------------
-- PANEL DE OPCIONES
--------------------------------------------------
-- Settings llega en 10.0. Antes, InterfaceOptions_AddCategory, que identifica
-- la categoria por el nombre del panel.
local hasSettings = (Settings and Settings.RegisterCanvasLayoutCategory) and true or false

-- La raiz es la vista "Acerca de" (UI/About.lua) y los ajustes cuelgan de ella.
-- Las dos devuelven la categoria; la subcategoria queda como destino de /preag.
function addon.RegisterCategory(panel)
    if hasSettings then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
        addon.categoryID = category:GetID()
        return category
    end

    InterfaceOptions_AddCategory(panel)
    addon.categoryID = panel.name
    return panel
end

-- Antes de Settings, una subcategoria es un panel que apunta al NOMBRE de su
-- padre, no a una referencia.
function addon.RegisterSubcategory(parentCategory, panel)
    if hasSettings then
        local category = Settings.RegisterCanvasLayoutSubcategory(parentCategory, panel, panel.name)
        addon.categoryID = category:GetID()
        return category
    end

    panel.parent = parentCategory.name
    InterfaceOptions_AddCategory(panel)
    addon.categoryID = panel.name
    return panel
end

function addon.OpenConfig()
    if not addon.categoryID then return end

    if hasSettings then
        Settings.OpenToCategory(addon.categoryID)
        return
    end

    -- 2.4.3 solo trae OpenToFrame; desde 3.x, OpenToCategory. Fallo conocido
    -- del cliente antiguo: la primera llamada solo abre el marco, la segunda
    -- es la que selecciona la categoria.
    local open = InterfaceOptionsFrame_OpenToCategory or InterfaceOptionsFrame_OpenToFrame
    open(addon.categoryID)
    open(addon.categoryID)
end
