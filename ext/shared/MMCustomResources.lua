
class "MMCustomResources"

function MMCustomResources:__init()
	self:RegisterEvents()
end

function MMCustomResources:RegisterEvents()
	Events:Subscribe('Level:RegisterEntityResources', self, self.onRegisterEntityResources)
end

function MMCustomResources:RegisterResources(mmResources)
	self.CustomGuids = {}
	self.CustomResources = {}

	self.CustomResources["RPG7Projectile_Cold"] = {}
	self.CustomResources["RPG7Projectile_Cold"]["BaseResourceName"] = 'RPG7Projectile'
	self.CustomResources["RPG7Projectile_Cold"]["BasePartition"] = '6C857FD9-6FB3-11DE-B35E-864CF572E1C4'
	self.CustomResources["RPG7Projectile_Cold"]["BaseInstance"] = '3DCC3FA8-3148-3773-E2A6-4F2E2AFE5319'
	self.CustomResources["RPG7Projectile_Cold"]["Name"] = 'Weapons/RPG7/RPG7Projectile_Cold'
	self.CustomResources["RPG7Projectile_Cold"]["DataType"] = 'ProjectileBlueprint'

	self.CustomResources["RPG7Projectile_Heavy"] = {}
	self.CustomResources["RPG7Projectile_Heavy"]["BaseResourceName"] = 'RPG7Projectile'
	self.CustomResources["RPG7Projectile_Heavy"]["BasePartition"] = '6C857FD9-6FB3-11DE-B35E-864CF572E1C4'
	self.CustomResources["RPG7Projectile_Heavy"]["BaseInstance"] = '3DCC3FA8-3148-3773-E2A6-4F2E2AFE5319'
	self.CustomResources["RPG7Projectile_Heavy"]["Name"] = 'Weapons/RPG7/RPG7Projectile_Heavy'
	self.CustomResources["RPG7Projectile_Heavy"]["DataType"] = 'ProjectileBlueprint'

	for resourceName, resourceData in pairs(self.CustomResources) do
		resourceData.Duplicated = false
		mmResources:Register(resourceData.BaseResourceName, resourceData.BasePartition, resourceData.BaseInstance)
		mmResources:Register(resourceName, resourceData.BasePartition, self:CreateCustomGUID())
	end
end

function MMCustomResources:Write(mmResources)
	for resourceName, resourceData in pairs(self.CustomResources) do
		if (mmResources:IsLoaded(resourceData.BaseResourceName) and not mmResources:IsLoaded(resourceName) and not self.CustomResources[resourceName].Duplicated) then

			print('self:DuplicateBlueprint: '..tostring(resourceName))
			local newBlueprint = self:DuplicateBlueprint(resourceName)
			
			if (newBlueprint ~= nil) then

				local originalPartition = mmResources:GetPartition(resourceData.BaseResourceName)
				originalPartition:AddInstance(newBlueprint)

				mmResources:SetLoaded(resourceName, true)
				mmResources:CallLoadHandlers()
			end
		end 
	end
end

function MMCustomResources:CreateCustomGUID()
	local newGuid = GenerateCustomGuid('11181987')
	while table.has(self.CustomGuids, newGuid) do
		newGuid = GenerateCustomGuid('11181987')
	end
	table.insert(self.CustomGuids, newGuid)
	return newGuid
end

function MMCustomResources:onRegisterEntityResources()
	local registry = RegistryContainer()
	local addRegistry = false

	for resourceName, resourceData in pairs(self.CustomResources) do
		if (self.CustomResources[resourceName].Entities ~= nil) then
			for i=1, #self.CustomResources[resourceName].Entities do
				registry.entityRegistry:add(self.CustomResources[resourceName].Entities[i])
				addRegistry = true
			end
		end
		if (self.CustomResources[resourceName].Assets ~= nil) then
			for i=1, #self.CustomResources[resourceName].Assets do
				registry.assetRegistry:add(self.CustomResources[resourceName].Assets[i])
				addRegistry = true
			end
		end
		if (self.CustomResources[resourceName].Blueprints ~= nil) then
			for i=1, #self.CustomResources[resourceName].Blueprints do
				registry.blueprintRegistry:add(self.CustomResources[resourceName].Blueprints[i])
				addRegistry = true
			end
		end
		if (self.CustomResources[resourceName].ReferenceObjects ~= nil) then
			for i=1, #self.CustomResources[resourceName].ReferenceObjects do
				registry.referenceObjectRegistry:add(self.CustomResources[resourceName].ReferenceObjects[i])
				addRegistry = true
			end
		end
	end

	if (addRegistry) then
		print('ResourceManager:AddRegistry')
		ResourceManager:AddRegistry(registry, ResourceCompartment.ResourceCompartment_Dynamic_Begin_)
	end
end

function MMCustomResources:DuplicateBlueprint(resourceName)
	if (self.CustomResources[resourceName].DataType == 'CharacterPhysicsData') then
		return self:CreateCharacterPhysicsData(resourceName)

	elseif (self.CustomResources[resourceName].DataType == 'SoldierBlueprint') then
		return self:CreateSoldierBlueprint(resourceName)

	else
		return self:CloneBlueprint(resourceName)
	end
end


function MMCustomResources:CloneBlueprint(resourceName)
	-- Clone the original instance and assign it our custom GUID and name.
	local newGuid = Guid(mmResources:Get(resourceName).Instance)
	local resourceData = self.CustomResources[resourceName]

	print('Creating Blueprint: '..resourceName..' ['..tostring(newGuid)..']')

	local originalBlueprint = ebxEditUtils:GetWritableInstance(mmResources:GetInstance(resourceData.BaseResourceName))
	local customBlueprint = _G[resourceData.DataType](originalBlueprint:Clone(newGuid))
	customBlueprint.name = resourceData.Name

	resourceData.Duplicated = true
	resourceData.Blueprints = { customBlueprint }

	if (resourceName == 'RPG7Projectile_Cold' or resourceName == 'RPG7Projectile_Heavy') then
		--local clone = self:CloneInstance(originalBlueprint.object)
		--customBlueprint.object = clone
		--resourceData.Entities = { customBlueprint.object }
	end

	return customBlueprint
end

function MMCustomResources:CloneInstance(originalInstance)
	local newGuid = Guid(self:CreateCustomGUID())
	print('CloneInstance [A]: '..tostring(originalInstance.typeInfo.name)..' ['..tostring(originalInstance.instanceGuid)..']')
	local cloneInstance = _G[originalInstance.typeInfo.name](originalInstance:Clone(newGuid))
	print('CloneInstance [B]: '..tostring(cloneInstance.typeInfo.name)..' ['..tostring(cloneInstance.instanceGuid)..']')
	return cloneInstance
end


function MMCustomResources:CreateCharacterPhysicsData(resourceName)

	local customSoldierPhysics = self:CloneBlueprint(resourceName)

	for state=1, #customSoldierPhysics.states do

		local stateType = customSoldierPhysics.states[state].typeInfo.name
		local customState = _G[stateType](customSoldierPhysics.states[state]:Clone())

		if (customState:Is('JumpStateData')) then
			customState:MakeWritable()
			customState.jumpHeight = 6
			customState.jumpEffectSize = 2
		end

		if (customState:Is('InAirStateData')) then
			customState:MakeWritable()
			customState.freeFallVelocity = 100
		end

		customSoldierPhysics.states[state] = customState

		for pose=1, #customSoldierPhysics.states[state].poseInfo do

			local customPose = CharacterStatePoseInfo(customSoldierPhysics.states[state].poseInfo[pose]:Clone())
			customPose:MakeWritable()

			-- extra creepy crawling
			if (customPose.poseType == CharacterPoseType.CharacterPoseType_Prone) then
				customPose.velocity = 8
			elseif (customPose.poseType == CharacterPoseType.CharacterPoseType_Crouch) then
				customPose.velocity = 1
			else
				customPose.velocity = 4
			end

			customPose.sprintMultiplier = 2
			customSoldierPhysics.states[state].poseInfo[pose] = customPose
		end
	end

	return customSoldierPhysics
end

function MMCustomResources:CreateSoldierBlueprint(resourceName)

	local customSoldierBp = self:CloneBlueprint(resourceName)

	-- We also need to clone the original SoldierEntityData and replace all references to it.
	local originalSoldierData = customSoldierBp.object
	local customSoldierData = SoldierEntityData(originalSoldierData:Clone())

	customSoldierBp.object = customSoldierData

	for _, connection in pairs(customSoldierBp.propertyConnections) do
		if connection.source == originalSoldierData then
			connection.source = customSoldierData
		end

		if connection.target == originalSoldierData then
			connection.target = customSoldierData
		end
	end

	for _, connection in pairs(customSoldierBp.linkConnections) do
		if connection.source == originalSoldierData then
			connection.source = customSoldierData
		end

		if connection.target == originalSoldierData then
			connection.target = customSoldierData
		end
	end

	for _, connection in pairs(customSoldierBp.eventConnections) do
		if connection.source == originalSoldierData then
			connection.source = customSoldierData
		end

		if connection.target == originalSoldierData then
			connection.target = customSoldierData
		end
	end

	-- Change the soldier's max health.
	customSoldierData.maxHealth = 500
	customSoldierData.characterPhysics = CharacterPhysicsData(mmResources:GetInstance('huntedsoldierphysics'))

	return customSoldierBp
end



return MMCustomResources()