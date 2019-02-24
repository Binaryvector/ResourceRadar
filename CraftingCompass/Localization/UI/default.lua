
local Localization = {
	description = "The CraftingCompass Add-On displays nearby harvest nodes on the compass and highlights them in the 3D world.",
	
	compass = "Compass",
	displayNodesOnCompass = "Display nodes on the compass",
	displayNodesInWorld = "Display floating markers in the 3D world",
	compassPinSize = "Size of the compass pins",
	pinTexture = "Compass pin icon",
	pinColor = "Compass pin color",
	pinTypeOptions = "Resource types",
	removeOnDetection = "Remove compass pin when detected",
	removeOnDetectionTooltip = "The compass pin will be removed, when it is detected to be of this resource type.",
	
	worldPins = "Floating Markers",
	worldPinsDescription = "The settings you choose here will affect all floating markers. The style (color/icon) can not be set for each resource type individually.",
	worldPinSize = "Size of the floating markers",
	worldPinPulse = "Pulse animation for floating markers",
	worldPinTexture = "Floating marker icon",
	
	
	pinType1 = "Smithing and Jewelry",
	pinType2 = "Clothing",
	pinType3 = "Woodworking",
	pinType4 = "Runestones",
	pinType5 = "Mushrooms",
	pinType6 = "Herbs/Flowers",
	pinType7 = "Water herbs",
	pinType8 = "Solvents",
	pinType100 = "Unknown",
}

-- if a string is not available, then use the english default
local metaTable = {
	__index = function(tbl, key)
		key = tostring(key)
		--d("error: could not find localized string for '" .. key .. '"')
		return key
	end
}
setmetatable(Localization, metaTable)

CraftingCompass:RegisterModule("localizationDefault", Localization)
CraftingCompass:RegisterModule("localization", Localization)
