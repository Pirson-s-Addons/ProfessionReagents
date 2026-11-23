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

    local range
    local function Refresh()
        local on = addon.db.enabled
        if on then range:Enable() else range:Disable() end -- SetEnabled no existe en 2.4.3
        range:SetAlpha(on and 1 or 0.5)
    end

    local checks = {
        Check(panel, "ProfessionReagentsEnableCB", MARGIN_X, -80, L["ENABLE"], L["TT_ENABLE"], "enabled", Refresh),
    }
    -- Depende de la anterior: sangrada 20 px y atenuada si esta apagada
    range = Check(panel, "ProfessionReagentsRangeCB", MARGIN_X + 20, -110, L["SHOW_RANGE"], L["TT_SHOW_RANGE"], "showRange")
    checks[2] = range

    Separator(panel, -150)

    local reset = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    addon.SetSize(reset, 180, 26)
    reset:SetPoint("TOPLEFT", MARGIN_X, -166)
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
