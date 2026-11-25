--========================================================
-- UI/Options.lua
--========================================================
-- Subcategoria "General" de UI/About.lua. Tambien corre en 2.4.3: nada de
-- :SetSize (addon.SetSize).

local _, addon = ...
addon = addon or ProfessionReagents -- clientes < 3.0 no pasan argumentos
local L = addon.L

local MARGIN_X = 16
local HEADER = "|cffC47FF3"

local function AddTooltip(frame, text)
    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(text, nil, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

local function Check(panel, name, x, y, label, tooltip, key, onClick)
    local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", x, y)
    _G[name .. "Text"]:SetText(label)
    cb:SetScript("OnClick", function(self)
        addon.db[key] = self:GetChecked() and true or false
        if onClick then onClick() end
    end)
    AddTooltip(cb, tooltip)
    cb.key = key
    return cb
end

local function Separator(panel, y)
    local line = panel:CreateTexture(nil, "ARTWORK")
    addon.SetSize(line, 580, 1)
    line:SetPoint("TOPLEFT", MARGIN_X, y)
    addon.SetSolidColor(line, 1, 1, 1, 0.1)
end

local function CreateOptions()
    local panel = CreateFrame("Frame", "ProfessionReagentsOptions", UIParent)
    panel.name = L["GENERAL"]
    addon.SetSize(panel, 615, 580)
    panel:Hide() -- nace oculto: si no, el Show() al abrir la categoria no dispara OnShow

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", MARGIN_X, -16)
    title:SetText(L["OPTIONS_TITLE"])

    local logo = panel:CreateTexture(nil, "ARTWORK")
    addon.SetSize(logo, 110, 110)
    logo:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -10, -5)
    logo:SetTexture("Interface\\AddOns\\ProfessionReagents\\img\\logo_pr")

    local version = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    version:SetPoint("TOP", logo, "BOTTOM", 0, -2)
    version:SetText("v" .. (addon.GetVersion() or "?"))

    local header = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    header:SetPoint("TOPLEFT", MARGIN_X, -56)
    header:SetText(HEADER .. L["TOOLTIP_HEADER"] .. "|r")

    local range, extras
    local function Dim(cb, on)
        if on then cb:Enable() else cb:Disable() end -- SetEnabled no existe en 2.4.3
        cb:SetAlpha(on and 1 or 0.5)
    end
    local function Refresh()
        Dim(range, addon.db.enabled)
        for _, cb in ipairs(extras or {}) do Dim(cb, addon.db.disenchant) end
    end

    local checks = {
        Check(panel, "ProfessionReagentsEnableCB", MARGIN_X, -80, L["ENABLE"], L["TT_ENABLE"], "enabled", Refresh),
    }
    -- Depende de la anterior: sangrada 20 px y atenuada si esta apagada
    range = Check(panel, "ProfessionReagentsRangeCB", MARGIN_X + 20, -110, L["SHOW_RANGE"], L["TT_SHOW_RANGE"], "showRange")
    checks[2] = range

    local y = -150
    -- Desencantar y recoleccion (Core/Extras.lua): solo donde hay datos (WoW Forever)
    extras = {}
    if addon.DISENCHANT or addon.GATHER_NODES then
        Separator(panel, y)
        local h2 = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        h2:SetPoint("TOPLEFT", MARGIN_X, y - 16)
        h2:SetText(HEADER .. L["EXTRAS_HEADER"] .. "|r")
        local function Extra(name, indent, row, label, tip, key)
            local cb = Check(panel, name, MARGIN_X + indent, y - 40 - row * 30, label, tip, key, Refresh)
            checks[#checks + 1] = cb
            return cb
        end
        Extra("ProfessionReagentsDECB", 0, 0, L["DE_ENABLE"], L["TT_DE_ENABLE"], "disenchant")
        extras[#extras + 1] = Extra("ProfessionReagentsDEAlwaysCB", 20, 1, L["DE_ALWAYS"], L["TT_DE_ALWAYS"], "disenchantAlways")
        extras[#extras + 1] = Extra("ProfessionReagentsDEPriceCB", 20, 2, L["DE_PRICE"], L["TT_DE_PRICE"], "disenchantPrice")
        Extra("ProfessionReagentsDESourcesCB", 0, 3, L["DE_SOURCES"], L["TT_DE_SOURCES"], "disenchantSources")
        Extra("ProfessionReagentsGatherCB", 0, 4, L["GATHER_ENABLE"], L["TT_GATHER_ENABLE"], "gather")
        y = y - 40 - 5 * 30
    end

    Separator(panel, y)

    local reset = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    addon.SetSize(reset, 180, 26)
    reset:SetPoint("TOPLEFT", MARGIN_X, y - 16)
    reset:SetText(L["DEFAULTS"])
    AddTooltip(reset, L["TT_DEFAULTS"])

    panel:SetScript("OnShow", function()
        for _, cb in ipairs(checks) do cb:SetChecked(addon.db[cb.key]) end
        Refresh()
    end)
    reset:SetScript("OnClick", function()
        for k, v in pairs(addon.defaults) do addon.db[k] = v end
        panel:GetScript("OnShow")()
    end)

    addon.RegisterSubcategory(addon.CreateAbout(), panel)
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_LOGIN")
loader:SetScript("OnEvent", function()
    if addon.db then CreateOptions() end
end)
