
local Textures = {}
CraftingCompass:RegisterModule("textures", Textures)

function Textures:Initialize()
	
	self.emptyTexture = "CraftingCompass/Textures/emptyTexture.dds"
	
	self.worldPinTextures = {
		"CraftingCompass/Textures/PinTypes/mining.dds",
		"CraftingCompass/Textures/PinTypes/circle.dds",
		"CraftingCompass/Textures/PinTypes/diamond.dds",
	}
	
	local PinTypes = CraftingCompass.pinTypes
	self.pinTypeTextures = {
		[PinTypes.BLACKSMITH] = {
			"CraftingCompass/Textures/PinTypes/mining.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.CLOTHING] = {
			"CraftingCompass/Textures/PinTypes/clothing.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.ENCHANTING] = {
			"CraftingCompass/Textures/PinTypes/enchanting.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.MUSHROOM] = {
			"CraftingCompass/Textures/PinTypes/mushroom.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.FLOWER] = {
			"CraftingCompass/Textures/PinTypes/flower.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.WATERPLANT]  = {
			"CraftingCompass/Textures/PinTypes/waterplant.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.WOODWORKING] = {
			"CraftingCompass/Textures/PinTypes/wood.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.WATER] = {
			"CraftingCompass/Textures/PinTypes/solvent.dds",
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
		},
		[PinTypes.UNKNOWN] = {
			"CraftingCompass/Textures/PinTypes/circle.dds",
			"CraftingCompass/Textures/PinTypes/diamond.dds",
			"CraftingCompass/Textures/PinTypes/mining.dds",
		},
	}
	
end
