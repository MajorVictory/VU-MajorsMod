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

	if (mmResources:IsLoaded('m1abramsshot')) then
		mmResources:SetLoaded('m1abramsshot', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('m1abramsshot'))
		fireData:MakeWritable()
		fireData.fireLogic.rateOfFire = 350
		fireData.fireLogic.reloadTime = 0.5
		print('Changed M1Abrams Cannon...')
	end

	if (mmResources:IsLoaded('m1abramsshell')) then
		mmResources:SetLoaded('m1abramsshell', false)

		local bulletData = BulletEntityData(mmResources:GetInstance('m1abramsshell'))
		bulletData:MakeWritable()
		bulletData.gravity = -2
		bulletData.impactImpulse = 900000
		bulletData.startDamage = 0
		bulletData.endDamage = 0
		bulletData.initialSpeed = 0
		bulletData.timeToLive = 10
		print('Changed M1Abrams Shell...')
	end

	if (mmResources:IsLoaded('m1abramswheel') and false) then
		mmResources:SetLoaded('m1abramswheel', false)

		local wheelData = WheelConfigData(mmResources:GetInstance('m1abramswheel'))
		wheelData:MakeWritable()

		--wheelData.slopeGripMinAngle = 0
		--wheelData.slopeGripMaxAngle = 91
		--wheelData.slopeGripExponent = 20

		wheelData.sideSlipAngleMaxSlipCondition = 172000.0
    	wheelData.angularVelocityMinSlipCondition = 0.00570000009611
    	wheelData.wheelVelocityXMinSlipCondition = 3600.0
    	wheelData.wheelSlipRatioMaxSlipCondition = 1000.0

		wheelData.lowSpeedSteeringSensitivity = 1
		wheelData.midSpeedSteeringSensitivity = 1
		wheelData.highSpeedSteeringSensitivity = 1

		wheelData.lowSpeedSteeringSensitivityLimit = 20.0
    	wheelData.midSpeedSteeringSensitivityLimit = 50.0
    	wheelData.highSpeedSteeringSensitivityLimit = 70.0

    	wheelData.trackedTurnSpeedLimit = 3
    	wheelData.trackedForwardSpeedLimit = 1.5

		wheelData.longitudinalFrictionForceMaxFactor = 10
		wheelData.lateralFrictionForceMaxFactor = 10

		wheelData.steeringSensitivity[1].steeringSensitivity = 1
		wheelData.steeringSensitivity[2].steeringSensitivity = 1
		wheelData.steeringSensitivity[3].steeringSensitivity = 1
		wheelData.steeringSensitivity[4].steeringSensitivity = 1
		wheelData.steeringSensitivity[5].steeringSensitivity = 1
		wheelData.steeringSensitivity[6].steeringSensitivity = 1
		wheelData.steeringSensitivity[7].steeringSensitivity = 1
		print('Changed M1Abrams Wheels...')
	end

	if (mmResources:IsLoaded('mbtcannon')) then
		mmResources:SetLoaded('mbtcannon', false)

		local weaponData = WeaponComponentData(mmResources:GetInstance('mbtcannon'))
		weaponData:MakeWritable()
		weaponData.impulseStrength = 250000
		weaponData.transform.forward.z = -1.0
		print('Changed MBT Cannon...')
	end

	if (mmResources:IsLoaded('m1128engine')) then
		mmResources:SetLoaded('m1128engine', false)

		local engineData = CombustionEngineConfigData(mmResources:GetInstance('m1128engine'))
		engineData:MakeWritable()
		engineData.enginePowerMultiplier = 18
		print('Changed M1128 Stryker Engine...')
	end

	if (mmResources:IsLoaded('t90shell')) then
		mmResources:SetLoaded('t90shell', false)

		local bulletData = BulletEntityData(mmResources:GetInstance('t90shell'))
		bulletData:MakeWritable()
		bulletData.gravity = 4.5
		bulletData.impactImpulse = 90000
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
		expData.blastImpulse = 90000
		expData.shockwaveDamage = 0.1
		expData.shockwaveRadius = 1.0
		expData.shockwaveImpulse = 90000
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

	if (mmResources:IsLoaded('growlerengine')) then
		mmResources:SetLoaded('growlerengine', false)

		local engineData = CombustionEngineConfigData(mmResources:GetInstance('growlerengine'))
		engineData:MakeWritable()
		engineData.rpmMin = 500
		engineData.rpmMax = 20000
		engineData.rpmCut = 25000
		print('Changed Growler Engine...')
	end

	if (mmResources:IsLoaded('growlerwheelsfront') and mmResources:IsLoaded('growlerwheelsback')) then
		mmResources:SetLoaded('growlerwheelsfront', false)
		mmResources:SetLoaded('growlerwheelsback', false)

		local frontWheel = WheelConfigData(mmResources:GetInstance('growlerwheelsfront'))
		local backWheel = WheelConfigData(mmResources:GetInstance('growlerwheelsback'))

		frontWheel:MakeWritable()
		frontWheel.sideSlipAngleMaxSlipCondition = 172000.0
    	frontWheel.angularVelocityMinSlipCondition = 0.00570000009611
    	frontWheel.wheelVelocityXMinSlipCondition = 3600.0
    	frontWheel.wheelSlipRatioMaxSlipCondition = 1000.0

		backWheel:MakeWritable()
    	backWheel.sideSlipAngleMaxSlipCondition = 172000.0
    	backWheel.angularVelocityMinSlipCondition = 0.00570000009611
    	backWheel.wheelVelocityXMinSlipCondition = 3600.0
    	backWheel.wheelSlipRatioMaxSlipCondition = 1000.0

		print('Changed Growler Wheels...')
	end

	if (mmResources:IsLoaded('growlerhorn')) then
		mmResources:SetLoaded('growlerhorn', false)

		local weaponData = WeaponComponentData(mmResources:GetInstance('growlerhorn'))
		weaponData:MakeWritable()
		weaponData.impulseStrength = 20000
		weaponData.transform.forward.z = -0.5
		-- adjusts for position of driver entry point and center of mass position
		weaponData.transform.trans.x = -0.3755
		weaponData.transform.trans.y = -0.8669 + 0.300
		weaponData.transform.trans.z = -0.2450
		print('Changed Growler Horn...')
	end

	if (mmResources:IsLoaded('ah6engine')) then
		mmResources:SetLoaded('ah6engine', false)

		local engineData = PropellerEngineConfigData(mmResources:GetInstance('ah6engine'))
		engineData:MakeWritable()
		engineData.enginePowerMultiplier = 5
		engineData.forceMagnitudeMultiplier = 10
		engineData.spForwardStrength = 100.0
		engineData.spSidewaysStrength = 20.0
		engineData.spVerticalStrength = 50.0
		print('Changed AH6-J Engine...')
	end

	if (mmResources:IsLoaded('ah6rotors')) then
		mmResources:SetLoaded('ah6rotors', false)

		local rotorData = RotorParameters(mmResources:GetInstance('ah6rotors'))
		rotorData:MakeWritable()
		rotorData.horizontalForceModifier = 10
		rotorData.horisontalMinEffectVelocity = 100
		print('Changed AH6-J Rotors...')
	end
end

return MMVehicles()