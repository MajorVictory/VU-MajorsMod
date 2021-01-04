class "MMWeapons"

function MMWeapons:Write(mmResources)

	if (mmResources:IsLoaded('ammobag')) then
		mmResources:SetLoaded('ammobag', false)

		local supplySphereData = SupplySphereEntityData(mmResources:GetInstance('ammobag'))
		supplySphereData:MakeWritable()
		supplySphereData.receivesExplosionDamage = false

		supplySphereData.supplyData.healing.radius = 9000
		supplySphereData.supplyData.healing.supplyIncSpeed = 69
		supplySphereData.supplyData.healing.infiniteCapacity = true
		supplySphereData.supplyData.healing.supplyPointsRefillSpeed = 1
		supplySphereData.supplyData.healing.supplyPointsCapacity = 1

		supplySphereData.supplyData.ammo.radius = 9000
		supplySphereData.supplyData.ammo.supplyIncSpeed = 1
		supplySphereData.supplyData.ammo.infiniteCapacity = true
		supplySphereData.supplyData.ammo.supplyPointsRefillSpeed = 1
		supplySphereData.supplyData.ammo.supplyPointsCapacity = 1

		print('Changed Ammobag...')
	end

	if (mmResources:IsLoaded('smaw')) then
		mmResources:SetLoaded('smaw', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('smaw'))
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 250
		print('Changed SMAW...')
	end

	if (mmResources:IsLoaded('magnum44') and mmResources:IsLoaded('smawmissile')) then
		mmResources:SetLoaded('magnum44', false)
		mmResources:SetLoaded('smawmissile', false)

		local missileData = MissileEntityData(mmResources:GetInstance('smawmissile'))
		missileData:MakeWritable()
		missileData.maxSpeed = 750
		missileData.gravity = -9.8
		print('Changed SMAW Missile...')

		-- swap magnum for smaw rocket
		local fireData = FiringFunctionData(mmResources:GetInstance('magnum44'))
		fireData:MakeWritable()
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(missileData)
		print('Changed Magnum .44...')
	end

	if (mmResources:IsLoaded('magnum44scope')) then
		mmResources:SetLoaded('magnum44scope', false)

		local zoomData = WeaponZoomModifier(mmResources:GetInstance('magnum44scope'))
		zoomData:MakeWritable()
		zoomData.zoomRenderFov = 3.5
		print('Changed Magnum Scope Zoom...')
	end

	if (mmResources:IsLoaded('magnum44aim') and mmResources:IsLoaded('zoom20x')) then
		mmResources:SetLoaded('magnum44aim', false)
		mmResources:SetLoaded('zoom20x', false)

		local aimData = SoldierAimingSimulationData(mmResources:GetInstance('magnum44aim'))
		aimData:MakeWritable()
		aimData.zoomLevels[2] = ZoomLevelData(mmResources:GetInstance('zoom20x'))
		print('Changed Magnum Zoom Level...')
	end

	if (mmResources:IsLoaded('p90') and mmResources:IsLoaded('12gfrag')) then
		mmResources:SetLoaded('p90', false)
		mmResources:SetLoaded('12gfrag', false)
		-- swap p90 for 12gfrag bullets
		local fireData = FiringFunctionData(mmResources:GetInstance('p90'))
		local bulletData = BulletEntityData(mmResources:GetInstance('12gfrag'))

		bulletData:MakeWritable()
		bulletData.gravity = 0
		bulletData.startDamage = 6969
		bulletData.endDamage = 6969
		bulletData.timeToLive = 5
		bulletData.impactImpulse = 69000
		print('Changed 12G Frag Projectile...')

		fireData:MakeWritable()
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(bulletData)
		fireData.ammo.magazineCapacity = 500
		print('Changed P90...')
	end

	if (mmResources:IsLoaded('m60') and mmResources:IsLoaded('crossbolt_he') and mmResources:IsLoaded('crossboltsound')) then
		mmResources:SetLoaded('m60', false)
		mmResources:SetLoaded('crossbolt_he', false)
		mmResources:SetLoaded('crossboltsound', false)
		-- swap m60 for crossbolt_he bullets
		local fireData = FiringFunctionData(mmResources:GetInstance('m60'))
		local bulletData = BulletEntityData(mmResources:GetInstance('crossbolt_he'))

		bulletData:MakeWritable()
		bulletData.gravity = -4.5
		bulletData.startDamage = 6969
		bulletData.endDamage = 6969
		bulletData.timeToLive = 10
		bulletData.impactImpulse = 69000
		print('Changed Crossbow Bolt HE Projectile...')

		fireData:MakeWritable()
		fireData.sound = SoundPatchAsset(mmResources:GetInstance('crossboltsound'))
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(bulletData)
		fireData.shot.initialSpeed.z = 45
		fireData.ammo.magazineCapacity = 20
		fireData.fireLogic.reloadTime = 3.7
		print('Changed M60...')
	end

	if (mmResources:IsLoaded('m98')) then
		mmResources:SetLoaded('m98', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('m98'))
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 9001
		print('Changed M98 FireData...')
	end

	if (mmResources:IsLoaded('bullet338')) then
		mmResources:SetLoaded('bullet338', false)

		local bulletData = BulletEntityData(mmResources:GetInstance('bullet338'))
		bulletData:MakeWritable()
		bulletData.timeToLive = 1.5
		bulletData.startDamage = 966969
		bulletData.endDamage = 966969
		bulletData.damageFalloffStartDistance = 9000
		bulletData.damageFalloffEndDistance = 9001
		print('Changed M98 Bullet...')
	end

	if (mmResources:IsLoaded('rpgprojectile') and mmResources:IsLoaded('aek971')) then
		mmResources:SetLoaded('rpgprojectile', false)
		mmResources:SetLoaded('aek971', false)
		-- swap aek bullet for rpg rocket
		local fireData = FiringFunctionData(mmResources:GetInstance('aek971'))
		fireData:MakeWritable()
		fireData.ammo.numberOfMagazines = 20
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(mmResources:GetInstance('rpgprojectile'))
		print('Changed AEK Projectile...')
	end

	if (mmResources:IsLoaded('c4')) then
		mmResources:SetLoaded('c4', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('c4'))
		fireData:MakeWritable()
		fireData.ammo.numberOfMagazines = 25
		fireData.ammo.autoReplenishDelay = 0.1
		fireData.ammo.ammoBagPickupDelayMultiplier = 0.1

		fireData.fireLogic.rateOfFire = 250.0
		print('Changed C4...')
	end

	if (mmResources:IsLoaded('c4expentity')) then
		mmResources:SetLoaded('c4expentity', false)

		local expEntityData = ExplosionPackEntityData(mmResources:GetInstance('c4expentity'))
		expEntityData:MakeWritable()
		expEntityData.health = 1
		expEntityData.maxCount = 25
		print('Changed C4 Entity...')
	end

	if (mmResources:IsLoaded('c4exp')) then
		mmResources:SetLoaded('c4exp', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('c4exp'))
		expData:MakeWritable()
		expData.blastDamage = 0
		expData.blastRadius = 4
		expData.blastImpulse = 90001
		expData.shockwaveDamage = 0.1
		expData.shockwaveRadius = 4
		expData.shockwaveImpulse = 90001
		expData.shockwaveTime = 0
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		print('Changed C4 Explosion...')
	end

	if (mmResources:IsLoaded('m15')) then
		mmResources:SetLoaded('m15', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('m15'))
		fireData:MakeWritable()
		fireData.ammo.numberOfMagazines = 8
		fireData.ammo.autoReplenishDelay = 0.1
		fireData.ammo.ammoBagPickupDelayMultiplier = 0.1

		fireData.fireLogic.rateOfFire = 250.0
		print('Changed M15 AT Mine...')
	end

	if (mmResources:IsLoaded('m15expentity')) then
		mmResources:SetLoaded('m15expentity', false)

		local expEntityData = ExplosionPackEntityData(mmResources:GetInstance('m15expentity'))
		expEntityData:MakeWritable()
		expEntityData.maxAttachableInclination = 180
		expEntityData.health = 1
		expEntityData.maxCount = 4
		print('Changed M15 AT Mine Entity...')
	end

	if (mmResources:IsLoaded('m15exp')) then
		mmResources:SetLoaded('m15exp', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('m15exp'))
		expData:MakeWritable()
		expData.blastDamage = 0
		expData.blastRadius = 4
		expData.blastImpulse = 900000
		expData.shockwaveDamage = 0.1
		expData.shockwaveRadius = 4
		expData.shockwaveImpulse = 900000
		expData.shockwaveTime = 0
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		print('Changed M15 AT Mine Explosion...')
	end

	if (mmResources:IsLoaded('jackhammer') and mmResources:IsLoaded('jackhammer2') and 
		mmResources:IsLoaded('jackhammer3') and mmResources:IsLoaded('jackhammer4')) then
		mmResources:SetLoaded('jackhammer', false)
		mmResources:SetLoaded('jackhammer2', false)
		mmResources:SetLoaded('jackhammer3', false)
		mmResources:SetLoaded('jackhammer4', false)

		local fireData = {
			FiringFunctionData(mmResources:GetInstance('jackhammer')),
			FiringFunctionData(mmResources:GetInstance('jackhammer2')),
			FiringFunctionData(mmResources:GetInstance('jackhammer3')),
			FiringFunctionData(mmResources:GetInstance('jackhammer4'))
		}

		for i=1, #fireData do
			fireData[i]:MakeWritable()
			fireData[i].shot.numberOfBulletsPerShell = 45

			fireData[i].fireLogic.recoil.maxRecoilAngleX = 90
	        fireData[i].fireLogic.recoil.minRecoilAngleX = -90
	        fireData[i].fireLogic.recoil.maxRecoilAngleY = 90
	        fireData[i].fireLogic.recoil.minRecoilAngleY = -90
	        fireData[i].fireLogic.recoil.maxRecoilAngleZ = 90
	        fireData[i].fireLogic.recoil.minRecoilAngleZ = -90
			fireData[i].fireLogic.rateOfFire = 500

			fireData[i].ammo.magazineCapacity = 45
			fireData[i].ammo.numberOfMagazines = 8
		end

		print('Changed Jackhammer...')
	end

	if (mmResources:IsLoaded('knoife')) then
		mmResources:SetLoaded('knoife', false)

		local meleeData = MeleeEntityCommonData(mmResources:GetInstance('knoife'))
		meleeData:MakeWritable()
		meleeData.meleeAttackDistance = 10.0
		meleeData.maxAttackHeightDifference = 10.0
		meleeData.invalidMeleeAttackZone = 1.0

		print('Changed Knoife (Knife)...')
	end

	if (mmResources:IsLoaded('famas')) then
		mmResources:SetLoaded('famas', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('famas'))
		fireData:MakeWritable()
		fireData.ammo.magazineCapacity = 1001
		fireData.shot.numberOfBulletsPerBurst = 25

		fireData.fireLogic.rateOfFire = 3500
		fireData.fireLogic.rateOfFireForBurst = 7500

		print('Changed Famas...')
	end
end

function MMWeapons:onShared_FamasRoF( player, args )
	local fireData = FiringFunctionData(mmResources:GetInstance('famas'))
	if (fireData ~= nil) then

		if (args[2] == nil) then
			args[2] = args[1]
		end

		fireData:MakeWritable()
		fireData.fireLogic.rateOfFire = tonumber(args[1])
		fireData.fireLogic.rateOfFireForBurst = tonumber(args[2])
		print('Changed Famas Rate of Fire, Regular: '..tostring(args[1])..' | Burst: '..tostring(args[2]))
	else
		print('Error: Famas not loaded')
	end
end

function MMWeapons:onShared_MinePower( player, args )
	local expData = VeniceExplosionEntityData(mmResources:GetInstance('m15exp'))
	if (expData ~= nil) then
		expData:MakeWritable()
		expData.blastImpulse = tonumber(args[1])
		expData.shockwaveImpulse = tonumber(args[1])
		print('Changed M15 AT Mine Blast Power: '..tostring(args[1]))
	else
		print('Error: M15 AT Mine not loaded')
	end
end

return MMWeapons()