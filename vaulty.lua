LoadAddOn("Blizzard_WeeklyRewards") -- Load Blizzard API

local _, Vaulty = ...

--Create chat command
SLASH_VAULTY1, SLASH_VAULTY2, SLASH_VAULTY3 = "/gv", "/greatvault", "/vaulty"

--GV Functions
function SlashCmdList.VAULTY(msg)
    WeeklyRewardsFrame:Show()
end