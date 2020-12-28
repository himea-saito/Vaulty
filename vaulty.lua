LoadAddOn("Blizzard_WeeklyRewards") -- Load Blizzard API

local _, Vaulty = ...

--Create chat command
SLASH_VAULTY1, SLASH_VAULTY2, SLASH_VAULTY3 = "/gv", "/greatvault", "/vaulty"

function SlashCmdList.VAULTY(msg)
    WeeklyRewardsFrame:Show()
end

-- Call Ace LibDBIcon Minimap library https://www.wowace.com/projects/libdbicon-1-0
-- This section creates the minimap button using .. ^
Vaulty = LibStub("AceAddon-3.0"):NewAddon(Vaulty, "Vaulty", "AceConsole-3.0")

VaultyLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Vaulty", {
	type = "data source",
    text = "Vaulty",
	icon = "Interface\\Addons\\Vaulty\\Images\\vaulty.tga",
    OnClick = function()
        WeeklyRewardsFrame:Show()
    end,
	OnTooltipShow = function(tt)
    tt:AddLine("Vaulty")
    tt:AddLine(" ")
    tt:AddLine("Opens your vault.")
	tt:AddLine(" ")
	tt:AddLine("You can also type /vaulty, /gv, or /greatvault")
    end
})

LibDBIcon = LibStub("LibDBIcon-1.0")

function Vaulty:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("VaultyDB", {profile = {minimap = {hide = false,},},})
    LibDBIcon:Register("Vaulty", VaultyLDB, self.db.profile.minimap)
end