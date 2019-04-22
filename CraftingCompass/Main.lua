
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

local function OnAddOnLoaded(eventCode, addOnName)
	if addOnName ~= "CraftingCompass" then
		return
	end
	
	LibDAU:VerifyAddon("CraftingCompass")
	
	Main:InitializeModules()
end

EVENT_MANAGER:RegisterForEvent("CraftingCompass", EVENT_ADD_ON_LOADED, OnAddOnLoaded)
