
local Settings, Textures, CallbackManager, Events
local Floating = {}
CraftingCompass:RegisterModule("floating", Floating)

function Floating:Initialize()
	Settings = CraftingCompass.settings
	Textures = CraftingCompass.textures
	CallbackManager = CraftingCompass.callbackManager
	Events = CraftingCompass.events
	
	local relatedSettings = {
		displayNodesInWorld = true,
		worldPinSize = true,
		worldPinPulse = true,
		worldPinTexture = true,
	}
	
	CallbackManager:RegisterCallback(Events.SETTING_CHANGED,
		function(event, setting, ...)
			if relatedSettings[setting] then
				self:RefreshLayout(setting)
			end
		end)
		
	self:RefreshLayout()
end

function Floating:RefreshLayout(triggeredBySetting)
	
	local texture = Settings.worldPinTexture
	if Settings.displayNodesInWorld then
		if triggeredBySetting == "worldPinTexture" then
			SetFloatingMarkerInfo(MAP_PIN_TYPE_HARVEST_NODE,
				Settings.worldPinSize,
				nil,
				nil,
				Settings.worldPinPulse)
		end
	else
		texture = nil
	end
	
	SetFloatingMarkerInfo(MAP_PIN_TYPE_HARVEST_NODE,
			Settings.worldPinSize,
			texture,
			texture,
			Settings.worldPinPulse)
end

