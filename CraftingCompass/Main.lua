
CraftingCompass = {}

local Main = CraftingCompass

Main.modules = {}

function Main:RegisterModule(identifier, module)
	self[identifier] = module
	table.insert(self.modules, module)
end

function Main:InitializeModules()
	for _, module in pairs(self.modules) do
		if type(module.Initialize) == "function" then
			module:Initialize()
		end
	end
end

function Main:IsFolderStructureCorrect()

	local success, error_msg = pcall(function() error("") end)
	local structure = string.match(error_msg, "user:/AddOns/(.-)Main.lua:")
	
	if structure ~= "CraftingCompass/" then
	
		local error_msg = [[The CraftingCompass AddOn was installed incorrectly.
The AddOn should be installed as:
'AddOns/CraftingCompass/'
instead of
'AddOns/]] .. structure .."'"
		
		ZO_ERROR_FRAME:OnUIError(error_msg)
		EVENT_MANAGER:RegisterForEvent("CraftingCompass-Error", EVENT_PLAYER_ACTIVATED,
			function()
				d(error_msg)
				EVENT_MANAGER:UnregisterForEvent("CraftingCompass-Error", EVENT_PLAYER_ACTIVATED)
			end)
		
		return false
	end
	return true
end

local function OnAddOnLoaded(eventCode, addOnName)
	if addOnName ~= "CraftingCompass" then
		return
	end
	
	if not Main:IsFolderStructureCorrect() then
		return
	end
	
	Main:InitializeModules()
	
end

EVENT_MANAGER:RegisterForEvent("CraftingCompass", EVENT_ADD_ON_LOADED, OnAddOnLoaded)
