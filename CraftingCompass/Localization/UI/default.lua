
local Localization = {
	description = "The CraftingCompass Add-On displays nearby harvest nodes on the map, compass and highlights them in the 3D world.",
	
	compass = "Compass pins",
	map = "Map pins",
	displayNodesOnMap = "Display nodes on the map",
	displayNodesOnCompass = "Display nodes on the compass",
	displayNodesInWorld = "Display floating markers in the 3D world",
	compassPinSize = "Size of the compass pins",
	mapPinSize = "Size of the map pins",
	pinTexture = "Compass/map pin icon",
	pinColor = "Compass/map pin color",
	pinTypeOptions = "Resource types",
	removeOnDetection = "Remove compass/map pin, when detected",
	removeOnDetectionTooltip = "The compass/map pin will be removed, when it is detected to be of this resource type.",
	
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
