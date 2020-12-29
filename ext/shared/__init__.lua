
require('__shared/MMUtils')

-- load resource list
mmResources = require('__shared/MMResources')

--global changes
mmPlayers = require('__shared/MMPlayers')
mmWeapons = require('__shared/MMWeapons')
mmVehicles = require('__shared/MMVehicles')
mmLevelManager = require('__shared/MMLevelManager')

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

-- global vehicle "Sturdification"
Events:Subscribe('Partition:Loaded', function(partition)
	for _, instance in pairs(partition.instances) do
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

		if (instance:Is('EffectBlueprint')) then
			local effectData = EffectBlueprint(instance)

			if (effectData.name ~= nill and string.find(effectData.name, 'FX/Vehicles/Materials/WheelTracks/FX_')) then

				local effectEntity = EffectEntityData(effectData.object)
				effectEntity:MakeWritable()
				effectEntity.transform.trans.x = 20
				effectEntity.transform.trans.y = 20
				effectEntity.transform.trans.z = 0
				effectEntity.maxInstanceCount = 1
				print('Changed Effect: '..tostring(effectData.name))
			end
		end
	end
end)
