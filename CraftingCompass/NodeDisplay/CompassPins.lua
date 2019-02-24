
local CallbackManager, Events, Settings, Detection

local CompassPins = {}
CraftingCompass:RegisterModule("compassPins", CompassPins)

function CompassPins:Initialize()
	
	CallbackManager = CraftingCompass.callbackManager
	Events = CraftingCompass.events
	Settings = CraftingCompass.settings
	Detection = CraftingCompass.detection
	
	CallbackManager:RegisterCallback(Events.HARVEST_NODE_PINTYPE_UPDATED,
		function(event, control, pinTypeId)
			CompassPins:UpdateCompassPinForPinTypeId(control, pinTypeId)
		end)
		
	CallbackManager:RegisterCallback(Events.HARVEST_NODE_VISIBLE,
		function(event, control)
			CompassPins:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
		end)
		
	CallbackManager:RegisterCallback(Events.SETTING_CHANGED,
		function(event, setting, ...)
			CompassPins:OnSettingsChanged(setting, ...)
		end)
	-- TODO refactor
	ZO_CompassContainer:SetScaleCoefficients(MAP_PIN_TYPE_HARVEST_NODE, 0, 0, Settings.compassPinSize / 10)
	local minScale = 999
	if Settings.displayNodesOnCompass then minScale = 0 end
	ZO_CompassContainer:SetMinVisibleScale(MAP_PIN_TYPE_HARVEST_NODE, 0, 0, minScale)
	for id, control in pairs(Detection.compassPins) do
		self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
	end
end

function CompassPins:UpdateCompassPinForPinTypeId(control, pinTypeId)
	control:SetTexture(Settings.pinTextures[pinTypeId])
	control:SetColor(unpack(Settings.pinColors[pinTypeId]))
end

function CompassPins:OnSettingsChanged(setting, ...)
	if setting == "displayNodesOnCompass" then
		local display = ...
		if display then
			ZO_CompassContainer:SetMinVisibleScale(MAP_PIN_TYPE_HARVEST_NODE, 999)
		else
			ZO_CompassContainer:SetMinVisibleScale(MAP_PIN_TYPE_HARVEST_NODE, 0)
		end
	elseif setting == "pinColors" or setting == "pinTextures" then
		for id, control in pairs(Detection.compassPins) do
			self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
		end
	elseif setting == "compassPinSize" then
		local size = ...
		ZO_CompassContainer:SetScaleCoefficients(MAP_PIN_TYPE_HARVEST_NODE, 0, 0, size / 10)
	end
end
