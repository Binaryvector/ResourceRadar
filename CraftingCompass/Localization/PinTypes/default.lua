
-- some strings are not translated in the custom localizations (some are WIP)
-- so always load the english defaults

local PinTypeLocalization = {}
CraftingCompass:RegisterModule("pinTypeLocalizationDefault", PinTypeLocalization)

local PinTypes = CraftingCompass.pinTypes

local interactableName2PinTypeId = {
	
	["Iron Ore"] = PinTypes.BLACKSMITH,
	["High Iron Ore"] = PinTypes.BLACKSMITH,
	["Orichalc Ore"] = PinTypes.BLACKSMITH,
	["Orichalcum Ore"] = PinTypes.BLACKSMITH,
	["Dwarven Ore"] = PinTypes.BLACKSMITH,
	["Ebony Ore"] = PinTypes.BLACKSMITH,
	["Calcinium Ore"] = PinTypes.BLACKSMITH,
	["Galatite Ore"] = PinTypes.BLACKSMITH,
	["Quicksilver Ore"] = PinTypes.BLACKSMITH,
	["Voidstone Ore"] = PinTypes.BLACKSMITH,
	["Rubedite Ore"] = PinTypes.BLACKSMITH,
	-- TODO jewelry nodes
	["Platinum Seam"] = PinTypes.BLACKSMITH,
	["Pewter Seam"] = PinTypes.BLACKSMITH,
	
	["Cotton"] = PinTypes.CLOTHING,
	["Ebonthread"] = PinTypes.CLOTHING,
	["Flax"] = PinTypes.CLOTHING,
	["Ironweed"] = PinTypes.CLOTHING,
	["Jute"] = PinTypes.CLOTHING,
	["Kreshweed"] = PinTypes.CLOTHING,
	["Silverweed"] = PinTypes.CLOTHING,
	["Spidersilk"] = PinTypes.CLOTHING,
	["Void Bloom"] = PinTypes.CLOTHING,
	["Silver Weed"] = PinTypes.CLOTHING,
	["Kresh Weed"] = PinTypes.CLOTHING,
	["Ancestor Silk"] = PinTypes.CLOTHING,
	
	["Runestone"] = PinTypes.ENCHANTING,
	
	["Blessed Thistle"] = PinTypes.FLOWER,
	["Entoloma"] = PinTypes.MUSHROOM,
	["Blue Entoloma"] = PinTypes.MUSHROOM,
	["Bugloss"] = PinTypes.FLOWER,
	["Columbine"] = PinTypes.FLOWER,
	["Corn Flower"] = PinTypes.FLOWER,
	["Dragonthorn"] = PinTypes.FLOWER,
	["Emetic Russula"] = PinTypes.MUSHROOM,
	["Imp Stool"] = PinTypes.MUSHROOM,
	["Lady's Smock"] = PinTypes.FLOWER,
	["Luminous Russula"] = PinTypes.MUSHROOM,
	["Mountain Flower"] = PinTypes.FLOWER,
	["Namira's Rot"] = PinTypes.MUSHROOM,
	["Nirnroot"] = PinTypes.WATERPLANT,
	["Stinkhorn"] = PinTypes.MUSHROOM,
	["Violet Coprinus"] = PinTypes.MUSHROOM,
	["Violet Copninus"] = PinTypes.MUSHROOM,
	["Water Hyacinth"] = PinTypes.WATERPLANT,
	["White Cap"] = PinTypes.MUSHROOM,
	["Wormwood"] = PinTypes.FLOWER,
	["Nightshade"] = PinTypes.FLOWER,
	
	["Ashtree"] = PinTypes.WOODWORKING,
	["Beech"] = PinTypes.WOODWORKING,
	["Birch"] = PinTypes.WOODWORKING,
	["Hickory"] = PinTypes.WOODWORKING,
	["Mahogany"] = PinTypes.WOODWORKING,
	["Maple"] = PinTypes.WOODWORKING,
	["Nightwood"] = PinTypes.WOODWORKING,
	["Oak"] = PinTypes.WOODWORKING,
	["Yew"] = PinTypes.WOODWORKING,
	["Ruby Ash Wood"] = PinTypes.WOODWORKING,

	["Pure Water"] = PinTypes.WATER,
	["Water Skin"] = PinTypes.WATER,
}

function PinTypeLocalization:Initialize()
	local PinTypes = CraftingCompass.pinTypes
	PinTypes.interactableName2PinTypeId = PinTypes.interactableName2PinTypeId or {}
	for name, pinTypeId in pairs(interactableName2PinTypeId) do
		PinTypes.interactableName2PinTypeId[zo_strlower(name)] = pinTypeId
	end
end
