LoadAddOn("Blizzard_WeeklyRewards") -- Load Blizzard API
if _G["WeeklyRewardExpirationWarningDialog"] then _G["WeeklyRewardExpirationWarningDialog"]:Hide() end

local _, Vaulty = ...

-- Call Ace LibDBIcon Minimap library https://www.wowace.com/projects/libdbicon-1-0
-- This section creates the minimap button using .. ^
Vaulty = LibStub("AceAddon-3.0"):NewAddon(Vaulty, "Vaulty", "AceConsole-3.0")

VaultyLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Vaulty", {
	type = "data source",
    text = "Vaulty",
	icon = "Interface\\Addons\\Vaulty\\Images\\vaulty.tga",
    OnClick = function()
        if WeeklyRewardsFrame:IsShown() then
            WeeklyRewardsFrame:Hide()
        else WeeklyRewardsFrame:Show()
        end
    end,
	OnTooltipShow = function(tt)
    tt:AddLine("|cffFFFFFFVaulty|r")
    tt:AddLine("|cff0080FFv1.3-release|r")
    tt:AddLine(" ")
    tt:AddLine("Opens your vault.")
	tt:AddLine(" ")
    tt:AddLine("You can also type |cff00D1FF/vaulty|r, |cff00D1FF/gv|r, or |cff00D1FF/greatvault|r.")
    tt:AddLine("Type |cff00D1FF/vaulty togglemapicon|r to show or hide this button.")
    end
})

LibDBIcon = LibStub("LibDBIcon-1.0")

--Register commands and load settings
function Vaulty:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("VaultyDB", {profile = {minimap = {hide = false,},},})
    LibDBIcon:Register("Vaulty", VaultyLDB, self.db.profile.minimap)
    self:RegisterChatCommand('vaulty', 'VaultyCmd')
    self:RegisterChatCommand('gv', 'VaultyCmd')
    self:RegisterChatCommand('greatvault', 'VaultyCmd')
end

--Slash command function
function Vaulty:VaultyCmd(input)
    if input == "togglemapicon"
    then self.db.profile.minimap.hide = not self.db.profile.minimap.hide
        DEFAULT_CHAT_FRAME:AddMessage("|cff4D85E6Vaulty minimap button is now|r " .. 
            (self.db.profile.minimap.hide and "|cffFF6B6Bhidden|r|cff4D85E6.|r" or "|cff008C80shown|r|cff4D85E6.|r"))
        if self.db.profile.minimap.hide then LibDBIcon:Hide("Vaulty")
        else LibDBIcon:Show("Vaulty")
        end
    else
        if WeeklyRewardsFrame:IsShown() then
            WeeklyRewardsFrame:Hide()
        else WeeklyRewardsFrame:Show()
        end
    end
end

--Add keybind option
