class "MMWeapons"

function MMWeapons:Write(mmResources)

	if (mmResources:IsLoaded('ammobag')) then
		mmResources:SetLoaded('ammobag', false)

		local supplySphereData = SupplySphereEntityData(mmResources:GetInstance('ammobag'))
		supplySphereData:MakeWritable()
		supplySphereData.receivesExplosionDamage = false

		supplySphereData.supplyData.supplySoldiers = true
		supplySphereData.supplyData.supplyVehicles = true

		supplySphereData.supplyData.healing.radius = 100
		supplySphereData.supplyData.healing.supplyIncSpeed = 2
		supplySphereData.supplyData.healing.infiniteCapacity = true
		supplySphereData.supplyData.healing.supplyPointsRefillSpeed = 1
		supplySphereData.supplyData.healing.supplyPointsCapacity = 1

		supplySphereData.supplyData.ammo.radius = 100
		supplySphereData.supplyData.ammo.supplyIncSpeed = 2
		supplySphereData.supplyData.ammo.infiniteCapacity = true
		supplySphereData.supplyData.ammo.supplyPointsRefillSpeed = 1
		supplySphereData.supplyData.ammo.supplyPointsCapacity = 1

		print('Changed Ammobag...')
	end

	if (mmResources:IsLoaded('smaw') and mmResources:IsLoaded('magnum44')) then
		mmResources:SetLoaded('smaw', false)
		mmResources:SetLoaded('magnum44', false)
		-- swap magnum for smaw rocket
		local fireData = FiringFunctionData(mmResources:GetInstance('magnum44'))
		fireData:MakeWritable()
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(mmResources:GetInstance('smaw'))
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
		expEntityData.maxCount = 25
		print('Changed C4 Explosion Entity...')
	end

	if (mmResources:IsLoaded('c4exp')) then
		mmResources:SetLoaded('c4exp', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('c4exp'))
		expData:MakeWritable()
		expData.blastDamage = 0
		expData.blastRadius = 15
		expData.blastImpulse = 90001
		expData.shockwaveDamage = 0.1
		expData.shockwaveRadius = 15
		expData.shockwaveImpulse = 90001
		expData.shockwaveTime = 0
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		print('Changed C4 Explosion...')
	end
end

return MMWeapons()