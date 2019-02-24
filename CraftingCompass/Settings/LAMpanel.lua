
local LAM = LibStub("LibAddonMenu-2.0")

local Settings, Localization, Textures, PinTypes
local LAMpanel = {}
CraftingCompass:RegisterModule("LAMpanel", LAMpanel)

function LAMpanel:Initialize()
	Settings = CraftingCompass.settings
	Localization = CraftingCompass.localization
	Textures = CraftingCompass.textures
	PinTypes = CraftingCompass.pinTypes
	
	local displayVersion = self:RetrieveDisplayVersion()
	-- first LAM stuff, at the end of this function we will also create
	-- a custom checkbox in the map's filter menu for the heat map
	local panelData = {
		type = "panel",
		name = "CraftingCompass",
		displayName = ZO_HIGHLIGHT_TEXT:Colorize("CraftingCompass"),
		author = "Shinni",
		version = displayVersion,
		registerForRefresh = true,
		registerForDefaults = true,
		--website = "http://www.esoui.com/downloads/infoXYZ", todo replace XYZ with esoui id
	}

	local optionsTable = setmetatable({}, { __index = table })
	
	optionsTable:insert({
		type = "description",
		title = nil,
		text = Localization.description,
		width = "full",
	})
	
	optionsTable:insert({
		type = "header",
		name = "",
	})
	
	optionsTable:insert({
		type = "checkbox",
		name = Localization.displayNodesOnCompass,
		getFunc = function() return Settings.displayNodesOnCompass end,
		setFunc = function(value) Settings.displayNodesOnCompass = value end,
		default = Settings.defaultSettings.displayNodesOnCompass,
	})
	
	optionsTable:insert({
		type = "slider",
		name = Localization.compassPinSize,
		min = 16,
		max = 40,
		getFunc = function() return Settings.compassPinSize end,
		setFunc = function(value) Settings.compassPinSize = value end,
		default = Settings.defaultSettings.compassPinSize,
	})
	
	optionsTable:insert({
		type = "checkbox",
		name = Localization.displayNodesInWorld,
		getFunc = function() return Settings.displayNodesInWorld end,
		setFunc = function(value) Settings.displayNodesInWorld = value end,
		default = Settings.defaultSettings.displayNodesInWorld,
	})
	
	optionsTable:insert({
		type = "slider",
		name = Localization.worldPinSize,
		min = 16,
		max = 256,
		getFunc = function() return Settings.worldPinSize end,
		setFunc = function(value) Settings.worldPinSize = value end,
		default = Settings.defaultSettings.worldPinSize,
	})
	
	optionsTable:insert({
		type = "checkbox",
		name = Localization.worldPinPulse,
		getFunc = function() return Settings.worldPinPulse end,
		setFunc = function(value) Settings.worldPinPulse = value end,
		default = Settings.defaultSettings.worldPinPulse,
	})
	
	local submenuTable = setmetatable({}, { __index = table })
	optionsTable:insert({
		type = "submenu",
		name = Localization.pinTypeOptions,
		controls = submenuTable,
	})
	
	for _, pinTypeId in ipairs( PinTypes.ALL_PINTYPES ) do
		submenuTable:insert({
			type = "header",
			name = Localization["pinType" .. pinTypeId]
		})
		submenuTable:insert(self:CreateColorPicker(pinTypeId))
		submenuTable:insert(self:CreateIconPicker(pinTypeId))
	end
	
	LAMpanel.optionsPanel = LAM:RegisterAddonPanel("CraftingCompassControl", panelData)
	LAM:RegisterOptionControls("CraftingCompassControl", optionsTable)

end


function LAMpanel:CreateIconPicker(pinTypeId)
	local filter = {
		type = "iconpicker",
		name = Localization.pinTexture,
		getFunc = function()
			return Settings.pinTextures[pinTypeId]
		end,
		setFunc = function(texture)
			Settings.pinTextures[pinTypeId] = texture
		end,
		choices = Textures.pinTypeTextures[pinTypeId],
		default = Settings.defaultSettings.pinTextures[pinTypeId],
		width = "half",
	}
	return filter
end

function LAMpanel:CreateColorPicker(pinTypeId)
	local colorPicker = {
		type = "colorpicker",
		name = Localization.pinColor,
		getFunc = function()
			return unpack(Settings.pinColors[pinTypeId])
		end,
		setFunc = function(r, g, b)
			Settings.pinColors[pinTypeId] = {r, g, b, 1}
		end,
		default = Settings.defaultSettings.pinColors[pinTypeId],
		width = "half",
	}
	return colorPicker
end

function LAMpanel:RetrieveDisplayVersion()
	local displayVersion = "1.0.0"
	local AddOnManager = GetAddOnManager()
	if AddOnManager.GetAddOnVersion then -- api version 25 doesn't have that method
		for addonIndex = 1, AddOnManager:GetNumAddOns() do
			local name = AddOnManager:GetAddOnInfo(addonIndex)
			if name == "HarvestMap" then
				local versionInt = AddOnManager:GetAddOnVersion(addonIndex)
				local rev = versionInt % 100
				local version = zo_floor(versionInt / 100) % 100
				local major = zo_floor(versionInt / 10000) % 100
				displayVersion = string.format("%d.%d.%d", major, version, rev)
			end
		end
	end
	return displayVersion
end
