
require('__shared/MMUtils')

-- load resource list
mmResources = require('__shared/MMResources')

-- modules
mmPlayers = require('__shared/MMPlayers')
mmWeapons = require('__shared/MMWeapons')
mmVehicles = require('__shared/MMVehicles')
mmLevelManager = require('__shared/MMLevelManager')

-- register console variables
mmConVars = require('__shared/MMConVars')
mmConVars:RegisterEvents('Shared')

-- loop registered resources to listen for
for resourceName, resourceData in pairs(mmResources:Get()) do
	if (resourceData.Partition and resourceData.Instance) then
		ResourceManager:RegisterInstanceLoadHandler(Guid(resourceData.Partition), Guid(resourceData.Instance), function(instance)
		  mmResources:SetLoaded(resourceName, true)
		  print("Resource Loaded: "..tostring(resourceName))
		  mmLevelManager:Write(mmResources)
		  mmPlayers:Write(mmResources)
		  mmWeapons:Write(mmResources)
		  mmVehicles:Write(mmResources)
		end)
	end
end

-- Thanks to Powback's bundle mounter: https://github.com/BF3RM/BundleMounter
--[[
Events:Subscribe('BundleMounter:GetBundles', function(bundles)
	Events:Dispatch('BundleMounter:LoadBundles', 'Levels/MP_007/MP_007', {
		'Levels/MP_007/MP_007',
		'Levels/MP_007/Rush'
	})
	Events:Dispatch('BundleMounter:LoadBundles', 'Levels/SP_Tank/SP_Tank', {
		'Levels/SP_Tank/SP_Tank',
		'Levels/SP_Tank/HighwayToTeheran_01',
	})
    Events:Dispatch('BundleMounter:LoadBundles', 'Xp3Chunks', {
    	'Xp3Chunks'
    })
	Events:Dispatch('BundleMounter:LoadBundles', 'Levels/XP3_Desert/XP3_Desert', {
		'Levels/XP3_Desert/XP3_Desert'
	})
	--Events:Dispatch('BundleMounter:LoadBundles', 'SpChunks', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'CoopChunks', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'MpChunks', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'Chunks0', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'Chunks1', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'Chunks2', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'Xp1Chunks', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'Xp2Chunks', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'Xp4Chunks', {})
    --Events:Dispatch('BundleMounter:LoadBundles', 'Xp5Chunks', {})
end)
]]

Events:Subscribe('Partition:Loaded', function(partition)

	for _, instance in pairs(partition.instances) do

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
			print('Sturdified Vehicle ['..dump(vehicleData.nameSid)..': '..instance.instanceGuid:ToString('D')..']...')
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

				processorData = UpdateAgeData(processor)
				processorData:MakeWritable()
				processorData.lifetime = 0
				print('Changed Emitter: '..tostring(effectEmitter.name))
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
			print('Removed Motion Damping ['..dump(vehicleBlueprint.name)..': '..instance.instanceGuid:ToString('D')..']...')
		end
	end
end)
