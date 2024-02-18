-- original list from https://web.archive.org/web/20131231124043/http://us.battle.net/wow/en/blog/11393305
-- latest lists seem to be here: https://us.battle.net/support/en/article/14296

local connectedRealmsUS = {

{ "Aegwynn", "Bonechewer", "Daggerspine", "Garrosh", "Gurubashi", "Hakkar" },
{ "Agamaggan", "Archimonde", "Burning Legion", "Jaedenar", "The Underbog", "Kargath", "Norgannon", "Blade's Edge", "Thunderhorn" },
{ "Aggramar", "Fizzcrank" },
{ "Alexstrasza", "Terokkar" },
{ "Alleria", "Khadgar", "Medivh", "Exodar" },
{ "Argent Dawn", "The Scryers" },
{ "Andorhal", "Scilla", "Ursin", "Zuluhed", "Eonar", "Velen", "Black Dragonflight", "Gul'dan", "Skullcrusher" },
{ "Azgalor", "Azshara", "Destromath", "Thunderlord", "Blood Furnace", "Mannoroth", "Nazjatar" },
{ "Azjol-Nerub", "Blackrock", "Khaz Modan", "Muradin", "Nordrassil" },
{ "Baelgun", "Doomhammer" },
{ "Blackhand", "Galakrond" },
{ "Bloodhoof", "Duskwood", "Bloodrazor" },
{ "Bloodscalp", "Boulderfist", "Dunemaul", "Maiev", "Stonemaul", "Sen'jin", "Quel'dorei" },
{ "Bronzebeard", "Shandris" },
{ "Burning Blade", "Lightning's Blade", "Onyxia", "Garona", "Icecrown", "Malygos" },
{ "Caelestrasz", "Nagrand", "Saurfang" },
{ "Cairne", "Perenolde", "Cenarius", "Korgath", "Blackmoore", "Frostmane", "Ner'zhul", "Tortheldrin" },
{ "Anub'arak", "Chromaggus", "Crushridge", "Garithos", "Nathrezim", "Smolderthorn", "Arathor", "Drenden" },
{ "Coilfang", "Dalvengyr", "Dark Iron", "Demon Soul", "Shattered Hand" },
{ "Blackwing Lair", "Dethecus", "Detheroc", "Haomarush", "Lethon", "Shadowmoon" },
{ "Darrowmere", "Draka", "Suramar", "Windrunner" },
{ "Draenor", "Echo Isles" },
{ "Dragonblight", "Fenris" },
{ "Drak'Thul", "Skywall", "Silvermoon", "Mok'Nathal", "Borean Tundra", "Shadowsong", "Hydraxis", "Terenas" },
{ "Akama", "Dragonmaw", "Eldre'Thalas", "Korialstrasz", "Mug'thol", "Antonidas", "Uldum" },
{ "Durotan", "Ysera" },
{ "Eitrigg", "Shu'halo" },
{ "Eredar", "Gorefiend", "Spinebreaker", "Wildhammer", "Hellscream", "Zangarmarsh" },
{ "Elune", "Gilneas", "Laughing Skull", "Auchindoun", "Cho'gall" },
{ "Feathermoon", "Scarlet Crusade" },
{ "Frostwolf", "Vashj", "Drak'Tharon", "Firetree", "Malorne", "Rivendare", "Spirestone", "Stormscale" },
{ "Greymane", "Tanaris" },
{ "Gundrak", "Jubei'Thos", "Frostmourne", "Dreadmaul", "Thaurissan" },
{ "Deathwing", "Executus", "Kalecgos", "Shattered Halls" },
{ "Dath'Remar", "Khaz'goroth" },
{ "Kilrogg", "Winterhoof" },
{ "Kirin Tor", "Sentinels", "Steamwheedle Cartel" },
{ "Kul Tiras", "Bladefist" },
{ "Llane", "Arygos" },
{ "Lightninghoof", "Ravenholdt", "Twisting Nether", "Maelstrom", "The Venture Company" },
{ "Ghostlands", "Kael'thas", "Grizzly Hills", "Gnomeregan", "Moonrunner", "Trollbane", "Lothar", "Malfurion" },
{ "Altar of Storms", "Anetheron", "Magtheridon", "Ysondre" },
{ "Nemesis", "Tol Barad" },
{ "Ravencrest", "Uldaman" },
{ "Misha", "Rexxar" },
{ "Runetotem", "Uther" },
{ "Blackwater Raiders", "Cenarion Circle", "Sisters of Elune", "Shadow Council" },
{ "Farstriders", "Silver Hand", "Thorium Brotherhood" },
{ "Azuremyst", "Staghelm", "Dawnbringer", "Madoran" },
{ "Nazgrel", "Nesingwary", "Vek'nilash" },
{ "Alterac Mountains", "Balnazzar", "Gorgonnash", "The Forgotten Coast", "Warsong", "Anvilmar", "Undermine", "Xavius" },
{ "Dentarg", "Whisperwind" },
{ "Aerie Peak" },
{ "Al'Akir" },
{ "Aman'Thul" },
{ "Arthas" },
{ "Azralon" },
{ "Barthilas" },
{ "Bleeding Hollow" },
{ "Dragonstalker" },
{ "Darkspear" },
{ "Drakkari" },
{ "Earthen Ring" },
{ "Emerald Dream" },
{ "Eskhandar" },
{ "Fairbanks" },
{ "Gallywix" },
{ "Goldrinn" },
{ "Illidan" },
{ "Hyjal" },
{ "Moon Guard" },
{ "Area 52" },
{ "Thrall" },
{ "Dalaran" },
{ "Mal'Ganis" },
{ "Turalyon" },
{ "Kel'Thuzad" },
{ "Lightbringer" },
{ "Kil'jaeden" },
{ "Krol Blade" },
{ "Kurinnaxx" },
{ "Lawbringer" },
{ "Nightslayer" },
{ "Obsidian Edge" },
{ "Perdition's Blade" },
{ "Proudmoore" },
{ "Quel'Thalas" },
{ "Ragnaros" },
{ "Rajaxx" },
{ "Rattlegore" },
{ "Sargeras" },
{ "Smolderweb" },
{ "Soulseeker" },
{ "Spineshatter" },
{ "Stormrage" },
{ "Stormreaver" },
{ "Sulfuras" },
{ "Taerar" },
{ "Thunderstrike" },
{ "Tichondrius" },
{ "Wyrmrest Accord" },
{ "Zul'jin" }

}

-- return true if v is a value in the table t

local function isMember(v, t)
	for _, tv in pairs(t) do 
		if v == tv then 
			return true
		end 
	end
	return false
end

-- return list of realms connected to the argument realm

function findConnectedRealmsUS(realmName)
	for _, v in pairs(connectedRealmsUS) do 
		if isMember(realmName, v) then 
			return v 
		end 
	end
	-- not connected to another realm, so return realm in a list by itself
	return { realmName }
end
