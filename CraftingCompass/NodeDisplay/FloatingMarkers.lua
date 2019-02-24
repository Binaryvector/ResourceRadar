
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
			self:RefreshLayout()
		end)
end

function Floating:RefreshLayout()

	local texture = Settings.worldPinTexture
	if not Settings.displayNodesInWorld then
		texture = Textures.emptyTexture
	end
	
	SetFloatingMarkerInfo(MAP_PIN_TYPE_HARVEST_NODE,
			Settings.worldPinSize,
			texture,
			texture,
			Settings.worldPinPulse)
end

