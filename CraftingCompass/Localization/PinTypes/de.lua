
local PinTypeLocalization = {}
CraftingCompass:RegisterModule("pinTypeLocalization", PinTypeLocalization)

local PinTypes = CraftingCompass.pinTypes

local interactableName2PinTypeId = {
	
	["Eisenerz"] = PinTypes.BLACKSMITH,
	["Feineisenerz"] = PinTypes.BLACKSMITH,
	["Orichalc Ore"] = PinTypes.BLACKSMITH,
	["Oreichalkoserz"] = PinTypes.BLACKSMITH,
	["Dwemererz"] = PinTypes.BLACKSMITH,
	["Ebenerz"] = PinTypes.BLACKSMITH,
	["Kalciniumerz"] = PinTypes.BLACKSMITH,
	["Galatiterz"] = PinTypes.BLACKSMITH,
	["Quicksilver Ore"] = PinTypes.BLACKSMITH,
	["Leerensteinerz"] = PinTypes.BLACKSMITH,
	["Rubediterz"] = PinTypes.BLACKSMITH,
	
	["Baumwolle"] = PinTypes.CLOTHING,
	["Ebenseide"] = PinTypes.CLOTHING,
	["Flachs"] = PinTypes.CLOTHING,
	["Eisenkraut"] = PinTypes.CLOTHING,
	["Jute"] = PinTypes.CLOTHING,
	["Kreshweed"] = PinTypes.CLOTHING,
	["Silverweed"] = PinTypes.CLOTHING,
	["Spinnenseide"] = PinTypes.CLOTHING,
	["Leere Blüte"] = PinTypes.CLOTHING,
	["Silver Weed"] = PinTypes.CLOTHING,
	["Kresh Weed"] = PinTypes.CLOTHING,
	["Ahnenseide"] = PinTypes.CLOTHING,
	
	["Runenstein"] = PinTypes.ENCHANTING,
	
	["Benediktenkraut"] = PinTypes.FLOWER,
	["Glöckling"] = PinTypes.MUSHROOM,
	["Wolfsauge"] = PinTypes.FLOWER,
	["Akelei"] = PinTypes.FLOWER,
	["Kornblume"] = PinTypes.FLOWER,
	["Drachendorn"] = PinTypes.FLOWER,
	["Brechtäubling"] = PinTypes.MUSHROOM,
	["Koboldschemel"] = PinTypes.MUSHROOM,
	["Wiesenschaumkraut"] = PinTypes.FLOWER,
	["Leuchttäubling"] = PinTypes.MUSHROOM,
	["Bergblume"] = PinTypes.FLOWER,
	["Namiras Fäulnis"] = PinTypes.MUSHROOM,
	["Nirnwurz"] = PinTypes.WATERPLANT,
	["Stinkmorchel"] = PinTypes.MUSHROOM,
	["Violetter Tintling"] = PinTypes.MUSHROOM,
	["Wasserhyazinthe"] = PinTypes.WATERPLANT,
	["Weißkappe"] = PinTypes.MUSHROOM,
	["Wermut"] = PinTypes.FLOWER,
	["Nachtschatten"] = PinTypes.FLOWER,

	["Eschenholz"] = PinTypes.WOODWORKING,
	["Buche"] = PinTypes.WOODWORKING,
	["Buchenholz"] = PinTypes.WOODWORKING,
	["Birkenholz"] = PinTypes.WOODWORKING,
	["Hickoryholz"] = PinTypes.WOODWORKING,
	["Mahagoniholz"] = PinTypes.WOODWORKING,
	["Ahornholz"] = PinTypes.WOODWORKING,
	["Nachtholz"] = PinTypes.WOODWORKING,
	["Eiche"] = PinTypes.WOODWORKING,
	["Eichenholz"] = PinTypes.WOODWORKING,
	["Eibenholz"] = PinTypes.WOODWORKING,
	["Rubinesche"] = PinTypes.WOODWORKING,

	["Reines Wasser"] = PinTypes.WATER,
	["Wasserhaut"] = PinTypes.WATER,
}

function PinTypeLocalization:Initialize()
	local PinTypes = CraftingCompass.pinTypes
	PinTypes.interactableName2PinTypeId = PinTypes.interactableName2PinTypeId or {}
	for name, pinTypeId in pairs(interactableName2PinTypeId) do
		PinTypes.interactableName2PinTypeId[zo_strlower(name)] = pinTypeId
	end
end
