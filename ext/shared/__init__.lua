
-- global funcs and utils
require('__shared/MMUtils')

-- load resource list
mmResources = require('__shared/MMResources')
mmCustomResources = require('__shared/MMCustomResources')
mmCustomResources:RegisterResources(mmResources)

-- modules
mmPlayers = require('__shared/MMPlayers')
mmWeapons = require('__shared/MMWeapons')
mmVehicles = require('__shared/MMVehicles')
--mmLevelManager = require('__shared/MMLevelManager')

mmResources:AddLoadHandler(mmCustomResources, mmCustomResources.Write)
mmResources:AddLoadHandler(mmPlayers, mmPlayers.Write)
mmResources:AddLoadHandler(mmWeapons, mmWeapons.Write)
mmResources:AddLoadHandler(mmVehicles, mmVehicles.Write)
mmResources:RegisterInstanceLoadHandlers()

--[[
local TheBigWeaponList = {}
local TheBigWeaponUnlocksList = {}

Events:Subscribe('Level:Loaded', self, function()
	for _, instance in pairs(TheBigWeaponList) do
		local weaponData = ebxEditUtils:GetWritableInstance(instance, 'object')
		local customizeTables = ebxEditUtils:GetWritableContainer(instance, 'object.Customization.Customization')
		local unlockTables = {}

		if (customizeTables ~= nil and customizeTables.unlockParts ~= nil) then
			if (TheBigWeaponUnlocksList[weaponData.name] == nil) then
				TheBigWeaponUnlocksList[weaponData.name] = {
					Optics = {},
					Primary = {},
					Secondary = {},
					Camo = {},
					Unkown = {},
				}
			end

			for i=1, #customizeTables.unlockParts do
				if (i == 1) then
					unlockTables["Optics"] = customizeTables.unlockParts[i]
				elseif (i == 2) then
					unlockTables["Primary"] = customizeTables.unlockParts[i]
				elseif (i == 3) then
					unlockTables["Secondary"] = customizeTables.unlockParts[i]
				elseif (i == 4) then
					unlockTables["Camo"] = customizeTables.unlockParts[i]
				else
					unlockTables["Unkown"] = customizeTables.unlockParts[i]
				end
			end

			for key,value in pairs(unlockTables) do
				for i=1, #value.selectableUnlocks do
					local unlockData = ebxEditUtils:GetWritableInstance(value.selectableUnlocks[i])
					table.insert(TheBigWeaponUnlocksList[weaponData.name][key], {unlockData.name, tostring(unlockData.instanceGuid)}) 
				end
			end
		end
	end

	print('Weapon Name	Unlock Category	Unlock Name	Unlock Guid')
	for weaponName, weaponUnlocks in pairs(TheBigWeaponUnlocksList) do
		for category, unlocks in pairs(weaponUnlocks) do
			for _,unlock in pairs(unlocks) do
				print(weaponName.."	"..category.."	"..unlock[1].."	"..unlock[2])
			end
		end
	end
end)
]]

Events:Subscribe('Partition:Loaded', function(partition)

	for _, instance in pairs(partition.instances) do

		--if (instance:Is('SoldierWeaponBlueprint')) then
		--	table.insert(TheBigWeaponList, instance)
		--end

		-- global vehicle "Sturdification"
		if (instance:Is('VehicleEntityData') and not mmResources:IsSturdifyBlacklisted(instance)) then
		  	local vehicleData = VehicleEntityData(instance)

			vehicleData:MakeWritable()
			vehicleData.upsideDownDamage = 0
			vehicleData.waterDamage = 0
			vehicleData.waterDamageOffset = 10
			vehicleData.throwOutSoldierInsideOnWaterDamage = false
			vehicleData.velocityDamageThreshold = 0
			vehicleData.velocityDamageMagnifier = 0
			dprint('Sturdified Vehicle ['..dump(vehicleData.nameSid)..': '..instance.instanceGuid:ToString('D')..']...')
		end

		-- remove scaled dust clouds behind vehicles for visibility while driving 3p
		if (instance:Is('EmitterTemplateData')) then
			local effectEmitter = EmitterTemplateData(instance)

			if (effectEmitter.name ~= nill and (
				string.find(effectEmitter.name, 'FX/Vehicles/Materials/WheelTracks/Emitter_Wheels/Em_Wheel') or
				string.find(effectEmitter.name, 'FX/Vehicles/Materials/WheelTracks/Emitter_Tracks/Em_Track'))) then

				local processor = effectEmitter.rootProcessor

				while processor ~= nill and not processor:Is('UpdateAgeData') do
					processor = processor.nextProcessor
				end

				local processorData = UpdateAgeData(processor)
				processorData:MakeWritable()
				processorData.lifetime = 0
				dprint('Changed Emitter: '..tostring(effectEmitter.name))
			end
		end

		-- upside-down helos, a little more control
		if (instance:Is('VehicleBlueprint') and mmResources:IsHelicopter(instance)) then

			local vehicleBlueprint = VehicleBlueprint(instance)
			local entityData = VehicleEntityData(vehicleBlueprint.object)
			local chassisData = ChassisComponentData(entityData.components[1])
			local vehicleConfig = VehicleConfigData(chassisData.vehicleConfig)
			local motionDampingData = MotionDampingData(vehicleConfig.motionDamping)
			vehicleConfig:MakeWritable()
			vehicleConfig.motionDamping = nil
			dprint('Removed Motion Damping ['..dump(vehicleBlueprint.name)..': '..instance.instanceGuid:ToString('D')..']...')
		end

		-- remove explosion supression
		if (instance:Is('VeniceExplosionEntityData')) then
			local expData = VeniceExplosionEntityData(instance)
			if (expData.triggerImpairedHearing or expData.isCausingSuppression) then
				expData:MakeWritable()
				expData.triggerImpairedHearing = false
				expData.isCausingSuppression = false
				dprint('Removed Explosion Supression ['..instance.instanceGuid:ToString('D')..']...')
			end
		end

		-- adjust Gun Master level kills
		if (instance:Is('GunMasterKillCounterEntityData')) then
			mmWeapons:SetGMLevelKills(instance)
			--dprint('Changed Gun Master kill requirements...')
		end
	end
end)


function debugDamageHook(ident, hook, soldier, info, giverInfo)

	local debugDamage = false

	if debugDamage then
		SharedUtils:Print('['..ident..']==================: '..tostring(SharedUtils:GetTimeMS()))
	end

	if debugDamage and giverInfo ~= nil then
		SharedUtils:Print('giverInfo.damageType: '..tostring(giverInfo.damageType))
		SharedUtils:Print('giverInfo.weaponUnlock: '..tostring(giverInfo.damageType))
		SharedUtils:Print('giverInfo.weaponFiring: '..tostring(giverInfo.damageType))
		SharedUtils:Print('giverInfo.physicsEntity: '..tostring(giverInfo.damageType))
		SharedUtils:Print('giverInfo.giverControllable: '..tostring(giverInfo.damageType))
		SharedUtils:Print('giverInfo.lockedTarget: '..tostring(giverInfo.damageType))
		SharedUtils:Print('giverInfo.giverCharacterCustomization: '..tostring(giverInfo.damageType))
	end

	if debugDamage and giverInfo ~= nil and giverInfo.giver ~= nil then
		SharedUtils:Print('giverInfo.giver.name: '..tostring(giverInfo.giver.name))
		SharedUtils:Print('giverInfo.giver.id: '..tostring(giverInfo.giver.id))
		SharedUtils:Print('giverInfo.giver.onlineId: '..tostring(giverInfo.giver.onlineId))
		SharedUtils:Print('giverInfo.giver.hasSoldier: '..tostring(giverInfo.giver.hasSoldier))
		SharedUtils:Print('giverInfo.giver.alive: '..tostring(giverInfo.giver.alive))
	end

	if debugDamage and giverInfo ~= nil and giverInfo.assistant ~= nil then
		SharedUtils:Print('giverInfo.assistant.name: '..tostring(giverInfo.giver.name))
		SharedUtils:Print('giverInfo.assistant.id: '..tostring(giverInfo.giver.id))
		SharedUtils:Print('giverInfo.assistant.onlineId: '..tostring(giverInfo.giver.onlineId))
		SharedUtils:Print('giverInfo.assistant.hasSoldier: '..tostring(giverInfo.giver.hasSoldier))
		SharedUtils:Print('giverInfo.assistant.alive: '..tostring(giverInfo.giver.alive))
	end

	if debugDamage and info ~= nil then
		SharedUtils:Print('Distance: '..tostring(info.position:Distance(info.origin)))
		SharedUtils:Print('info.position: '..tostring(info.position))
		SharedUtils:Print('info.direction: '..tostring(info.direction))
		SharedUtils:Print('info.origin: '..tostring(info.origin))
		SharedUtils:Print('info.damage: '..tostring(info.damage))
		SharedUtils:Print('info.damagedMaterial: '..getMaterialName(info.damagedMaterial))
		SharedUtils:Print('info.collidingMaterial: '..getMaterialName(info.collidingMaterial))
		SharedUtils:Print('info.collisionSpeed: '..tostring(info.collisionSpeed))
		SharedUtils:Print('info.stamina: '..tostring(info.stamina))
		SharedUtils:Print('info.boneIndex: '..tostring(info.boneIndex))
		SharedUtils:Print('info.isDemolitionDamage: '..tostring(info.isDemolitionDamage))
		SharedUtils:Print('info.isExplosionDamage: '..tostring(info.isExplosionDamage))
		SharedUtils:Print('info.isBulletDamage: '..tostring(info.isBulletDamage))
		SharedUtils:Print('info.isClientDamage: '..tostring(info.isClientDamage))
		SharedUtils:Print('info.shouldForceDamage: '..tostring(info.shouldForceDamage))
	end

	if debugDamage then
		SharedUtils:Print('['..ident..']============================================')
	end

  	-- no collision damage or 'Count' damage
	if giverInfo.damageType == 4 or giverInfo.damageType == 6 then
		info.damage = 0
		hook:Return()
  	end

  	hook:Pass(soldier, info, giverInfo)
end
-- negate damage from hitting stuff because 2FAST
--Hooks:Install('Soldier:Damage', 1987, 'A', debugDamageHook)
Hooks:Install('Soldier:Damage', 1, 'B', debugDamageHook)

materialGrid = nil
materialContainer = nil

function getMaterialName(materialId)
	if (materialId == nil) then
		return '[nil]: nil'
	end
	local mapIndex = MaterialContainerPair(materialId).physicsPropertyIndex
	if mapIndex < 0 then
		mapIndex = 256 + mapIndex
	end

	return '['..tostring(mapIndex+1) ..']: '..tostring(materialContainer.materialNames[mapIndex+1])
end

Events:Subscribe('Level:Loaded', function(levelName, gameMode, round, roundsPerMap)
	materialGrid = MaterialGridData(ResourceManager:SearchForDataContainer(SharedUtils:GetLevelName() .. "/MaterialGrid_Win32/Grid"))
	materialContainer = MaterialContainerAsset(ResourceManager:SearchForDataContainer("Materials/MaterialContainer"))
end)

Events:Subscribe('Level:Destroy', function()
	materialContainer = nil
	materialGrid = nil
end)

--[[
-- load bundles to get the TOW smoke trails
Events:Subscribe('Level:LoadResources', function()
	ResourceManager:MountSuperBundle('levels/mp_007/mp_007')
end)

Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
	if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
		print('Injecting bundles.')

		bundles = {
			'levels/mp_007/mp_007',
			bundles[1],
		}

		hook:Pass(bundles, compartment)
	end
end)

Events:Subscribe('Level:RegisterEntityResources', function(levelData)
	local registry = RegistryContainer(ResourceManager:SearchForInstanceByGuid(Guid('958A27B8-F6B4-AE8C-4AE8-1FC8E2AB60BF')))
	ResourceManager:AddRegistry(registry, ResourceCompartment.ResourceCompartment_Game)
end)
]]