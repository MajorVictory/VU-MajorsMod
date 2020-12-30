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

	if (mmResources:IsLoaded('smawmissile')) then
		mmResources:SetLoaded('smawmissile', false)

		local missileData = MissileEntityData(mmResources:GetInstance('smawmissile'))
		missileData:MakeWritable()
		missileData.maxSpeed = 750
		missileData.gravity = -9.8
		print('Changed SMAW Missile...')
	end

	if (mmResources:IsLoaded('smawmissile2') and mmResources:IsLoaded('magnum44')) then
		mmResources:SetLoaded('smawmissile2', false)
		mmResources:SetLoaded('magnum44', false)
		-- swap magnum for smaw rocket
		local fireData = FiringFunctionData(mmResources:GetInstance('magnum44'))
		fireData:MakeWritable()
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(mmResources:GetInstance('smawmissile2'))
		print('Changed Magnum .44 Projectile...')
	end

	if (mmResources:IsLoaded('p90') and mmResources:IsLoaded('a10_bullets')) then
		mmResources:SetLoaded('p90', false)
		mmResources:SetLoaded('a10_bullets', false)
		-- swap p90 for A10 bullets
		local fireData = FiringFunctionData(mmResources:GetInstance('p90'))
		fireData:MakeWritable()
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(mmResources:GetInstance('a10_bullets'))
		fireData.ammo.magazineCapacity = 500
		print('Changed P90 Projectile...')
	end

	if (mmResources:IsLoaded('m98')) then
		mmResources:SetLoaded('m98', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('m98'))
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 9001
		print('Changed M98 FireData...')
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
		fireData.ammo.numberOfMagazines = 4
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
		expEntityData.maxCount = 1
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

	if (mmResources:IsLoaded('jackhammer')) then
		mmResources:SetLoaded('jackhammer', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('jackhammer'))
		fireData:MakeWritable()
		fireData.shot.numberOfBulletsPerShell = 45

		fireData.fireLogic.recoil.maxRecoilAngleX = 90
        fireData.fireLogic.recoil.minRecoilAngleX = -90
        fireData.fireLogic.recoil.maxRecoilAngleY = 90
        fireData.fireLogic.recoil.minRecoilAngleY = -90
        fireData.fireLogic.recoil.maxRecoilAngleZ = 90
        fireData.fireLogic.recoil.minRecoilAngleZ = -90
		fireData.fireLogic.rateOfFire = 500

		fireData.ammo.magazineCapacity = 45
		fireData.ammo.numberOfMagazines = 8

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
end

return MMWeapons()