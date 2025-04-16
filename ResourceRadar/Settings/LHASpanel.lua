
local Settings, Localization, Textures, PinTypes
local LAMpanel = {}
ResourceRadar:RegisterModule("LAMpanel", LAMpanel)

function LAMpanel:Initialize()
	Settings = ResourceRadar.settings
	Localization = ResourceRadar.localization
	Textures = ResourceRadar.textures
	PinTypes = LibNodeDetection.pinTypes
	
	local displayVersion = self:RetrieveDisplayVersion()
	
	local options = {
		allowDefaults = true,
		allowRefresh = true,
	}
	local settings = LibHarvensAddonSettings:AddAddon("ResourceRadar", options)
	
	local label = {
        type = LibHarvensAddonSettings.ST_LABEL,
        label = "ResourceRadar console version " .. ZO_HIGHLIGHT_TEXT:Colorize(displayVersion),
    }
    settings:AddSetting(label)
	
	local label = {
        type = LibHarvensAddonSettings.ST_LABEL,
        label = Localization.description,
    }
    settings:AddSetting(label)
	
	local section = {
        type = LibHarvensAddonSettings.ST_SECTION,
        label = Localization.map,
    }
    settings:AddSetting(section)
	
	local checkbox = {
        type = LibHarvensAddonSettings.ST_CHECKBOX, --setting type
        label = Localization.displayNodesOnMap,
        default = Settings.defaultSettings.displayNodesOnMap,
        setFunction = function(value) Settings.displayNodesOnMap = value end,
        getFunction = function() return Settings.displayNodesOnMap end,
    }
	settings:AddSetting(checkbox)
	
	local slider = {
        type = LibHarvensAddonSettings.ST_SLIDER,
        label = Localization.mapPinSize,
        setFunction = function(value) Settings.mapPinSize = value end,
        getFunction = function() return Settings.mapPinSize end,
        default = Settings.defaultSettings.mapPinSize,
        min = 8,
		max = 32,
        step = 1,
    }
	settings:AddSetting(slider)
	
	local section = {
        type = LibHarvensAddonSettings.ST_SECTION,
        label = Localization.compass,
    }
    settings:AddSetting(section)
	
	local checkbox = {
        type = LibHarvensAddonSettings.ST_CHECKBOX, --setting type
        label = Localization.displayNodesOnCompass,
        default = Settings.defaultSettings.displayNodesOnCompass,
        setFunction = function(value) Settings.displayNodesOnCompass = value end,
        getFunction = function() return Settings.displayNodesOnCompass end,
    }
	settings:AddSetting(checkbox)
	
	local slider = {
        type = LibHarvensAddonSettings.ST_SLIDER,
        label = Localization.compassPinSize,
        setFunction = function(value) Settings.compassPinSize = value end,
        getFunction = function() return Settings.compassPinSize end,
        default = Settings.defaultSettings.compassPinSize,
        min = 8,
		max = 32,
        step = 1,
    }
	settings:AddSetting(slider)
	
	local section = {
        type = LibHarvensAddonSettings.ST_SECTION,
        label = Localization.worldPins,
    }
    settings:AddSetting(section)
	
	local label = {
        type = LibHarvensAddonSettings.ST_LABEL,
        label = Localization.worldPinsDescription,
    }
    settings:AddSetting(label)
	
	local checkbox = {
        type = LibHarvensAddonSettings.ST_CHECKBOX, --setting type
        label = Localization.displayNodesInWorld,
        default = Settings.defaultSettings.displayNodesInWorld,
        setFunction = function(value) Settings.displayNodesInWorld = value; ReloadUI("ingame") end,
        getFunction = function() return Settings.displayNodesInWorld end,
    }
	settings:AddSetting(checkbox)
	
	local slider = {
        type = LibHarvensAddonSettings.ST_SLIDER,
        label = Localization.worldPinSize,
        setFunction = function(value) Settings.worldPinSize = value end,
        getFunction = function() return Settings.worldPinSize end,
        default = Settings.defaultSettings.worldPinSize,
        min = 8,
		max = 32,
        step = 1,
    }
	settings:AddSetting(slider)
	
	local checkbox = {
        type = LibHarvensAddonSettings.ST_CHECKBOX, --setting type
        label = Localization.worldPinPulse,
        default = Settings.defaultSettings.worldPinPulse,
        setFunction = function(value) Settings.worldPinPulse = value end,
        getFunction = function() return Settings.worldPinPulse end,
    }
	settings:AddSetting(checkbox)
	
	local icon = {
		type = "iconpicker",
		name = Localization.worldPinTexture,
		getFunction = function() return Settings.worldPinTexture end,
		setFunction = function(newTexture) Settings.worldPinTexture = texture; ReloadUI("ingame") end,
		choices = Textures.worldPinTextures,
		default = Settings.defaultSettings.worldPinTexture,
	}
	settings:AddSetting(icon)
	
	local section = {
        type = LibHarvensAddonSettings.ST_SECTION,
        label = Localization.pinTypeOptions,
    }
    settings:AddSetting(section)
	
	for _, pinTypeId in ipairs( PinTypes.ALL_PINTYPES ) do
		local section = {
			type = LibHarvensAddonSettings.ST_SECTION,
			label = Localization["pinType" .. pinTypeId],
		}
		settings:AddSetting(section)
		
		settings:AddSetting(self:CreateColorPicker(pinTypeId))
		settings:AddSetting(self:CreateIconPicker(pinTypeId))
		if pinTypeId ~= PinTypes.UNKNOWN then
			settings:AddSetting(self:CreateRemoveCheckbox(pinTypeId))
		end
	end
	
end

function LAMpanel:CreateRemoveCheckbox(pinTypeId)
	local checkbox = {
        type = LibHarvensAddonSettings.ST_CHECKBOX, --setting type
        label = Localization.removeOnDetection,
        default = Settings.defaultSettings.removeOnDetection[pinTypeId],
        setFunction = function(shouldRemove)
			Settings.removeOnDetection[pinTypeId] = shouldRemove
		end,
        getFunction = function() return Settings.removeOnDetection[pinTypeId] end,
    }
	return checkbox
end

function LAMpanel:CreateIconPicker(pinTypeId)
	local icon = {
		type = "iconpicker",
		name = Localization.pinTexture,
		getFunction = function()
			return Settings.pinTextures[pinTypeId]
		end,
		setFunction = function(texture)
			Settings.pinTextures[pinTypeId] = texture
		end,
		choices = Textures.pinTypeTextures[pinTypeId],
		default = Settings.defaultSettings.pinTextures[pinTypeId],
	}
	return icon
end

function LAMpanel:CreateColorPicker(pinTypeId)
	local colorPicker = {
        type = LibHarvensAddonSettings.ST_COLOR,
        label = Localization.pinColor,
        setFunction = function(r, g, b)
			Settings.pinColors[pinTypeId] = {r, g, b, 1}
		end,
        getFunction = function()
			return unpack(Settings.pinColors[pinTypeId])
		end,
        default = Settings.defaultSettings.pinColors[pinTypeId],
    }
	return colorPicker
end

function LAMpanel:RetrieveDisplayVersion()
	local displayVersion = "1.0.0"
	local AddOnManager = GetAddOnManager()
	if AddOnManager.GetAddOnVersion then -- api version 25 doesn't have that method
		for addonIndex = 1, AddOnManager:GetNumAddOns() do
			local name = AddOnManager:GetAddOnInfo(addonIndex)
			if name == "ResourceRadar" then
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
