
local addonName = "ListDailies"

-- read TOC values
local addonVersion = GetAddOnMetadata(addonName, "Version")

_G[addonName] = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0","AceComm-3.0", "AceSerializer-3.0")

local addon = _G[addonName]

-- DB structure is global.realms.[realmName].dailies.[questTitle] = { ["timestamp"], ["zone"], ["source"] }
-- source is a table of characters that have provided that daily

local AddonDB_Defaults = {
	global = {
		realms = {}
	}
}

-- remove entries with timestamp older than the last reset time
-- table has quest name as key and table as value containing timestamp entry

local function expireDailies(realmName)
	local t = addon.db.global.realms[realmName].dailies
	-- seconds to next reset
	local nextReset = GetQuestResetTime()
	-- seconds since last reset
	local lastReset = (24 * 60 * 60) - nextReset
	-- addon.Print("expireDailies(" .. realmName .. ") last quest reset time was " .. lastReset .. " seconds ago")
	local now = time()
	-- now scan the table for timestamps older than the last reset and purge them
	for k, v in pairs(t) do
		local timestampAge = now - v.timestamp
		if timestampAge > lastReset then
			addon.Print("Purging " .. k .. " with expired timestamp")
			t[k] = nil
		else
			-- addon.Print(k .. " not expired")
		end
	end
end

function addon:OnInitialize()
	addon.db = LibStub("AceDB-3.0"):New(addonName .. "DB", AddonDB_Defaults)
end

local function RecordDaily(name)
	expireDailies(GetRealmName())
	-- save it in DB, send it out to other users
	local realmName = GetRealmName()
	local dailies = addon.db.global.realms[realmName].dailies
	if not dailies[name] then
		addon.Print("Adding " .. name .. " to today's known dailies")
	end
	local v = {}
	v.timestamp = time()
	v.zone = GetZoneText()
	v.source = { UnitName("player") }
	dailies[name] = v
end

local function SendRecords()
	-- addon:Print("SendRecords")
	local values = {
		["version"] = addonVersion,
		["source"] = UnitName("player"),
		["realm"] = GetRealmName(),
		["realms"] = addon.db.global.realms,
		["now"] = time()
	}
	addon:SendCommMessage(addonName, addon:Serialize(values), "GUILD")
end

local function OnGossipShow()
	-- addon:Print("OnGossipShow")
	local questCount = GetNumGossipAvailableQuests()
	local quests = {GetGossipAvailableQuests()}
	-- number of data items returned per quest
	local dataPerQuest = 6
	-- offsets into quests array for each kind of quest info
	local offsetTitle = 1
	local offsetIsDaily = 4
	for i = 1, questCount do
		local base = dataPerQuest * (i - 1)
		local title = quests[base + offsetTitle]
		local isDaily = LE_QUEST_FREQUENCY_DAILY == quests[base + offsetIsDaily]
		if isDaily then RecordDaily(title) end
	end
	SendRecords()
end

local function OnQuestDetail()
	-- addon:Print("OnQuestDetail")
	local titleText = GetTitleText()
	local isDaily = QuestIsDaily()
	if isDaily then RecordDaily(titleText) end
	SendRecords()
end

function addon:OnCommReceived(prefix, message, distribution, sender)
	-- process the incoming message
	-- addon:Print("OnCommReceived")
	local success, values = addon:Deserialize(message)
	if not success then
		addon:Print("OnCommReceived failed to deserialize message: " .. values)
		return
	end
	if (values["source"] == UnitName("player")) and (values["realm"] == GetRealmName()) then
		-- ignore data we just broadcast
		return
	end
	local now = time()
	local adjust = now - values["now"]
        if math.abs(adjust) > 10 then
		addon:Print("Adjusting incoming quest timestamps by " .. adjust .. " seconds")
	end
	-- addon:Print(values["source"] .. "-" .. values["realm"] .. " is running version " .. values["version"])
	-- copy realm/dailies structure into our DB
	for realmName, realmData in pairs(values["realms"]) do
		if not addon.db.global.realms[realmName] then
			addon.db.global.realms[realmName] = {}
		end
		if not addon.db.global.realms[realmName].dailies then
			addon.db.global.realms[realmName].dailies = {}
		end
		expireDailies(realmName)
		for quest, details in pairs(realmData.dailies) do
			-- adjust incoming timestamps to local timebase (might be from different timezones)
			details.timestamp = details.timestamp + adjust
			addon.db.global.realms[realmName].dailies[quest] = details
		end
	end
end

function addon:OnEnable()
	addon:RegisterEvent("GOSSIP_SHOW", OnGossipShow)
	addon:RegisterEvent("QUEST_DETAIL", OnQuestDetail)
	addon:RegisterComm(addonName)
	addon:Print("version " .. addonVersion .. " enabled")
	-- remove obsolete data
	addon.db.realm.dailies = nil
	-- create top-level table for this realm
	if not addon.db.global.realms then
		addon.db.global.realms = {}
	end
	local realmName = GetRealmName()
	if not addon.db.global.realms[realmName] then
		addon.db.global.realms[realmName] = {}
	end
	if not addon.db.global.realms[realmName].dailies then
		addon.db.global.realms[realmName].dailies = {}
	end
	expireDailies(GetRealmName())
end

function addon:OnDisable()
	addon:UnregisterEvent("GOSSIP_SHOW")
	addon:UnregisterEvent("QUEST_GREETING")
	addon:UnregisterEvent("QUEST_DETAIL")
end

SLASH_DAILIES1="/dailies"
SlashCmdList["DAILIES"] = function(msg)
	-- construct merged quest list for all connected realms
	local realmList = findConnectedRealmsUS(GetRealmName())
	local zoneList = {}
	for i = 1, #realmList do
		local realmName = realmList[i]
		-- addon:Print("Processing realm " .. realmName)
		-- may be empty for connected realms that don't have data
		if addon.db.global.realms[realmName] then
			expireDailies(realmName)
			for title, details in pairs(addon.db.global.realms[realmName].dailies) do
				local zoneName = details.zone
				-- addon:Print("adding " .. zoneName .. " - " .. title .. " to merged list")
				if not zoneList[zoneName] then
					zoneList[zoneName] = {}
				end
				zoneList[zoneName][title] = 1
			end
		end
	end
	-- test result table for empty
	if next(zoneList) == nil then
		addon:Print("No dailies recorded.")
	else
		for zone, quests in pairs(zoneList) do
			addon:Print(zone)
			for title, _ in pairs(quests) do
				addon:Print("-- " .. title)
			end
		end
	end
end
