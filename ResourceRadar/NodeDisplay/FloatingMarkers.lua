
local Settings, Textures
local Floating = {}
ResourceRadar:RegisterModule("floating", Floating)

function Floating:Initialize()
	Settings = ResourceRadar.settings
	Textures = ResourceRadar.textures
	
	local relatedSettings = {
		displayNodesInWorld = true,
		worldPinSize = true,
		worldPinPulse = true,
		worldPinTexture = true,
	}
	
	Settings:RegisterCallback(function(setting, ...)
		if relatedSettings[setting] then
			self:RefreshLayout(setting)
		end
	end)
	
	-- if we set a texture first, then the game crashes
	EVENT_MANAGER:RegisterForEvent("ResourceRadar-FloatingMarker", EVENT_PLAYER_ACTIVATED, function()
		local texture = nil
		SetFloatingMarkerInfo(MAP_PIN_TYPE_HARVEST_NODE,
				Settings.worldPinSize,
				texture,
				texture,
				Settings.worldPinPulse)
		self:RefreshLayout()
	end)
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

