class "MMVehicles"

function MMVehicles:Write(mmResources)

	if (mmResources:IsLoaded('m1abramsengine')) then
		mmResources:SetLoaded('m1abramsengine', false)

		local engineData = CombustionEngineConfigData(mmResources:GetInstance('m1abramsengine'))
		engineData:MakeWritable()
		engineData.enginePowerMultiplier = 3
		engineData.boost.forwardStrength = 4
		print('Changed M1Abrams Engine...')
	end

	if (mmResources:IsLoaded('mbtcannon')) then
		mmResources:SetLoaded('mbtcannon', false)

		local weaponData = WeaponComponentData(mmResources:GetInstance('mbtcannon'))
		weaponData:MakeWritable()
		weaponData.impulseStrength = 250000
		weaponData.transform.forward.z = -1.0
		print('Changed MBT Cannon...')
	end

	if (mmResources:IsLoaded('t90shell')) then
		mmResources:SetLoaded('t90shell', false)

		local bulletData = BulletEntityData(mmResources:GetInstance('t90shell'))
		bulletData:MakeWritable()
		bulletData.gravity = 4.5
		bulletData.impactImpulse = 10000
		bulletData.startDamage = 0
		bulletData.endDamage = 0
		bulletData.initialSpeed = 100
		bulletData.timeToLive = 10

		print('Changed T90A Shell...')
	end

	if (mmResources:IsLoaded('t90shot')) then
		mmResources:SetLoaded('t90shot', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('t90shot'))
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 100
		fireData.fireLogic.rateOfFire = 350
		fireData.fireLogic.reloadTime = 0.5
		print('Changed T90A Cannon...')
	end

	if (mmResources:IsLoaded('t90impact')) then
		mmResources:SetLoaded('t90impact', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('t90impact'))
		expData:MakeWritable()
		expData.blastDamage = 0
		expData.blastRadius = 1.0
		expData.blastImpulse = 70000
		expData.shockwaveDamage = 0.1
		expData.shockwaveRadius = 1.0
		expData.shockwaveImpulse = 70000
		expData.shockwaveTime = 0.1
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		print('Changed T90A Impact...')
	end

	if (mmResources:IsLoaded('t90impactsplash')) then
		mmResources:SetLoaded('t90impactsplash', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('t90impactsplash'))
		expData:MakeWritable()
		expData.blastDamage = 0
		expData.blastRadius = 0
		expData.blastImpulse = 0
		expData.shockwaveDamage = 0
		expData.shockwaveRadius = 0
		expData.shockwaveImpulse = 0
		expData.shockwaveTime = 0
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		print('Changed T90A Splash...')
	end

	if (mmResources:IsLoaded('humveeengine')) then
		mmResources:SetLoaded('humveeengine', false)

		local engineData = CombustionEngineConfigData(mmResources:GetInstance('humveeengine'))
		engineData:MakeWritable()
		engineData.enginePowerMultiplier = 10
		engineData.boost.accelerationScale = 1.5
		print('Changed Humvee Engine...')
	end

	if (mmResources:IsLoaded('humveehorn')) then
		mmResources:SetLoaded('humveehorn', false)

		local weaponData = WeaponComponentData(mmResources:GetInstance('humveehorn'))
		weaponData:MakeWritable()
		weaponData.impulseStrength = 20000
		weaponData.transform.forward.z = -1.0
		-- adjusts for position of driver entry point and center of mass position
		weaponData.transform.trans.x = -0.6888
		weaponData.transform.trans.y = -0.8669 + 0.6
		weaponData.transform.trans.z = -0.2585 + 0.2

		print('Changed Humvee Horn...')
	end
end

return MMVehicles()