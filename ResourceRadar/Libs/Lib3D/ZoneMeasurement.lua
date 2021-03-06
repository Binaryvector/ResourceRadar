
local ZoneMeasurement = ZO_Object:Subclass()
Lib3D.ZoneMeasurement = ZoneMeasurement

function ZoneMeasurement:New(...)
	local obj = ZO_Object.New(self)
	obj:Initialize(...)
	return obj
end

function ZoneMeasurement:Initialize(zoneIndex, zoneId, originGlobalX, originGlobalY, globalToWorldFactor)
	self.zoneIndex = zoneIndex
	self.zoneId = zoneId
	self.originGlobalX = originGlobalX
	self.originGlobalY = originGlobalY
	self.globalToWorldFactor = globalToWorldFactor
	self.worldToGlobalFactor = 1 / globalToWorldFactor
end

function ZoneMeasurement:IsValid()
	return (self.originGlobalX and self.originGlobalY and self.globalToWorldFactor)
end

function ZoneMeasurement:GlobalDistanceInMeters(globalDistance)
	return globalDistance * self.globalToWorldFactor
end

function ZoneMeasurement:MetersToGlobalDistance(meters)
	return meters * self.worldToGlobalFactor
end

function ZoneMeasurement:GlobalToWorld(globalX, globalY)
	local worldX = (globalX - self.originGlobalX) * self.globalToWorldFactor
	local worldZ = (globalY - self.originGlobalY) * self.globalToWorldFactor
	return worldX, worldZ
end

function ZoneMeasurement:WorldToGlobal(worldX, worldZ)
	local globalX = worldX * self.worldToGlobalFactor + self.originGlobalX
	local globalY = worldZ * self.worldToGlobalFactor + self.originGlobalY
	return globalX, globalY
end

Lib3D.defaultZoneMeasurement = ZoneMeasurement:New(nil, nil, nil, nil, Lib3D.DEFAULT_GLOBAL_TO_WORLD_FACTOR )
