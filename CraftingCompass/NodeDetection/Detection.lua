
local CallbackManager = CraftingCompass.callbackManager
local Events = CraftingCompass.events
local Settings = CraftingCompass.settings
local PinTypes = CraftingCompass.pinTypes

local Detection = {}
CraftingCompass:RegisterModule("detection", Detection)

Detection.compassPins = {}
Detection.unknownCompassPins = {}
function Detection:Initialize()
	
	self.container = ZO_CompassContainer
	
	EVENT_MANAGER:RegisterForUpdate("CraftingCompass-TypeDetection", 100, function() self:OnUpdatePinTypeHandler() end)
	EVENT_MANAGER:RegisterForEvent("CraftingCompass-CompassPins", EVENT_PLAYER_DEACTIVATED, function()
		-- Clear references when the compass deactivates,
		-- because ESO will remove the compass pins from the compass
		-- without triggering a callback.
		self.compassPins = {}
		self.unknownCompassPins = {}
	end )

end

function CraftingCompassPinAdded(compassPin)
	compassPin.pinTypeId = PinTypes.UNKNOWN
	compassPin.id = #Detection.compassPins + 1
	Detection.compassPins[compassPin.id] = compassPin
	Detection.unknownCompassPins[compassPin.id] = compassPin
	CallbackManager:FireCallbacks(Events.HARVEST_NODE_VISIBLE, compassPin)
end

function CraftingCompassPinRemoved(compassPin)
	Detection.compassPins[compassPin.id] = nil
	Detection.unknownCompassPins[compassPin.id] = nil
	CallbackManager:FireCallbacks(Events.HARVEST_NODE_HIDDEN, compassPin)
end

function Detection:OnUpdatePinTypeHandler()
	
	local container = self.container
	
	for i = 1, container:GetNumCenterOveredPins() do
		if container:GetCenterOveredPinType(i) == MAP_PIN_TYPE_HARVEST_NODE then
			local interactableName = container:GetCenterOveredPinDescription(i)
			local pinTypeId = PinTypes:GetPinTypeIdFromInteractableName(interactableName)
			if pinTypeId then
				local _, level = container:GetCenterOveredPinLayerAndLevel(i)
				local matchingControl = nil
				for _, control in pairs(self.unknownCompassPins) do
					if control:GetDrawLevel() == level then
						local relativeX = 2 * (control:GetCenter() - container:GetLeft()) / container:GetWidth() - 1.0
						if relativeX < 0.14 then
							-- if there is more than one matching control, then we can not
							-- know which of the two is the correct one
							if matchingControl then
								matchingControl = nil
								break
							end
							matchingControl = control
						end
					end
				end
				
				if matchingControl and matchingControl.pinTypeId ~= pinTypeId then
					matchingControl.pinTypeId = pinTypeId
					self.unknownCompassPins[matchingControl.id] = nil
					CallbackManager:FireCallbacks(Events.HARVEST_NODE_PINTYPE_UPDATED, matchingControl, pinTypeId)
				end
			end
		end
	end
	--[[
	for level, control in pairs(Detection.controls) do
	--	d(1.0 - control:GetDrawLevel() / 0xFFFFFFFF)
	--	d((1-control:GetAlpha()) / 20.0)
		control:SetDrawLayer(1)
	end]]
end
