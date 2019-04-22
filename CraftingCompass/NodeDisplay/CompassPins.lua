
local CallbackManager, Events, Detection, Settings, Textures, PinTypes

local CompassPins = {}
CraftingCompass:RegisterModule("compassPins", CompassPins)

function CompassPins:Initialize()
	
	CallbackManager = LibNodeDetection.callbackManager
	Events = LibNodeDetection.events
	PinTypes = LibNodeDetection.pinTypes
	Detection = LibNodeDetection.detection
	
	Settings = CraftingCompass.settings
	Textures = CraftingCompass.textures
	
	
	CallbackManager:RegisterCallback(Events.HARVEST_NODE_PINTYPE_UPDATED,
		function(event, control, pinTypeId)
			CompassPins:UpdateCompassPinForPinTypeId(control, pinTypeId)
		end)
		
	Settings:RegisterCallback(function(setting, ...)
		CompassPins:OnSettingsChanged(setting, ...)
	end)
		
	-- we can not immediately set the color/texture of newly added controls
	-- so we add a small delay by adding the controls to this queue
	self.newlyAddedControlQueue = {}
	
	CallbackManager:RegisterCallback(Events.HARVEST_NODE_VISIBLE,
		function(event, control)
			self:AddControlToQueue(control)
		end)
		
	CallbackManager:RegisterCallback(Events.HARVEST_NODE_HIDDEN,
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
			self.newlyAddedControlQueue[control] = nil
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
	
	-- we want to suppress blocked pinTypes
	-- i.e. no center over text should be displayed for blocked pins
	local origFunc = ZO_CompassContainer.IsCenterOveredPinSuppressed
	function ZO_CompassContainer:IsCenterOveredPinSuppressed(id, ...)
		if self:GetCenterOveredPinType(id) ~= MAP_PIN_TYPE_HARVEST_NODE then
			return origFunc(self, id, ...)
		end
		local interactableName = self:GetCenterOveredPinDescription(id)
		local pinTypeId = PinTypes:GetPinTypeIdFromInteractableName(interactableName)
		if pinTypeId then return Settings.removeOnDetection[pinTypeId] end
		return false
	end
end

function CompassPins:AddControlToQueue(control)
	self.newlyAddedControlQueue[control] = true
	EVENT_MANAGER:UnregisterForUpdate("CraftingCompass-PinInit", self.ProcessNewlyAddedControlQueue)
	EVENT_MANAGER:RegisterForUpdate("CraftingCompass-PinInit", 100, self.ProcessNewlyAddedControlQueue)
end

function CompassPins:RemoveControlFromQueue(control)
	self.newlyAddedControlQueue[control] = nil
end

function CompassPins:UpdateCompassPinForPinTypeId(control, pinTypeId)
	if Settings.removeOnDetection[pinTypeId] then
		control:SetTexture(Textures.emptyTexture)
	else
		control:SetTexture(Settings.pinTextures[pinTypeId])
	end
	control:SetColor(unpack(Settings.pinColors[pinTypeId]))
	local size = Settings.compassPinSize
	control:SetDimensions(size, size)
end

function CompassPins:SetPinsVisible(visible)
	if visible then
	--	ZO_CompassContainer:SetMinVisibleScale(MAP_PIN_TYPE_HARVEST_NODE, 0)
	else
	--	ZO_CompassContainer:SetMinVisibleScale(MAP_PIN_TYPE_HARVEST_NODE, 999)
	end
end

function CompassPins:SetPinSize(size)
	for id, control in pairs(Detection.compassPins) do
		control:SetDimensions(size, size)
	end
	--ZO_CompassContainer:SetScaleCoefficients(MAP_PIN_TYPE_HARVEST_NODE, 0, 0, size / 10)
end

function CompassPins:OnSettingsChanged(setting, ...)
	if setting == "displayNodesOnCompass" then
		self:SetPinsVisible(...)
	elseif setting == "pinColors" or setting == "pinTextures" or setting == "removeOnDetection" or setting == "compassPinSize" then
		for id, control in pairs(Detection.compassPins) do
			self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
		end
	end
end
