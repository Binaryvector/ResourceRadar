
local CallbackManager, Events, Detection, Settings, Textures, PinTypes

local CompassPins = {}
ResourceRadar:RegisterModule("compassPins", CompassPins)

function CompassPins:Initialize()
	
	CallbackManager = LibNodeDetection.callbackManager
	Events = LibNodeDetection.events
	PinTypes = LibNodeDetection.pinTypes
	Detection = LibNodeDetection.detection
	
	Settings = ResourceRadar.settings
	Textures = ResourceRadar.textures
	
	
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
	EVENT_MANAGER:RegisterForEvent("ResourceRadar-Init", EVENT_PLAYER_DEACTIVATED, function()
		self.newlyAddedControlQueue = {}
	end)
	
	-- this handler will be executed for the queued controls
	self.ProcessNewlyAddedControlQueue = function()
		for control in pairs(self.newlyAddedControlQueue) do
			self.newlyAddedControlQueue[control] = nil
			self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
		end
		EVENT_MANAGER:UnregisterForUpdate("ResourceRadar-PinInit", self.ProcessNewlyAddedControlQueue)
	end
	
	-- this needs to be delayed
	-- otherwise the color/texture is not set for pins that
	-- are created during loading screens
	EVENT_MANAGER:RegisterForEvent("ResourceRadar-Init", EVENT_PLAYER_ACTIVATED,
		function()
			for id, control in pairs(Detection.compassPins) do
				self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
			end
		end)
	
	-- initialize settings
	self:SetPinSize(Settings.compassPinSize)
	
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
	EVENT_MANAGER:UnregisterForUpdate("ResourceRadar-PinInit", self.ProcessNewlyAddedControlQueue)
	EVENT_MANAGER:RegisterForUpdate("ResourceRadar-PinInit", 100, self.ProcessNewlyAddedControlQueue)
end

function CompassPins:RemoveControlFromQueue(control)
	self.newlyAddedControlQueue[control] = nil
end

function CompassPins:UpdateCompassPinForPinTypeId(control, pinTypeId)
	if Settings.removeOnDetection[pinTypeId] or not Settings.displayNodesOnCompass then
		control:SetTexture(Textures.emptyTexture)
	else
		control:SetTexture(Settings.pinTextures[pinTypeId])
	end
	control:SetColor(unpack(Settings.pinColors[pinTypeId]))
	local size = Settings.compassPinSize
	control:SetDimensions(size, size)
end


function CompassPins:SetPinSize(size)
	for id, control in pairs(Detection.compassPins) do
		control:SetDimensions(size, size)
	end
end

local isCompassSetting = {
	displayNodesOnCompass = true,
	pinColors = true,
	pinTextures = true,
	removeOnDetection = true,
	compassPinSize = true,
}
function CompassPins:OnSettingsChanged(setting, ...)
	if isCompassSetting[setting] then
		for id, control in pairs(Detection.compassPins) do
			self:UpdateCompassPinForPinTypeId(control, control.pinTypeId)
		end
	end
end
