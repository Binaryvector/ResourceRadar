
local PinTypes, Textures, CallbackManager, Events
local Settings = {}
CraftingCompass:RegisterModule("settings", Settings)

function Settings:Initialize()
	PinTypes = CraftingCompass.pinTypes
	Textures = CraftingCompass.textures
	CallbackManager = CraftingCompass.callbackManager
	Events = CraftingCompass.events
	
	CraftingCompass_SavedVars = CraftingCompass_SavedVars or {}
	local characterId = GetCurrentCharacterId()
	CraftingCompass_SavedVars.character = CraftingCompass_SavedVars.character or {}
	CraftingCompass_SavedVars.character[characterId] = CraftingCompass_SavedVars.character[characterId] or {}
	self.currentProfile = CraftingCompass_SavedVars.character[characterId]
	
	self:InitializeDefaults()
	
	-- when accessing Settings.pinTints[pinTypeId] it should be forwarded to
	-- self.currentProfile.pinTints[pinTypeId]
	-- and changing values should trigger a SETTING_CHANGED event
	local function hookTable(tableField)
		local dummyTable = {}
		local GetterSetter = {
			__newindex = function(tbl, key, value)
				self.currentProfile[tableField][key] = value
				CallbackManager:FireCallbacks(Events.SETTING_CHANGED, tableField, key, value)
			end,
			__index = function(tbl, key)
				return self.currentProfile[tableField][key]
			end
		}
		setmetatable(dummyTable, GetterSetter)
		self[tableField] = dummyTable
	end
	hookTable("pinColors")
	hookTable("pinTextures")
	
	local GetterSetter = {
		__newindex = function(self, key, value)
			self.currentProfile[key] = value
			CallbackManager:FireCallbacks(Events.SETTING_CHANGED, key, value)
		end,
		__index = function(self, key)
			return self.currentProfile[key]
		end
	}
	setmetatable(self, GetterSetter)
	
end

function Settings:InitializeDefaults()

	local defaultPinColors = {
		[PinTypes.BLACKSMITH]  = {0.447, 0.49, 1, 1},
		[PinTypes.CLOTHING]    = {0.588, 0.988, 1, 1},
		[PinTypes.ENCHANTING]  = {1, 0.455, 0.478, 1},
		[PinTypes.MUSHROOM]    = {0.451, 0.569, 0.424, 1},
		[PinTypes.FLOWER]      = {0.557, 1, 0.541, 1},
		[PinTypes.WATERPLANT]  = {0.439, 0.937, 0.808, 1},
		[PinTypes.WOODWORKING] = {1, 0.694, 0.494, 1},
		[PinTypes.WATER]       = {0.569, 0.827, 1, 1},
		[PinTypes.UNKNOWN]     = {1, 1, 1, 1},
	}
	
	local defaultPinTextures = {}
	for _, pinTypeId in pairs(PinTypes.ALL_PINTYPES) do
		defaultPinTextures[pinTypeId] = Textures.pinTypeTextures[pinTypeId][1]
	end
	
	self.defaultSettings = {
		pinColors = defaultPinColors,
		pinTextures = defaultPinTextures,
		
		displayNodesOnCompass = true,
		displayNodesInWorld = false,
		
		compassPinSize = 28,
		worldPinSize = 64,
		worldPinPulse = false,
	}
	self:AddMissingDefaultsForTable(self.currentProfile, self.defaultSettings)
end

-- when a new setting is added, it might be missing in the profile
-- this function adds the default values
function Settings:AddMissingDefaultsForTable(tbl, defaults)
	for key, value in pairs(defaults) do
		if tbl[key] == nil then
			tbl[key] = value
		end
		if type(value) == "table" then
			tbl[key] = tbl[key] or {}
			self:AddMissingDefaultsForTable(tbl[key], value)
		end
	end
end
