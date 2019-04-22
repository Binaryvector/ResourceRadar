-- This file defines factors which transform global map units into the world units (meters)
-- Not a fan of hardcoding these, but I don't know any way to instantly calculate these values when a player enters a zone.

local LIB_NAME = "Lib3D-v3"
local lib = Lib3D

local DEFAULT_GLOBAL_TO_WORLD_FACTOR = 25000
lib.DEFAULT_GLOBAL_TO_WORLD_FACTOR = DEFAULT_GLOBAL_TO_WORLD_FACTOR
-- side note: 4000 / 16 = 25.000, given that word units seem to be meters, this means tamriel is 25 km wide :-)

-- For base game zones, except craglorn and cyrodiil DEFAULT_GLOBAL_TO_WORLD_FACTOR is correct.
-- Everything close to 25k will be removed/commented as that is just DEFAULT_GLOBAL_TO_WORLD_FACTOR
-- with some measurement related rounding errors.
lib.SPECIAL_GLOBAL_TO_WORLD_FACTORS = {
	[1011] = 20973.5809820437, -- summerset
	[980] = 12500, -- clockwork
	[981] = 12559.0760510685, -- brass fortress
--[[
	[1] = "ID_WITHOUT_INDEX",
	[2] = "ID_WITHOUT_INDEX",
--]]
	[3] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Glenumbra",
--[[
	[4] = "ID_WITHOUT_INDEX",
	[5] = "ID_WITHOUT_INDEX",
	[6] = "ID_WITHOUT_INDEX",
	[7] = "ID_WITHOUT_INDEX",
	[8] = "ID_WITHOUT_INDEX",
	[9] = "ID_WITHOUT_INDEX",
	[10] = "ID_WITHOUT_INDEX",
--]]
	[11] = 100016.1847866121, --"Vaults of Madness",
--[[
	[12] = "ID_WITHOUT_INDEX",
	[13] = "ID_WITHOUT_INDEX",
	[14] = "ID_WITHOUT_INDEX",
	[15] = "ID_WITHOUT_INDEX",
	[16] = "ID_WITHOUT_INDEX",
	[17] = "ID_WITHOUT_INDEX",
	[18] = "ID_WITHOUT_INDEX",
]]--
	[19] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Stormhaven",
	[20] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Rivenspire",
--[[
	[21] = "ID_WITHOUT_INDEX",
	[22] = "Volenfell",
	[23] = "ID_WITHOUT_INDEX",
	[24] = "ID_WITHOUT_INDEX",
	[25] = "ID_WITHOUT_INDEX",
	[26] = "ID_WITHOUT_INDEX",
	[27] = "ID_WITHOUT_INDEX",
	[28] = "ID_WITHOUT_INDEX",
	[29] = "ID_WITHOUT_INDEX",
	[30] = "ID_WITHOUT_INDEX",
	[31] = "Selene's Web",
	[32] = "ID_WITHOUT_INDEX",
	[33] = "ID_WITHOUT_INDEX",
	[34] = "ID_WITHOUT_INDEX",
	[35] = "ID_WITHOUT_INDEX",
	[36] = "ID_WITHOUT_INDEX",
	[37] = "ID_WITHOUT_INDEX",
	[38] = "Blackheart Haven",
	[39] = "ID_WITHOUT_INDEX",
	[40] = "ID_WITHOUT_INDEX",
--]]
	[41] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Stonefalls",
--[[
	[42] = "ID_WITHOUT_INDEX",
	[43] = "ID_WITHOUT_INDEX",
	[44] = "ID_WITHOUT_INDEX",
	[45] = "ID_WITHOUT_INDEX",
	[46] = "ID_WITHOUT_INDEX",
	[47] = "ID_WITHOUT_INDEX",
	[48] = "ID_WITHOUT_INDEX",
	[49] = "ID_WITHOUT_INDEX",
	[50] = "ID_WITHOUT_INDEX",
	[51] = "ID_WITHOUT_INDEX",
	[52] = "ID_WITHOUT_INDEX",
	[53] = "ID_WITHOUT_INDEX",
	[54] = "ID_WITHOUT_INDEX",
	[55] = "ID_WITHOUT_INDEX",
	[56] = "ID_WITHOUT_INDEX",
--]]
	[57] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Deshaan",
	[58] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Malabal Tor",
--[[
	[59] = "ID_WITHOUT_INDEX",
	[60] = "ID_WITHOUT_INDEX",
	[61] = "ID_WITHOUT_INDEX",
	[62] = "ID_WITHOUT_INDEX",
	[63] = "Darkshade Caverns I",
	[64] = "Blessed Crucible",
	[65] = "ID_WITHOUT_INDEX",
	[66] = "ID_WITHOUT_INDEX",
	[67] = "ID_WITHOUT_INDEX",
	[68] = "ID_WITHOUT_INDEX",
	[69] = "ID_WITHOUT_INDEX",
	[70] = "ID_WITHOUT_INDEX",
	[71] = "ID_WITHOUT_INDEX",
	[72] = "ID_WITHOUT_INDEX",
	[73] = "ID_WITHOUT_INDEX",
	[74] = "ID_WITHOUT_INDEX",
	[75] = "ID_WITHOUT_INDEX",
	[76] = "ID_WITHOUT_INDEX",
	[77] = "ID_WITHOUT_INDEX",
	[78] = "ID_WITHOUT_INDEX",
	[79] = "ID_WITHOUT_INDEX",
	[80] = "ID_WITHOUT_INDEX",
	[81] = "ID_WITHOUT_INDEX",
	[82] = "ID_WITHOUT_INDEX",
	[83] = "ID_WITHOUT_INDEX",
	[84] = "ID_WITHOUT_INDEX",
	[85] = "ID_WITHOUT_INDEX",
	[86] = "ID_WITHOUT_INDEX",
	[87] = "ID_WITHOUT_INDEX",
	[88] = "ID_WITHOUT_INDEX",
	[89] = "ID_WITHOUT_INDEX",
	[90] = "ID_WITHOUT_INDEX",
	[91] = "ID_WITHOUT_INDEX",
]]--
	[92] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Bangkorai",
--[[
	[93] = "ID_WITHOUT_INDEX",
	[94] = "ID_WITHOUT_INDEX",
	[95] = "ID_WITHOUT_INDEX",
	[96] = "ID_WITHOUT_INDEX",
	[97] = "ID_WITHOUT_INDEX",
	[98] = "ID_WITHOUT_INDEX",
	[99] = "ID_WITHOUT_INDEX",
	[100] = "ID_WITHOUT_INDEX",
--]]
	[101] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Eastmarch",
--	[102] = "ID_WITHOUT_INDEX",
	[103] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"The Rift",
	[104] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Alik'r Desert",
--[[
	[105] = "ID_WITHOUT_INDEX",
	[106] = "ID_WITHOUT_INDEX",
--]]
	[108] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Greenshade",
--[[
	[109] = "ID_WITHOUT_INDEX",
	[110] = "ID_WITHOUT_INDEX",
	[111] = "ID_WITHOUT_INDEX",
	[112] = "ID_WITHOUT_INDEX",
	[113] = "ID_WITHOUT_INDEX",
	[114] = "ID_WITHOUT_INDEX",
	[115] = "ID_WITHOUT_INDEX",
	[116] = "ID_WITHOUT_INDEX",
--]]
	[117] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Shadowfen",
--[[
	[118] = "ID_WITHOUT_INDEX",
	[119] = "ID_WITHOUT_INDEX",
	[120] = "ID_WITHOUT_INDEX",
	[121] = "ID_WITHOUT_INDEX",
	[122] = "ID_WITHOUT_INDEX",
	[123] = "ID_WITHOUT_INDEX",
	[124] = "Root Sunder Ruins",
	[125] = "ID_WITHOUT_INDEX",
	[126] = "Elden Hollow I",
	[127] = "ID_WITHOUT_INDEX",
	[128] = "ID_WITHOUT_INDEX",
	[129] = "ID_WITHOUT_INDEX",
	[130] = "Crypt of Hearts I",
	[131] = "Tempest Island",
	[132] = "ID_WITHOUT_INDEX",
	[133] = "ID_WITHOUT_INDEX",
]]--
	[134] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Sanguine's Demesne",
--[[
	[135] = "ID_WITHOUT_INDEX",
	[136] = "ID_WITHOUT_INDEX",
	[137] = "Rulanyil's Fall",
--]]
	[138] = 250020.5226540255, --"Crimson Cove",
--[[
	[139] = "ID_WITHOUT_INDEX",
	[140] = "ID_WITHOUT_INDEX",
	[141] = "ID_WITHOUT_INDEX",
	[142] = "Bonesnap Ruins",
	[143] = "ID_WITHOUT_INDEX",
	[144] = "Spindleclutch I",
	[145] = "ID_WITHOUT_INDEX",
	[146] = "Wayrest Sewers I",
	[147] = "ID_WITHOUT_INDEX",
	[148] = "Arx Corinium",
	[149] = "ID_WITHOUT_INDEX",
	[150] = "ID_WITHOUT_INDEX",
	[151] = "ID_WITHOUT_INDEX",
	[152] = "ID_WITHOUT_INDEX",
	[153] = "ID_WITHOUT_INDEX",
	[154] = "ID_WITHOUT_INDEX",
	[155] = "ID_WITHOUT_INDEX",
	[156] = "ID_WITHOUT_INDEX",
	[157] = "ID_WITHOUT_INDEX",
	[158] = "ID_WITHOUT_INDEX",
	[159] = "Emeric's Dream",
	[160] = "ID_WITHOUT_INDEX",
	[161] = "ID_WITHOUT_INDEX",
	[162] = "Obsidian Scar",
	[163] = "ID_WITHOUT_INDEX",
	[164] = "ID_WITHOUT_INDEX",
	[165] = "ID_WITHOUT_INDEX",
	[166] = "Cath Bedraud",
	[167] = "ID_WITHOUT_INDEX",
	[168] = "Bisnensel",
	[169] = "Razak's Wheel",
	[170] = "ID_WITHOUT_INDEX",
	[171] = "ID_WITHOUT_INDEX",
	[172] = "ID_WITHOUT_INDEX",
	[173] = "ID_WITHOUT_INDEX",
	[174] = "ID_WITHOUT_INDEX",
	[175] = "ID_WITHOUT_INDEX",
	[176] = "City of Ash I",
	[177] = "ID_WITHOUT_INDEX",
	[178] = "ID_WITHOUT_INDEX",
	[179] = "ID_WITHOUT_INDEX",
	[180] = "ID_WITHOUT_INDEX",
--]]
	[181] = DEFAULT_GLOBAL_TO_WORLD_FACTOR * 10000 / 4500, --"Cyrodiil",
--[[
	[182] = "ID_WITHOUT_INDEX",
	[183] = "ID_WITHOUT_INDEX",
	[184] = "ID_WITHOUT_INDEX",
	[185] = "ID_WITHOUT_INDEX",
	[186] = "ID_WITHOUT_INDEX",
	[187] = "Loriasel",
	[188] = "The Apothecarium",
	[189] = "Tribunal Temple",
	[190] = "Reservoir of Souls",
	[191] = "Ash Mountain",
	[192] = "Virak Keep",
	[193] = "Tormented Spire",
	[194] = "ID_WITHOUT_INDEX",
	[195] = "ID_WITHOUT_INDEX",
	[196] = "ID_WITHOUT_INDEX",
	[197] = "ID_WITHOUT_INDEX",
	[198] = "ID_WITHOUT_INDEX",
	[199] = "The Harborage",
	[200] = "The Foundry of Woe",
	[201] = "Castle of the Worm",
	[202] = "ID_WITHOUT_INDEX",
	[203] = "Cheesemonger's Hollow",
	[204] = "ID_WITHOUT_INDEX",
	[205] = "ID_WITHOUT_INDEX",
	[206] = "ID_WITHOUT_INDEX",
	[207] = "Mzeneldt",
	[208] = "The Earth Forge",
	[209] = "Halls of Submission",
	[210] = "ID_WITHOUT_INDEX",
	[211] = "ID_WITHOUT_INDEX",
	[212] = "Mournhold Sewers",
	[213] = "Sunscale Ruins",
	[214] = "Lair of the Skin Stealer",
	[215] = "Vision of the Hist",
	[216] = "Crow's Wood",
	[217] = "The Halls of Torment",
	[218] = "Circus of Cheerful Slaughter",
	[219] = "Chateau of the Ravenous Rodent",
	[220] = "ID_WITHOUT_INDEX",
	[221] = "ID_WITHOUT_INDEX",
	[222] = "Dresan Keep",
	[223] = "Tomb of Lost Kings",
	[224] = "Breagha-Fin",
	[225] = "ID_WITHOUT_INDEX",
	[226] = "ID_WITHOUT_INDEX",
	[227] = "The Sunken Road",
	[228] = "Bangkorai Garrison",
	[229] = "Nilata Ruins",
	[230] = "ID_WITHOUT_INDEX",
	[231] = "Hall of Heroes",
	[232] = "Silyanorn Ruins",
	[233] = "Ruins of Ten-Maur-Wolk",
	[234] = "Odious Chapel",
	[235] = "Temple of Sul",
	[236] = "White Rose Prison Dungeon",
	[237] = "Impervious Vault",
	[238] = "Salas En",
	[239] = "Kulati Mines",
	[240] = "ID_WITHOUT_INDEX",
	[241] = "House Indoril Crypt",
	[242] = "Fort Arand Dungeons",
	[243] = "Coral Heart Chamber",
	[244] = "ID_WITHOUT_INDEX",
	[245] = "Heimlyn Keep Reliquary",
	[246] = "Iliath Temple Mines",
	[247] = "House Dres Crypts",
	[248] = "Mzithumz",
	[249] = "Tal'Deic Crypts",
	[250] = "Narsis Ruins",
	[251] = "ID_WITHOUT_INDEX",
	[252] = "The Hollow Cave",
	[253] = "Shad Astula Underhalls",
	[254] = "Deepcrag Den",
	[255] = "Bthanual",
	[256] = "Crosswych Mine",
	[257] = "Vaults of Vernim",
	[258] = "Arcwind Point",
	[259] = "Trolhetta",
	[260] = "Lost Knife Cave",
	[261] = "Bonestrewn Barrow",
	[262] = "Wittestadr Crypts",
	[263] = "Mistwatch Crevasse",
	[264] = "Fort Morvunskar",
	[265] = "Mzulft",
	[266] = "Cragwallow",
	[267] = "Eyevea",
	[268] = "Stormwarden Undercroft",
	[269] = "Abamath Ruins",
	[270] = "Shrine of the Black Maw",
	[271] = "Broken Tusk",
--]]
	[272] = 249734.3464600071, --"Atanaz Ruins",
--[[
	[273] = "Chid-Moska Ruins",
	[274] = "Onkobra Kwama Mine",
	[275] = "Gandranen Ruins",
	[276] = "ID_WITHOUT_INDEX",
	[277] = "ID_WITHOUT_INDEX",
	[278] = "ID_WITHOUT_INDEX",
	[279] = "Pregame",
--]]
	[280] = 79219.2126669732, --"Bleakrock Isle",
	[281] = 33335.2667775670, --"Bal Foyen",
--[[
	[282] = "ID_WITHOUT_INDEX",
	[283] = "Fungal Grotto I",
	[284] = "Bad Man's Hallows",
	[285] = "ID_WITHOUT_INDEX",
	[286] = "ID_WITHOUT_INDEX",
--]]
	[287] = 250035.5549957246, --"Inner Sea Armature",
--[[
	[288] = "Mephala's Nest",
	[289] = "Softloam Cavern",
	[290] = "Hightide Hollow",
	[291] = "Sheogorath's Tongue",
	[292] = "ID_WITHOUT_INDEX",
	[293] = "ID_WITHOUT_INDEX",
	[294] = "ID_WITHOUT_INDEX",
	[295] = "ID_WITHOUT_INDEX",
	[296] = "Emberflint Mine",
	[297] = "ID_WITHOUT_INDEX",
	[298] = "ID_WITHOUT_INDEX",
	[299] = "ID_WITHOUT_INDEX",
	[300] = "ID_WITHOUT_INDEX",
	[301] = "ID_WITHOUT_INDEX",
	[302] = "ID_WITHOUT_INDEX",
	[303] = "ID_WITHOUT_INDEX",
	[304] = "ID_WITHOUT_INDEX",
	[305] = "ID_WITHOUT_INDEX",
	[306] = "Forgotten Crypts",
	[307] = "ID_WITHOUT_INDEX",
	[308] = "Lost City of the Na-Totambu",
--]]
	[309] = 124962.0935124920, --"Ilessan Tower",
--[[
	[310] = "Silumm",
	[311] = "The Mines of Khuras",
	[312] = "Enduum",
	[313] = "Ebon Crypt",
	[314] = "Cryptwatch Fort",
	[315] = "Portdun Watch",
	[316] = "Koeglin Mine",
	[317] = "Pariah Catacombs",
	[318] = "Farangel's Delve",
	[319] = "Bearclaw Mine",
--]]
	[320] = DEFAULT_GLOBAL_TO_WORLD_FACTOR * 250 / 24.8, --"Norvulk Ruins",
--[[
	[321] = "Crestshade Mine",
	[322] = "Flyleaf Catacombs",
	[323] = "Tribulation Crypt",
--]]
	[324] = 250267.6292617903, --"Orc's Finger Ruins",
--[[
	[325] = "Erokii Ruins",
	[326] = "Hildune's Secret Refuge",
	[327] = "Santaki",
	[328] = "Divad's Chagrin Mine",
--]]
	[329] = 125019.6481462387, --"Aldunz",
--[[
	[330] = "Coldrock Diggings",
	[331] = "Sandblown Mine",
	[332] = "Yldzuun",
	[333] = "Torog's Spite",
	[334] = "Troll's Toothpick",
	[335] = "Viridian Watch",
--]]
	[336] = 83326.2558248055, --"Crypt of the Exiles",
--[[
	[337] = "Klathzgar",
	[338] = "Rubble Butte",
--]]
	[339] = DEFAULT_GLOBAL_TO_WORLD_FACTOR,
--[[
	-- This is probably 25k + measurement related rounding errors
	[339] = 25032.4157154530, --"Hall of the Dead",
	[340] = "ID_WITHOUT_INDEX",
--]]
	[341] = DEFAULT_GLOBAL_TO_WORLD_FACTOR * 950 / 76, --"The Lion's Den",
--[[
	[342] = "ID_WITHOUT_INDEX",
	[343] = "ID_WITHOUT_INDEX",
	[344] = "ID_WITHOUT_INDEX",
	[345] = "ID_WITHOUT_INDEX",
	[346] = "Skuldafn",
--]]
	[347] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Coldharbour",
--[[
	[348] = "ID_WITHOUT_INDEX",
	[349] = "ID_WITHOUT_INDEX",
	[350] = "ID_WITHOUT_INDEX",
	[351] = "ID_WITHOUT_INDEX",
	[352] = "ID_WITHOUT_INDEX",
	[353] = "Hall of Trials",
	[354] = "Cradlecrush Arena",
	[355] = "ID_WITHOUT_INDEX",
	[356] = "ID_WITHOUT_INDEX",
	[357] = "ID_WITHOUT_INDEX",
	[358] = "ID_WITHOUT_INDEX",
--]]
	[359] = 124997.2633719067, --"The Chill Hollow",
--[[
	[360] = "Icehammer's Vault",
	[361] = "Old Sord's Cave",
	[362] = "The Frigid Grotto",
	[363] = "Stormcrag Crypt",
	[364] = "The Bastard's Tomb",
	[365] = "Library of Dusk",
	[366] = "Lightless Oubliette",
	[367] = "Lightless Cell",
	[368] = "The Black Forge",
	[369] = "The Vile Laboratory",
	[370] = "Reaver Citadel Pyramid",
	[371] = "The Mooring",
	[372] = "Manor of Revelry",
	[373] = "ID_WITHOUT_INDEX",
	[374] = "The Endless Stair",
	[375] = "Chapel of Light",
	[376] = "Grunda's Gatehouse",
	[377] = "Dra'bul",
	[378] = "Shrine of Mauloch",
	[379] = "Silvenar's Audience Hall",
	[380] = "The Banished Cells I",
--]]
	[381] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Auridon",
	[382] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Reaper's March",
	[383] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, --"Grahtwood",
--[[
	[384] = "ID_WITHOUT_INDEX",
	[385] = "Ragnthar",
	[386] = "Fort Virak Ruin",
	[387] = "Tower of the Vale",
	[388] = "Phaer Catacombs",
	[389] = "Reliquary Ruins",
	[390] = "The Veiled Keep",
	[391] = "ID_WITHOUT_INDEX",
	[392] = "The Vault of Exile",
	[393] = "Saltspray Cave",
	[394] = "Ezduiin Undercroft",
	[395] = "The Refuge of Dread",
--]]
	-- These are porbably all 250k + measurement related rounding errors
	[396] = 249871.8073963740, --"Ondil",
	[397] = 251159.4346682482, --"Del's Claim",
	[398] = 250016.7414725263, --"Entila's Folly",
	[399] = 249995.1173075619, --"Wansalen",
	[400] = 249923.0106690745, --"Mehrunes' Spite",
	[401] = 250015.2168304231, -- "Bewan",
--[[
	[402] = "Shor's Stone Mine",
	[403] = "Northwind Mine",
	[404] = "Fallowstone Vault",
	[405] = "Lady Llarel's Shelter",
	[406] = "Lower Bthanual",
	[407] = "The Triple Circle Mine",
	[408] = "Taleon's Crag",
	[409] = "Knife Ear Grotto",
--]]
	-- inaccurate...
	[410] = 501493.9551762597, --"The Corpse Garden",
--[[
	[411] = "The Hunting Grounds",
	[412] = "Nimalten Barrow",
	[413] = "Avanchnzel",
	[414] = "Pinepeak Caverns",
	[415] = "Trolhetta Cave",
	[416] = "Inner Tanzelwil",
	[417] = "Aba-Loria",
	[418] = "The Vault of Haman Forgefire",
	[419] = "The Grotto of Depravity",
	[420] = "Cave of Trophies",
	[421] = "Mal Sorra's Tomb",
	[422] = "The Wailing Maw",
	[424] = "Camlorn Keep",
	[425] = "Daggerfall Castle",
	[426] = "Angof's Sanctum",
	[429] = "Glenumbra Moors Cave",
	[430] = "Aphren's Tomb",
	[431] = "Taarengrav Barrow",
	[433] = "Nairume's Prison",
	[434] = "The Orrery",
	[435] = "Cathedral of the Golden Path",
	[436] = "Reliquary Vault",
	[437] = "Laeloria Ruins",
	[438] = "Cave of Broken Sails",
	[439] = "Ossuary of Telacar",
	[440] = "The Aquifer",
	[442] = "Ne Salas",
	[444] = "Burroot Kwama Mine",
	[447] = "Mobar Mine",
	[449] = "Direfrost Keep",
	[451] = "Senalana",
	[452] = "Temple to the Divines",
	[453] = "Halls of Ichor",
	[454] = "Do'Krin Temple",
	[455] = "Rawl'kha Temple",
	[456] = "Five Finger Dance",
	[457] = "Moonmont Temple",
	[458] = "Fort Sphinxmoth",
	[459] = "Thizzrini Arena",
	[460] = "The Demi-Plane of Jode",
	[461] = "Den of Lorkhaj",
	[462] = "Thibaut's Cairn",
	[463] = "Kuna's Delve",
	[464] = "Fardir's Folly",
--]]
	[465] = 248979.8139007350, --"Claw's Strike",
--[[
	[466] = "Weeping Wind Cave",
	[467] = "Jode's Light",
	[468] = "Dead Man's Drop",
	[469] = "Tomb of Apostates",
	[470] = "Hoarvor Pit",
	[471] = "Shael Ruins",
	[472] = "Roots of Silvenar",
	[473] = "Black Vine Ruins",
	[474] = "ID_WITHOUT_INDEX",
	[475] = "The Scuttle Pit",
	[476] = "ID_WITHOUT_INDEX",
	[477] = "Vinedeath Cave",
--]]
	[478] = 250054.4759912894, --"Wormroot Depths",
--[[
	[479] = "ID_WITHOUT_INDEX",
	[480] = "Snapleg Cave",
	[481] = "Fort Greenwall",
	[482] = "Shroud Hearth Barrow",
	[483] = "ID_WITHOUT_INDEX",
	[484] = "Faldar's Tooth",
	[485] = "Broken Helm Hollow",
--]]
	-- This is probably 25k + measurement related rounding errors
	--[486] = 24998.8885180258, --"Toothmaul Gully",
	[486] = DEFAULT_GLOBAL_TO_WORLD_FACTOR,
	[487] = 250038.7907063850, --"The Vile Manse",
--[[
	[488] = "ID_WITHOUT_INDEX",
	[489] = "ID_WITHOUT_INDEX",
	[490] = "ID_WITHOUT_INDEX",
	[491] = "ID_WITHOUT_INDEX",
	[492] = "Tormented Spire Summit",
	[493] = "Breakneck Cave",
	[494] = "Capstone Cave",
	[495] = "Cracked Wood Cave",
	[496] = "Echo Cave",
	[497] = "Haynote Cave",
	[498] = "Kingscrest Cavern",
	[499] = "Lipsand Tarn",
	[500] = "Muck Valley Cavern",
	[501] = "Newt Cave",
	[502] = "Nisin Cave",
	[503] = "Pothole Caverns",
	[504] = "Quickwater Cave",
	[505] = "Red Ruby Cave",
	[506] = "Serpent Hollow Cave",
	[507] = "Bloodmayne Cave",
	[508] = "ID_WITHOUT_INDEX",
	[509] = "ID_WITHOUT_INDEX",
	[510] = "ID_WITHOUT_INDEX",
	[511] = "ID_WITHOUT_INDEX",
	[513] = "ID_WITHOUT_INDEX",
	[514] = "ID_WITHOUT_INDEX",
	[515] = "ID_WITHOUT_INDEX",
	[516] = "ID_WITHOUT_INDEX",
	[517] = "ID_WITHOUT_INDEX",
	[518] = "ID_WITHOUT_INDEX",
	[519] = "ID_WITHOUT_INDEX",
	[526] = "Greenhill Catacombs",
	[527] = "Sancre Tor",
	[529] = "Eyevea Mages Guild",
	[530] = "Haj Uxith Corridors",
	[531] = "Toadstool Hollow",
	[532] = "Vahtacen",
	[533] = "Underpall Cave",
--]]
	[534] = 65784.4651939763, --"Stros M'Kai",
	-- Probably both 62500 + measurement related rounding errors
	[535] = 62498.2472055182, --"Betnikh",
	[537] = 62501.1351836999, --"Khenarthi's Roost",
--[[
	[539] = "Carzog's Demise",
	[541] = "Glade of the Divines",
	[542] = "Buraniim",
	[543] = "Dourstone Vault",
	[544] = "Stonefang Cavern",
	[545] = "Alcaire Keep",
	[546] = "Wayrest Castle",
	[547] = "Shrouded Hollow",
	[548] = "Silatar",
	[549] = "The Middens",
	[551] = "Imperial Underground",
	[552] = "Shademist Enclave",
	[553] = "Ilmyris",
	[554] = "Serpent's Grotto",
	[555] = "Abecean Sea",
	[556] = "Nereid Temple Cave",
	[557] = "Village of the Lost",
	[558] = "Hectahame Grotto",
	[559] = "Valenheart",
	[560] = "Nimalten Barrow",
	[561] = "Isles of Torment",
	[562] = "Khaj Rawlith",
	[565] = "Ren-dro Caverns",
	[566] = "Heart of the Wyrd Tree",
	[567] = "The Hunting Grounds",
	[569] = "Ash'abah Pass",
	[570] = "Tu'whacca's Sanctum",
	[571] = "Suturah's Crypt",
	[572] = "Stirk",
	[573] = "The Worm's Retreat",
	[574] = "The Valley of Blades",
	[575] = "Carac Dena",
	[576] = "Gurzag's Mine",
	[577] = "The Underroot",
--]]
	[578] = 250232.1937321806, --"Naril Nagaia",
--[[
	[579] = "Harridan's Lair",
	[580] = "Barrow Trench",
	[581] = "Heart's Grief",
	[582] = "Temple of Auri-El",
	[584] = "Imperial City",
	[585] = "Nchu Duabthar Threshold",
	[586] = "The Wailing Prison",
	[587] = "Fevered Mews",
	[588] = "Doomcrag",
	[589] = "Northpoint",
	[590] = "Edrald Undercroft",
	[591] = "Lorkrata Ruins",
	[592] = "Shadowfate Cavern",
	[593] = "Bangkorai Garrison",
	[594] = "The Far Shores",
	[595] = "Abagarlas",
	[596] = "Blood Matron's Crypt",
	[598] = "The Colored Rooms",
--]]
	[599] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, -- "Elden Root",
	[600] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, -- "Mournhold",
	[601] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, -- "Wayrest",
--[[
	[628] = "Doomcrag",
	[632] = "Skyreach Hold",
	[635] = "Dragonstar Arena",
--]]
	[636] = 250090.7370556804, --"Hel Ra Citadel",
--[[
	[637] = "Quarantine Serk Catacombs",
--]]
	[638] = 249833.2794921021, --"Aetherian Archive",
	[639] = 124913.1589318025, --"Sanctum Ophidia",
--[[
	[640] = "Godrun's Dream",
	[641] = "Themond Mine",
	[642] = "The Earth Forge",
	[643] = "Imperial Sewers",
	[649] = "The Dragonfire Cathedral",
	[676] = "Shark's Teeth Grotto",
	[677] = "Maelstrom Arena",
	[678] = "Imperial City Prison",
	[681] = "City of Ash II",
--]]
	[684] = DEFAULT_GLOBAL_TO_WORLD_FACTOR, -- "Wrothgar",
--[[
	[688] = "White-Gold Tower",
	[689] = "Nikolvara's Kennel",
	[691] = "Thukhozod's Sanctum",
	[692] = "Watcher's Hold",
	[693] = "Coldperch Cavern",
	[694] = "Argent Mine",
	[695] = "Coldwind's Den",
	[697] = "Zthenganaz",
	[698] = "Morkul Descent",
	[699] = "Honor's Rest",
	[700] = "Exile's Barrow",
	[701] = "Graystone Quarry Depths",
	[702] = "Frostbreak Fortress",
	[703] = "Paragon's Remembrance",
	[704] = "Bonerock Cavern",
	[705] = "Rkindaleft",
	[706] = "Old Orsinium",
	[707] = "Ice-Heart's Lair",
	[708] = "Temple Library",
	[710] = "Fharun Prison",
	[711] = "Temple Rectory",
	[712] = "Chambers of Loyalty",
	[715] = "Sanctum of Prowess",
	[723] = "Heart's Grief",
	[724] = "Sorrow",
	[725] = "Maw of Lorkhaj",
	[745] = "Charred Ridge",
	[746] = "Vulkhel Guard Outlaws Refuge",
	[747] = "Elden Root Outlaws Refuge",
	[748] = "Marbruk Outlaws Refuge",
	[749] = "Velyn Harbor Outlaws Refuge",
	[750] = "Rawl'kha Outlaws Refuge",
	[751] = "Belkarth Outlaws Refuge",
	[752] = "Wayrest Outlaws Refuge",
	[753] = "Daggerfall Outlaws Refuge",
--]]
	-- This is probably 25k + measurement related rounding errors
	--[754] = 250312.2592828520, --"Evermore Outlaws Refuge",
--[[
	[755] = "Shornhelm Outlaws Refuge",
	[756] = "Sentinel Outlaws Refuge",
	[757] = "Davon's Watch Outlaws Refuge",
	[758] = "Windhelm Outlaws Refuge",
	[759] = "Stormhold Outlaws Refuge",
	[760] = "Mournhold Outlaws Refuge",
	[761] = "Riften Outlaws Refuge",
	[763] = "Secluded Sewers",
	[764] = "Underground Sepulcher",
	[765] = "Smuggler's Den",
	[766] = "Trader's Cove",
	[767] = "Deadhollow Halls",
	[769] = "Sewer Tenement",
	[770] = "The Hideaway",
	[771] = "Glittering Grotto",
	[773] = "Bandit 12",
	[774] = "Bandit 13",
	[775] = "Bandit 14",
	[776] = "Bandit 15",
	[777] = "Bandit 16",
	[778] = "Bandit 17",
	[779] = "Bandit 18",
	[780] = "Orsinium Outlaws Refuge",
	[781] = "Bandit 20",
	[782] = "Bandit 21",
	[783] = "Bandit 22",
	[784] = "Bandit 23",
	[785] = "Bandit 24",
	[786] = "Bandit 25",
	[787] = "Bandit 26",
	[788] = "Bandit 27",
	[789] = "Bandit 28",
	[790] = "Bandit 29",
	[791] = "Bandit 30",
	[792] = "Bandit 31",
	[793] = "Bandit 32",
	[794] = "Bandit 33",
	[795] = "Bandit 34",
	[796] = "Bandit 35",
	[797] = "Bandit 36",
	[798] = "Bandit 37",
	[799] = "Bandit 38",
	[800] = "Bandit 39",
	[801] = "Bandit 40",
	[802] = "Bandit 41",
	[803] = "Bandit 42",
	[804] = "Bandit 43",
	[805] = "Bandit 44",
	[806] = "Bandit 45",
	[807] = "Bandit 46",
	[808] = "Bandit 47",
	[809] = "The Wailing Prison",
	[810] = "Smuggler's Tunnel",
	[811] = "Ancient Carzog's Demise",
	[814] = "Temple of Ire",
	[815] = "Scarp Keep",
--]]
	[816] = DEFAULT_GLOBAL_TO_WORLD_FACTOR * 2500 / 2250, --"Hew's Bane",
--[[
	[817] = "Bahraha's Gloom",
	[818] = "Iron Wheel Headquarters",
	[819] = "Al-Danobia Tomb",
	[820] = "Hubalajad Palace",
	[821] = "Thieves Den",
	[823] = "The Gold Coast",
--]]
	[824] = 311621.8842788534, --"Hrota Cave",
--[[
	[825] = "Garlas Agea",
	[826] = "Dark Brotherhood Sanctuary",
	[827] = "Jarol Estate",
	[828] = "At-Himah Estate",
	[829] = "Knightsgrave",
	[831] = "Anvil Castle",
	[832] = "Castle Kvatch",
	[833] = "Enclave of the Hourglass",
	[834] = "Fulstrom Homestead",
	[836] = "Cathedral of Akatosh",
	[837] = "Anvil Outlaws Refuge",
	[841] = "Jerall Mountains Logging Track",
	[842] = "Blackwood Borderlands",
	[843] = "Ruins of Mazzatun",
	[844] = "Sulima Mansion",
	[845] = "Velmont Mansion",
	[848] = "Cradle of Shadows",
--]]
	[888] = 27173.9107899947, --"Craglorn",
--[[
	[889] = "Molavar",
	[890] = "Rkundzelft",
	[891] = "Serpent's Nest",
	[892] = "Ilthag's Undertower",
	[893] = "Ruins of Kardala",
--]]
	[894] = DEFAULT_GLOBAL_TO_WORLD_FACTOR * 350 / 75, --"Loth'Na Caverns",
--[[
	[895] = "Rkhardarhrk",
	[896] = "Haddock's Market",
	[897] = "Chiselshriek Mine",
	[898] = "Buried Sands",
	[899] = "Mtharnaz",
	[900] = "The Howling Sepulchers",
	[901] = "Balamath",
	[902] = "Fearfangs Cavern",
--]]
	[903] = DEFAULT_GLOBAL_TO_WORLD_FACTOR * 423 / 85, --"Exarch's Stronghold",
--[[
	[904] = "Zalgaz's Den",
	[905] = "Tombs of the Na-Totambu",
	[906] = "Hircine's Haunt",
	[907] = "Rahni'Za, School of Warriors",
	[908] = "Shada's Tear",
	[909] = "Seeker's Archive",
	[910] = "Elinhir Sewerworks",
	[911] = "Reinhold's Retreat",
	[913] = "The Mage's Staff",
	[914] = "Skyreach Catacombs",
	[915] = "Skyreach Temple",
	[916] = "Skyreach Pinnacle",
	[917] = "zTestBarbershop",
	[930] = "Darkshade Caverns II",
	[931] = "Elden Hollow II",
	[932] = "Crypt of Hearts II",
	[933] = "Wayrest Sewers II",
	[934] = "Fungal Grotto II",
	[935] = "The Banished Cells II",
	[936] = "Spindleclutch II",
--]]
}
