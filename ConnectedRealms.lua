-- original list from https://web.archive.org/web/20131231124043/http://us.battle.net/wow/en/blog/11393305
-- latest lists seem to be here: https://us.battle.net/support/en/article/14296

local connectedRealmsUS = {

{ "Lightninghoof", "Maelstrom", "The Venture Co" },
{ "Shattered Hand", "Coilfang", "Dark Iron", "Dalvengyr", "Demon Soul" },
{ "Sisters of Elune", "Cenarion Circle " },
{ "Aegwynn", "Bonechewer", "Daggerspine", "Gurubashi", "Hakkar " },
{ "Agamaggan", "Archimonde", "Jaedenar", "The Underbog" },
{ "Aggramar", "Fizzcrank" },
{ "Akama", "Dragonmaw", "Mug'thol" },
{ "Alleria", "Khadgar" },
{ "Alexstrasza", "Terokkar" },
{ "Altar of Storms", "Anetheron", "Magtheridon", "Ysondre" },
{ "Alterac Mountains", "Balnazzar", "Gorgonnash", "The Forgotten Coast", "Warsong" },
{ "Andorhal", "Scilla", "Ursin", "Zuluhed" },
{ "Antonidas", "Uldum" },
{ "Anub’arak", "Chromaggus", "Chrushridge", "Garithos", "Nathrezim", "Smolderthorn" },
{ "Anvilmar", "Undermine" },
{ "Arygos", "Llane" },
{ "Auchindoun", "Cho'gall", "Laughing Skull" },
{ "Azgalor", "Azshara", "Destromath", "Thunderlord" },
{ "Azjol-Nerub", "Khaz Modan" },
{ "Azuremyst", "Staghelm" },
{ "Black Dragonflight", "Gul'dan", "Skullcrusher" },
{ "Blackhand", "Galakrond" },
{ "Blackwater Raiders", "Shadow Council" },
{ "Blackwing Lair", "Dethecus", "Detheroc", "Lethon", "Haomarush" },
{ "Bladefist", "Kul Tiras" },
{ "Blade's Edge", "Thunderhorn" },
{ "Blood Furnace", "Mannaroth", "Nazjatar" },
{ "Bloodscalp", "Boulderfist", "Dunemaul", "Maiev", "Stonemaul" },
{ "Borean Tundra", "Shadowsong " },
{ "Bronzebeard", "Shandris" },
{ "Burning Blade", "Lightning's Blade", "Onyxia" },
{ "Cairne", "Perenolde" },
{ "Dawnbringer", "Madoran" },
{ "Darrowmere", "Windrunner" },
{ "Dath'Remar", "Khaz'goroth" },
{ "Deathwing", "Executus", "Kalecgos", "Shattered Halls" },
{ "Dentarg", "Whisperwind" },
{ "Doomhammer", "Baelgun" },
{ "Draenor", "Echo Isles" },
{ "Draka", "Suramar" },
{ "Drak’Tharon", "Firetree", "Malorne", "Rivendare", "Spirestone", "Stormscale" },
{ "Drak'thul", "Skywall" },
{ "Dreadmaul", "Thaurissan" },
{ "Drenden", "Arathor" },
{ "Duskwood", "Bloodhoof" },
{ "Eitrigg", "Shu'halo" },
{ "Eldre'Thalas", "Korialstrasz" },
{ "Eonar", "Velen" },
{ "Eredar", "Gorefiend,Spinebreaker", "Wildhammer" },
{ "Exodar", "Medivh" },
{ "Farstriders", "Silver Hand", "Thorium Brotherhood" },
{ "Fenris", "Dragonblight" },
{ "Frostmane", "Ner'zhul", "Tortheldrin" },
{ "Frostwolf", "Vashj" },
{ "Ghostlands", "Kael'thas" },
{ "Gilneas", "Elune" },
{ "Gnomeregan", "Moonrunner" },
{ "Grizzly Hills", "Lothar" },
{ "Gundrak", "Jubei'Thos" },
{ "Hellscream", "Zangarmarsh" },
{ "Hydraxis", "Terenas" },
{ "Icecrown", "Malygos" },
{ "Kargath", "Norgannon" },
{ "Kilrogg", "Winterhoof" },
{ "Kirin Tor", "Sentinels", "Steamwheedle Cartel" },
{ "Malfurion", "Trollbane" },
{ "Misha", "Rexxar" },
{ "Mok'Nathal", "Silvermoon" },
{ "Nagrand", "Caelestrasz" },
{ "Nazgrel", "Nesingwary", "Vek'nilash" },
{ "Nordrassil", "Muradin" },
{ "Quel'dorei", "Sen'jin" },
{ "Ravenholdt", "Twisting Nether" },
{ "Runetotem", "Uther" },
{ "Scarlet Crusade", "Feathermoon" },
{ "Shadowmoon", "Detheroc" },
{ "Tanaris", "Greymane" },
{ "The Scryers", "Argent Dawn" },
{ "Uldaman", "Ravencrest" },
{ "Ysera", "Durotan" }

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
