
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
		
	CallbackManager:RegisterCallback(Events.SETTING_CHANGED,
		function(event, setting, ...)
			CompassPins:OnSettingsChanged(setting, ...)
		end)
		
	-- we can not immediately set the color/texture of newly added controls
	-- so we add a small delay by adding the controls to this queue
	self.newlyAddedControlQueue = {}
	
	CallbackManager:RegisterCallback(Events.HARVEST_NODE_VISIBLE,
		function(event, control)
			self:AddControlToQueue(control)
		end)
		
	CallbackManager:RegisterCallback(Events.HARVEST_NODE_VISIBLE,
		function(event, control)
			self:RemoveControlFromQueue(control)
		end)
	-- we need to clear the queue, when entering a loading screen
	-- because otherwise we do not get notified by the control's removal
	EVENT_MANAGER:RegisterForEvent("CraftingCompass-Init", EVENT_PLAYER_DEACTIVATED, function()
		self.newlyAddedControlQueue = {}
	end)
	
	-- this handler will be executed for the queued controls
	self.ProcessNewlyAddedControlQueue = function()
		for control in pairs(self.newlyAddedControlQueue) do
			self.newlyAddedControls[control] = nil
			self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
		end
		EVENT_MANAGER:UnregisterForUpdate("CraftingCompass-PinInit", self.ProcessNewlyAddedControlQueue)
	end
	
	-- this needs to be delayed
	-- otherwise the color/texture is not set for pins that
	-- are created during loading screens
	EVENT_MANAGER:RegisterForEvent("CraftingCompass-Init", EVENT_PLAYER_ACTIVATED,
		function()
			for id, control in pairs(Detection.compassPins) do
				self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
			end
		end)
	
	-- initialize settings
	self:SetPinSize(Settings.compassPinSize)
	self:SetPinsVisible(Settings.displayNodesOnCompass)
	
end

function CompassPins:AddControlToQueue(control)
	self.newlyAddedControlQueue[control] = true
	EVENT_MANAGER:UnregisterForUpdate("CraftingCompass-PinInit", self.ProcessNewlyAddedControlQueue)
	EVENT_MANAGER:RegisterForUpdate("CraftingCompass-PinInit", 100, self.ProcessNewlyAddedControlQueue)
end

function CompassPins:RemoveControlToQueue(control)
	self.newlyAddedControlQueue[control] = nil
end

function CompassPins:UpdateCompassPinForPinTypeId(control, pinTypeId)
	control:SetTexture(Settings.pinTextures[pinTypeId])
	control:SetColor(unpack(Settings.pinColors[pinTypeId]))
end

function CompassPins:SetPinsVisible(visible)
	if visible then
		ZO_CompassContainer:SetMinVisibleScale(MAP_PIN_TYPE_HARVEST_NODE, 0)
	else
		ZO_CompassContainer:SetMinVisibleScale(MAP_PIN_TYPE_HARVEST_NODE, 999)
	end
end

function CompassPins:SetPinSize(size)
	ZO_CompassContainer:SetScaleCoefficients(MAP_PIN_TYPE_HARVEST_NODE, 0, 0, size / 10)
end

function CompassPins:OnSettingsChanged(setting, ...)
	if setting == "displayNodesOnCompass" then
		self:SetPinsVisible(...)
	elseif setting == "pinColors" or setting == "pinTextures" then
		for id, control in pairs(Detection.compassPins) do
			self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
		end
	elseif setting == "compassPinSize" then
		self:SetPinSize(...)
	end
end
