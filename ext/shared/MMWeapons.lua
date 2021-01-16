class "MMWeapons"

function MMWeapons:Write(instance)

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

		dprint('Changed Ammobag...')
	end

	if (mmResources:IsLoaded('grenade')) then
		mmResources:SetLoaded('grenade', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('grenade'))
		fireData:MakeWritable()
		
		fireData.weaponDispersion.standDispersion.minAngle = 3.5
		fireData.weaponDispersion.standDispersion.maxAngle = 5
		fireData.weaponDispersion.standDispersion.increasePerShot = 0.8
		fireData.weaponDispersion.crouchDispersion.minAngle = 3.5
		fireData.weaponDispersion.crouchDispersion.maxAngle = 5
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 0.8
		fireData.weaponDispersion.proneDispersion.minAngle = 3.5
		fireData.weaponDispersion.proneDispersion.maxAngle = 5
		fireData.weaponDispersion.proneDispersion.increasePerShot = 0.8

		fireData.shot.initialSpeed.z = 15
		fireData.shot.numberOfBulletsPerShell = 10
		fireData.shot.numberOfBulletsPerShot = 10

		fireData.ammo.magazineCapacity = 1
		fireData.ammo.numberOfMagazines = 10
		fireData.ammo.ammoBagPickupDelayMultiplier = 10
		dprint('Changed M67 Grenade...')
	end

	if (mmResources:IsLoaded('grenadeent')) then
		mmResources:SetLoaded('grenadeent', false)

		local grenadeData = GrenadeEntityData(mmResources:GetInstance('grenadeent'))
		grenadeData:MakeWritable()

		grenadeData.transform.left.x = 4
		grenadeData.transform.up.y = 4
		grenadeData.transform.forward.z = 4

		grenadeData.timeToLive = 1
		grenadeData.gravity = -30
		dprint('Changed M67 Grenade Entity...')
	end

	if (mmResources:IsLoaded('grenadeexp')) then
		mmResources:SetLoaded('grenadeexp', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('grenadeexp'))
		expData:MakeWritable()
		expData.blastDamage = 133
		expData.blastRadius = 4
		expData.blastImpulse = 0
		expData.shockwaveDamage = 0.1
		expData.shockwaveRadius = 3
		expData.shockwaveImpulse = 0
		expData.shockwaveTime = 0
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		dprint('Changed M67 Grenade Explosion...')
	end

	if (mmResources:IsLoaded('gm_p90') and mmResources:IsLoaded('12gfrag')) then
		mmResources:SetLoaded('gm_p90', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/P90/P90_GM')
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 404)

		local bulletData = BulletEntityData(mmResources:GetInstance('12gfrag'))
		bulletData:MakeWritable()
		bulletData.gravity = -4.5
		bulletData.startDamage = 404
		bulletData.endDamage = 4004
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 100
		bulletData.timeToLive = 5
		bulletData.impactImpulse = 40000
		dprint('Changed 12G Frag Projectile...')

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(bulletData)
		fireData.ammo.magazineCapacity = 500
		dprint('Changed P90 (GM)...')
	end

	if (mmResources:IsLoaded('p90') and mmResources:IsLoaded('12gfrag')) then
		mmResources:SetLoaded('p90', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/P90/P90')
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 404)

		local bulletData = BulletEntityData(mmResources:GetInstance('12gfrag'))
		bulletData:MakeWritable()
		bulletData.gravity = -4.5
		bulletData.startDamage = 404
		bulletData.endDamage = 4004
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 100
		bulletData.timeToLive = 5
		bulletData.impactImpulse = 40000
		dprint('Changed 12G Frag Projectile...')

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(bulletData)
		fireData.ammo.magazineCapacity = 500
		dprint('Changed P90...')
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
		bulletData.startDamage = 100
		bulletData.endDamage = 9001
		bulletData.damageFalloffStartDistance = 25
		bulletData.damageFalloffEndDistance = 500
		bulletData.timeToLive = 15
		bulletData.impactImpulse = -50000
		dprint('Changed Crossbow Bolt HE Projectile...')

		fireData:MakeWritable()
		fireData.sound = SoundPatchAsset(mmResources:GetInstance('crossboltsound'))
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(bulletData)
		fireData.shot.initialSpeed.z = 45
		fireData.ammo.magazineCapacity = 20
		fireData.fireLogic.reloadTime = 3.7
		dprint('Changed M60...')
	end

	if (mmResources:IsLoaded('m98')) then
		mmResources:SetLoaded('m98', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('m98'))
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 9001
		dprint('Changed M98 FireData...')
	end

	if (mmResources:IsLoaded('bullet338')) then
		mmResources:SetLoaded('bullet338', false)

		local bulletData = BulletEntityData(mmResources:GetInstance('bullet338'))
		bulletData:MakeWritable()
		bulletData.timeToLive = 1.5
		bulletData.startDamage = 69420
		bulletData.endDamage = 69420
		bulletData.damageFalloffStartDistance = 9000
		bulletData.damageFalloffEndDistance = 9001
		dprint('Changed M98 Bullet...')
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
		dprint('Changed AEK Projectile...')
	end

	if (mmResources:IsLoaded('c4')) then
		mmResources:SetLoaded('c4', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('c4'))
		fireData:MakeWritable()
		fireData.ammo.numberOfMagazines = 25
		fireData.ammo.autoReplenishDelay = 0.1
		fireData.ammo.ammoBagPickupDelayMultiplier = 0.1

		fireData.fireLogic.rateOfFire = 250.0
		dprint('Changed C4...')
	end

	if (mmResources:IsLoaded('c4expentity')) then
		mmResources:SetLoaded('c4expentity', false)

		local expEntityData = ExplosionPackEntityData(mmResources:GetInstance('c4expentity'))
		expEntityData:MakeWritable()
		expEntityData.health = 1
		expEntityData.maxCount = 25
		dprint('Changed C4 Entity...')
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
		dprint('Changed C4 Explosion...')
	end

	if (mmResources:IsLoaded('m15')) then
		mmResources:SetLoaded('m15', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('m15'))
		fireData:MakeWritable()
		fireData.ammo.numberOfMagazines = 8
		fireData.ammo.autoReplenishDelay = 0.1
		fireData.ammo.ammoBagPickupDelayMultiplier = 0.1

		fireData.fireLogic.rateOfFire = 250.0
		dprint('Changed M15 AT Mine...')
	end

	if (mmResources:IsLoaded('m15expentity')) then
		mmResources:SetLoaded('m15expentity', false)

		local expEntityData = ExplosionPackEntityData(mmResources:GetInstance('m15expentity'))
		expEntityData:MakeWritable()
		expEntityData.maxAttachableInclination = 180
		expEntityData.health = 1
		expEntityData.maxCount = 4
		dprint('Changed M15 AT Mine Entity...')
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
		dprint('Changed M15 AT Mine Explosion...')
	end

	if (mmResources:IsLoaded('knoife')) then
		mmResources:SetLoaded('knoife', false)

		local meleeData = MeleeEntityCommonData(mmResources:GetInstance('knoife'))
		meleeData:MakeWritable()
		meleeData.meleeAttackDistance = 10
		meleeData.maxAttackHeightDifference = 100
		meleeData.invalidMeleeAttackZone = 0

		dprint('Changed Knoife (Knife)...')
	end

	if (mmResources:IsLoaded('famas')) then
		mmResources:SetLoaded('famas', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('famas'))
		fireData:MakeWritable()
		fireData.ammo.magazineCapacity = 1001
		fireData.shot.numberOfBulletsPerBurst = 25
		fireData.fireLogic.rateOfFire = 3500
		fireData.fireLogic.rateOfFireForBurst = 7500

		dprint('Changed Famas...')
	end

	if (mmResources:IsLoaded('mp443')) then
		mmResources:SetLoaded('mp443', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/MP443/MP443')
		local fireData = ebxEditUtils:GetWritableContainer(weaponBP, 'Object.WeaponFiring.PrimaryFire')
		local bulletData = ebxEditUtils:GetWritableContainer(weaponBP, 'Object.WeaponFiring.PrimaryFire.shot.projectileData')

		self:OverrideGMMagSize(SoldierWeaponData(weaponBP.object), 420)

		fireData.weaponDispersion.standDispersion.minAngle = 3
		fireData.weaponDispersion.standDispersion.maxAngle = 3
		fireData.weaponDispersion.standDispersion.increasePerShot = 5
		fireData.weaponDispersion.crouchDispersion.minAngle = 2.5
		fireData.weaponDispersion.crouchDispersion.maxAngle = 2.5
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 5
		fireData.weaponDispersion.proneDispersion.minAngle = 1.5
		fireData.weaponDispersion.proneDispersion.maxAngle = 1.5
		fireData.weaponDispersion.proneDispersion.increasePerShot = 5

		fireData.shot.initialSpeed.z = 450
		fireData.shot.numberOfBulletsPerShell = 5
		fireData.fireLogic.rateOfFire = 900
		fireData.ammo.magazineCapacity = 420
		fireData.ammo.numberOfMagazines = -1
		
		bulletData.gravity = -9.8
		bulletData.startDamage = 250
		bulletData.endDamage = 600
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 20
		dprint('Changed Mp443...')
	end

	if (mmResources:IsLoaded('gm_mp443')) then
		mmResources:SetLoaded('gm_mp443', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/MP443/MP443_GM')
		local fireData = ebxEditUtils:GetWritableContainer(weaponBP, 'Object.WeaponFiring.PrimaryFire')
		local bulletData = ebxEditUtils:GetWritableContainer(weaponBP, 'Object.WeaponFiring.PrimaryFire.shot.projectileData')

		self:OverrideGMMagSize(SoldierWeaponData(weaponBP.object), 420)

		fireData.weaponDispersion.standDispersion.minAngle = 3
		fireData.weaponDispersion.standDispersion.maxAngle = 3
		fireData.weaponDispersion.standDispersion.increasePerShot = 5
		fireData.weaponDispersion.crouchDispersion.minAngle = 2.5
		fireData.weaponDispersion.crouchDispersion.maxAngle = 2.5
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 5
		fireData.weaponDispersion.proneDispersion.minAngle = 1.5
		fireData.weaponDispersion.proneDispersion.maxAngle = 1.5
		fireData.weaponDispersion.proneDispersion.increasePerShot = 5

		fireData.shot.initialSpeed.z = 450
		fireData.shot.numberOfBulletsPerShell = 5
		fireData.fireLogic.rateOfFire = 900
		fireData.ammo.magazineCapacity = 420
		fireData.ammo.numberOfMagazines = -1
		
		bulletData.gravity = -9.8
		bulletData.startDamage = 250
		bulletData.endDamage = 600
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 20
		dprint('Changed Mp443 (GM)...')
	end

	if (mmResources:IsLoaded('m93r') and mmResources:IsLoaded('m93rbullet')) then
		mmResources:SetLoaded('m93r', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/M93R/M93R')
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 5)

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 380
		fireData.shot.numberOfBulletsPerBurst = 5
		fireData.fireLogic.rateOfFire = 900
		fireData.ammo.magazineCapacity = 5
		fireData.ammo.numberOfMagazines = -1
		
		local bulletData = BulletEntityData(mmResources:GetInstance('m93rbullet'))
		bulletData:MakeWritable()
		bulletData.gravity = -9.8
		bulletData.startDamage = 2323
		bulletData.endDamage = 2323
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 1
		dprint('Changed M93r...')
	end

	if (mmResources:IsLoaded('gm_m93r') and mmResources:IsLoaded('m93rbullet')) then
		mmResources:SetLoaded('gm_m93r', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/M93R/M93R_GM')
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 5)

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 380
		fireData.shot.numberOfBulletsPerBurst = 5
		fireData.fireLogic.rateOfFire = 900
		fireData.ammo.magazineCapacity = 5
		fireData.ammo.numberOfMagazines = -1
		
		local bulletData = BulletEntityData(mmResources:GetInstance('m93rbullet'))
		bulletData:MakeWritable()
		bulletData.gravity = -9.8
		bulletData.startDamage = 2323
		bulletData.endDamage = 2323
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 1
		dprint('Changed M93r (GM)...')
	end

	if (mmResources:IsLoaded('smaw')) then
		mmResources:SetLoaded('smaw', false)

		local fireData = FiringFunctionData(mmResources:GetInstance('smaw'))
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 250
		dprint('Changed SMAW...')
	end

	if (mmResources:IsLoaded('gm_magnum44') and mmResources:IsLoaded('smawmissile')) then
		mmResources:SetLoaded('gm_magnum44', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/Taurus44/Taurus44_GM')
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 1)

		local missileData = MissileEntityData(mmResources:GetInstance('smawmissile'))
		missileData:MakeWritable()
		missileData.maxSpeed = 750
		missileData.gravity = -9.8
		missileData.damage = 5000
		dprint('Changed SMAW Missile...')

		-- swap magnum for smaw rocket
		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.ammo.magazineCapacity = 1
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(missileData)
		dprint('Changed Magnum .44 (GM)...')
	end

	if (mmResources:IsLoaded('magnum44') and mmResources:IsLoaded('smawmissile')) then
		mmResources:SetLoaded('magnum44', false)

		local weaponBP = ebxEditUtils:GetWritableInstance('Weapons/Taurus44/Taurus44')
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 1)

		local missileData = MissileEntityData(mmResources:GetInstance('smawmissile'))
		missileData:MakeWritable()
		missileData.maxSpeed = 750
		missileData.gravity = -9.8
		missileData.damage = 5000
		dprint('Changed SMAW Missile...')

		-- swap magnum for smaw rocket
		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.ammo.magazineCapacity = 1
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(missileData)
		dprint('Changed Magnum .44...')
	end

	if (mmResources:IsLoaded('magnum44scope')) then
		mmResources:SetLoaded('magnum44scope', false)

		local zoomData = WeaponZoomModifier(mmResources:GetInstance('magnum44scope'))
		zoomData:MakeWritable()
		zoomData.zoomRenderFov = 3.5
		dprint('Changed Magnum Scope Zoom...')
	end

	if (mmResources:IsLoaded('magnum44aim') and mmResources:IsLoaded('zoom20x')) then
		mmResources:SetLoaded('magnum44aim', false)
		mmResources:SetLoaded('zoom20x', false)

		local aimData = SoldierAimingSimulationData(mmResources:GetInstance('magnum44aim'))
		aimData:MakeWritable()
		aimData.zoomLevels[2] = ZoomLevelData(mmResources:GetInstance('zoom20x'))
		dprint('Changed Magnum Zoom Level...')
	end

	if (mmResources:IsLoaded('pp19') and mmResources:IsLoaded('pp19_bullet')) then
		mmResources:SetLoaded('pp19', false)
		mmResources:SetLoaded('pp19_bullet', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('pp19'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 420)

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 380
		fireData.fireLogic.rateOfFire = 1400
		fireData.ammo.magazineCapacity = 420
		fireData.ammo.numberOfMagazines = -1
		
		local bulletData = BulletEntityData(mmResources:GetInstance('pp19_bullet'))
		bulletData:MakeWritable()
		bulletData.gravity = -9.8
		bulletData.startDamage = 220
		bulletData.endDamage = 600
		bulletData.damageFalloffStartDistance = 25
		bulletData.damageFalloffEndDistance = 500
		dprint('Changed PP-19 Bizon...')
	end

	if (mmResources:IsLoaded('spas12')) then
		mmResources:SetLoaded('spas12', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('spas12'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 1)

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 380
		fireData.shot.numberOfBulletsPerShell = 250

		fireData.fireLogic.rateOfFire = 100
		fireData.fireLogic.recoil.maxRecoilAngleX = -45
	    fireData.fireLogic.recoil.minRecoilAngleX = -45
	    fireData.fireLogic.recoil.maxRecoilAngleY = 45
	    fireData.fireLogic.recoil.minRecoilAngleY = 45
	    fireData.fireLogic.recoil.maxRecoilAngleZ = 45
	    fireData.fireLogic.recoil.minRecoilAngleZ = 45

		fireData.ammo.magazineCapacity = 1
		fireData.ammo.numberOfMagazines = -1

		fireData.weaponDispersion.standDispersion.minAngle = 20
		fireData.weaponDispersion.standDispersion.maxAngle = 20
		fireData.weaponDispersion.standDispersion.increasePerShot = 100
		fireData.weaponDispersion.crouchDispersion.minAngle = 10
		fireData.weaponDispersion.crouchDispersion.maxAngle = 10
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 100
		fireData.weaponDispersion.proneDispersion.minAngle = 1.5
		fireData.weaponDispersion.proneDispersion.maxAngle = 1.5
		fireData.weaponDispersion.proneDispersion.increasePerShot = 100
		
		local bulletData = BulletEntityData(fireData.shot.projectileData)
		bulletData:MakeWritable()
		bulletData.gravity = -9.8
		bulletData.startDamage = 100
		bulletData.endDamage = 500
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 50
		dprint('Changed Spas-12...')
	end

	if (mmResources:IsLoaded('jackhammer')) then
		mmResources:SetLoaded('jackhammer', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('jackhammer'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 87)

		local fireData = {
			FiringFunctionData(mmResources:GetInstance('jackhammer', 'FireFunction1')),
			FiringFunctionData(mmResources:GetInstance('jackhammer', 'FireFunction2')),
			FiringFunctionData(mmResources:GetInstance('jackhammer', 'FireFunction3')),
			FiringFunctionData(mmResources:GetInstance('jackhammer', 'FireFunction4'))
		}

		for i=1, #fireData do
			fireData[i]:MakeWritable()
			fireData[i].fireLogic.recoil.maxRecoilAngleX = -25
	        fireData[i].fireLogic.recoil.minRecoilAngleX = -25
	        fireData[i].fireLogic.recoil.maxRecoilAngleY = 25
	        fireData[i].fireLogic.recoil.minRecoilAngleY = 25
	        fireData[i].fireLogic.recoil.maxRecoilAngleZ = 0
	        fireData[i].fireLogic.recoil.minRecoilAngleZ = 0
			fireData[i].fireLogic.rateOfFire = 600

			fireData[i].ammo.magazineCapacity = 87
			fireData[i].ammo.numberOfMagazines = 8
		end

		fireData[1].shot.numberOfBulletsPerShell = 60 -- pellets
		fireData[2].shot.numberOfBulletsPerShell = 60 -- flechets
		fireData[3].shot.numberOfBulletsPerShell = 10 -- frags
		fireData[4].shot.numberOfBulletsPerShell = 10 -- slugs

		dprint('Changed Jackhammer...')
	end

	if (mmResources:IsLoaded('acwr') and mmResources:IsLoaded('acwrbullets')) then
		mmResources:SetLoaded('acwr', false)
		mmResources:SetLoaded('acwrbullets', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('acwr'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 9001)

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 380
		fireData.shot.numberOfBulletsPerShell = 1
		fireData.fireLogic.rateOfFire = 1200
		fireData.ammo.magazineCapacity = 9001
		fireData.ammo.numberOfMagazines = -1
		
		local bulletData = BulletEntityData(mmResources:GetInstance('acwrbullets'))
		bulletData:MakeWritable()
		bulletData.gravity = -9.8
		bulletData.startDamage = 100
		bulletData.endDamage = 1000
		bulletData.damageFalloffStartDistance = 0
		bulletData.damageFalloffEndDistance = 25
		dprint('Changed ACW-R...')
	end

	if (mmResources:IsLoaded('mtar') and mmResources:IsLoaded('40mmlvg_grenade') and mmResources:IsLoaded('40mmlvgsound')) then
		mmResources:SetLoaded('mtar', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('mtar'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 5)

		local grenadeData = GrenadeEntityData(mmResources:GetInstance('40mmlvg_grenade'))
		grenadeData:MakeWritable()
		grenadeData.gravity = -30
		grenadeData.timeToLive = 1

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.weaponDispersion.standDispersion.minAngle = 15
		fireData.weaponDispersion.standDispersion.maxAngle = 15
		fireData.weaponDispersion.standDispersion.increasePerShot = 100
		fireData.weaponDispersion.crouchDispersion.minAngle = 8
		fireData.weaponDispersion.crouchDispersion.maxAngle = 8
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 100
		fireData.weaponDispersion.proneDispersion.minAngle = 5
		fireData.weaponDispersion.proneDispersion.maxAngle = 5
		fireData.weaponDispersion.proneDispersion.increasePerShot = 100

		fireData.shot.initialSpeed.z = 45
		fireData.shot.numberOfBulletsPerShell = 5
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(grenadeData)

		fireData.sound = SoundPatchAsset(mmResources:GetInstance('40mmlvgsound'))

		fireData.fireLogic.rateOfFire = 250

		fireData.ammo.magazineCapacity = 5
		fireData.ammo.numberOfMagazines = -1
		dprint('Changed MTAR...')
	end

	if (mmResources:IsLoaded('40mmlvg_grenadeexp')) then
		mmResources:SetLoaded('40mmlvg_grenadeexp', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('40mmlvg_grenadeexp'))
		expData:MakeWritable()
		expData.blastDamage = 888
		expData.blastRadius = 8
		expData.blastImpulse = 0
		expData.shockwaveDamage = 12
		expData.shockwaveRadius = 3
		expData.shockwaveImpulse = 0
		expData.shockwaveTime = 0.15
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		dprint('Changed 40mm Grenade Explosion...')
	end

	if (mmResources:IsLoaded('aug') and mmResources:IsLoaded('augbullet')) then
		mmResources:SetLoaded('aug', false)
		mmResources:SetLoaded('augbullet', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('aug'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 10)

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 900
		fireData.shot.numberOfBulletsPerBurst = 4

		fireData.ammo.magazineCapacity = 17
		fireData.ammo.numberOfMagazines = -1

		fireData.fireLogic.rateOfFire = 400
		fireData.fireLogic.rateOfFireForBurst = 900
		fireData.fireLogic.recoil.maxRecoilAngleX = -45
	    fireData.fireLogic.recoil.minRecoilAngleX = -45
	    fireData.fireLogic.recoil.maxRecoilAngleY = 90
	    fireData.fireLogic.recoil.minRecoilAngleY = -90
	    fireData.fireLogic.recoil.maxRecoilAngleZ = 0
	    fireData.fireLogic.recoil.minRecoilAngleZ = 0

		fireData.weaponDispersion.standDispersion.minAngle = 3.5
		fireData.weaponDispersion.standDispersion.maxAngle = 5
		fireData.weaponDispersion.standDispersion.increasePerShot = 0.8
		fireData.weaponDispersion.crouchDispersion.minAngle = 3
		fireData.weaponDispersion.crouchDispersion.maxAngle = 4.5
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 0.8
		fireData.weaponDispersion.proneDispersion.minAngle = 2.5
		fireData.weaponDispersion.proneDispersion.maxAngle = 4
		fireData.weaponDispersion.proneDispersion.increasePerShot = 0.8
		
		local bulletData = BulletEntityData(mmResources:GetInstance('augbullet'))
		bulletData:MakeWritable()
		bulletData.gravity = -9.8
		bulletData.startDamage = 6969
		bulletData.endDamage = 0
		bulletData.damageFalloffStartDistance = 2
		bulletData.damageFalloffEndDistance = 100
		dprint('Changed Steyr Aug...')
	end

	if (mmResources:IsLoaded('scarl') and mmResources:IsLoaded('claymore') and mmResources:IsLoaded('40mmlvgsound')) then
		mmResources:SetLoaded('scarl', false)
		mmResources:SetLoaded('claymore', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('scarl'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 5)

		local claymoreData = ExplosionPackEntityData(mmResources:GetInstance('claymore'))
		claymoreData:MakeWritable()
		claymoreData.maxAttachableInclination = 360
		claymoreData.timeToLive = 10
		claymoreData.maxCount = 25

		claymoreData.soldierDetonationData.useAngle = false
		claymoreData.soldierDetonationData.radius = 2
		claymoreData.soldierDetonationData.soldierDetonationActivationDelay = 1
		claymoreData.soldierDetonationData.minSpeedForActivation = 0

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.weaponDispersion.standDispersion.minAngle = 25
		fireData.weaponDispersion.standDispersion.maxAngle = 25
		fireData.weaponDispersion.standDispersion.increasePerShot = 100
		fireData.weaponDispersion.crouchDispersion.minAngle = 15
		fireData.weaponDispersion.crouchDispersion.maxAngle = 15
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 100
		fireData.weaponDispersion.proneDispersion.minAngle = 5
		fireData.weaponDispersion.proneDispersion.maxAngle = 5
		fireData.weaponDispersion.proneDispersion.increasePerShot = 100

		fireData.shot.initialSpeed.z = 18
		fireData.shot.numberOfBulletsPerShell = 5
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = claymoreData

		fireData.sound = SoundPatchAsset(mmResources:GetInstance('40mmlvgsound'))

		fireData.fireLogic.rateOfFire = 250

		fireData.ammo.magazineCapacity = 5
		fireData.ammo.numberOfMagazines = -1
		dprint('Changed MTAR...')
	end

	if (mmResources:IsLoaded('claymoreexp')) then
		mmResources:SetLoaded('claymoreexp', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('claymoreexp'))
		expData:MakeWritable()
		expData.blastDamage = 2100
		expData.blastRadius = 3
		expData.blastImpulse = 1987
		expData.shockwaveDamage = 10
		expData.shockwaveRadius = 5
		expData.shockwaveImpulse = 1987
		expData.shockwaveTime = 0.15
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		dprint('Changed Claymore Explosion...')
	end

	if (mmResources:IsLoaded('lsat') and mmResources:IsLoaded('40mmlvg_grenade') and mmResources:IsLoaded('40mmlvgsound')) then
		mmResources:SetLoaded('lsat', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('lsat'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 20)

		local bulletData = GrenadeEntityData(mmResources:GetInstance('40mmlvg_grenade'))
		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()

		fireData.sound = SoundPatchAsset(mmResources:GetInstance('40mmlvgsound'))

		fireData.ammo.magazineCapacity = 20
		fireData.ammo.numberOfMagazines = -1

		fireData.shot.projectileData:MakeWritable()
		fireData.shot.initialSpeed.z = 100
		fireData.shot.projectileData = ProjectileEntityData(bulletData)

		dprint('Changed LSAT...')
	end

	if (mmResources:IsLoaded('l86') and mmResources:IsLoaded('l86bulletmod') and mmResources:IsLoaded('sniperbullet')) then
		mmResources:SetLoaded('l86', false)
		mmResources:SetLoaded('l86bulletmod', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('l86'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 420)

		local bulletData = BulletEntityData(mmResources:GetInstance('sniperbullet'))
		bulletData:MakeWritable()
		bulletData.gravity = 0
		bulletData.startDamage = 250
		bulletData.endDamage = 1000
		bulletData.damageFalloffStartDistance = 2
		bulletData.damageFalloffEndDistance = 20
		dprint('Changed 762 Sniper Bullet...')

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()

		fireData.ammo.magazineCapacity = 420
		fireData.ammo.numberOfMagazines = -1

		fireData.fireLogic.rateOfFire = 2500

		fireData.weaponDispersion.standDispersion.minAngle = 0
		fireData.weaponDispersion.standDispersion.maxAngle = 0
		fireData.weaponDispersion.standDispersion.increasePerShot = 0
		fireData.weaponDispersion.crouchDispersion.minAngle = 0
		fireData.weaponDispersion.crouchDispersion.maxAngle = 0
		fireData.weaponDispersion.crouchDispersion.increasePerShot = 0
		fireData.weaponDispersion.proneDispersion.minAngle = 0
		fireData.weaponDispersion.proneDispersion.maxAngle = 0
		fireData.weaponDispersion.proneDispersion.increasePerShot = 0

		local projectileMod = WeaponProjectileModifier(mmResources:GetInstance('l86bulletmod'))
		projectileMod:MakeWritable()
		projectileMod.projectileData:MakeWritable()
		projectileMod.projectileData = ProjectileEntityData(bulletData)

		dprint('Changed L86...')
	end

	if (mmResources:IsLoaded('hk417') and mmResources:IsLoaded('sniperbullet')) then
		mmResources:SetLoaded('hk417', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('hk417'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 6969)

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()

		fireData.fireLogic.rateOfFire = 900
		fireData.ammo.magazineCapacity = 6969
		fireData.ammo.numberOfMagazines = -1

		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(BulletEntityData(mmResources:GetInstance('sniperbullet')))

		dprint('Changed M417...')
	end

	if (mmResources:IsLoaded('jng90') and mmResources:IsLoaded('mortar')) then
		mmResources:SetLoaded('jng90', false)
		mmResources:SetLoaded('mortar', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('jng90'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 2)

		local bulletData = MissileEntityData(mmResources:GetInstance('mortar'))
		bulletData:MakeWritable()
		bulletData.damage = 80085
		bulletData.maxCount = 5
		bulletData.impactImpulse = 40000
		dprint('Changed Mortar Projectile...')

		local fireData = FiringFunctionData(weaponData.weaponFiring.primaryFire)
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 250
		fireData.shot.projectileData:MakeWritable()
		fireData.shot.projectileData = ProjectileEntityData(bulletData)
		fireData.ammo.magazineCapacity = 2
		dprint('Changed JNG-90...')
	end

	if (mmResources:IsLoaded('mortarexp')) then
		mmResources:SetLoaded('mortarexp', false)

		local expData = VeniceExplosionEntityData(mmResources:GetInstance('mortarexp'))
		expData:MakeWritable()
		expData.blastDamage = 10000
		expData.blastRadius = 25
		expData.blastImpulse = 5000
		expData.shockwaveDamage = 10000
		expData.shockwaveRadius = 25
		expData.shockwaveImpulse = 5000
		expData.shockwaveTime = 0.1
		expData.triggerImpairedHearing = false
		expData.isCausingSuppression = false
		dprint('Changed Mortar Explosion...')
	end

	if (mmResources:IsLoaded('40mmlvg') and mmResources:IsLoaded('40mmlvgfire')) then
		mmResources:SetLoaded('40mmlvg', false)
		mmResources:SetLoaded('40mmlvgfire', false)

		local weaponBP = SoldierWeaponBlueprint(mmResources:GetInstance('40mmlvg'))
		local weaponData = SoldierWeaponData(weaponBP.object)

		self:OverrideGMMagSize(weaponData, 1)

		local fireData = FiringFunctionData(mmResources:GetInstance('40mmlvgfire'))
		fireData:MakeWritable()
		fireData.shot.initialSpeed.z = 100
		fireData.shot.numberOfBulletsPerShell = 30
		fireData.ammo.magazineCapacity = 1
		dprint('Changed 40MM LVG Launcher...')
	end
end

-- specific to GunMaster only
Events:Subscribe('Level:Loaded', function()

	if (mmResources:IsLoaded('smawmissile')) then
		mmResources:SetLoaded('smawmissile', false)
	end
	if (mmResources:IsLoaded('12gfrag')) then
		mmResources:SetLoaded('12gfrag', false)
	end
	if (mmResources:IsLoaded('m93rbullet')) then
		mmResources:SetLoaded('m93rbullet', false)
	end
	if (mmResources:IsLoaded('40mmlvg_grenade')) then
		mmResources:SetLoaded('40mmlvg_grenade', false)
	end
	if (mmResources:IsLoaded('40mmlvgsound')) then
		mmResources:SetLoaded('40mmlvgsound', false)
	end
	if (mmResources:IsLoaded('sniperbullet')) then
		mmResources:SetLoaded('sniperbullet', false)
	end

	if (SharedUtils:GetCurrentGameMode() == 'GunMaster0') then

		local yump = mmResources:GetInstance('yump')
		if (yump ~= nil) then
			local playerYump = JumpStateData(yump)
			playerYump:MakeWritable()
			playerYump.jumpHeight = 6
			playerYump.jumpEffectSize = 5
			print('Changed Player Jump (GM)...')
		end

		local pose_stand = mmResources:GetInstance('pose_stand')
		if (pose_stand ~= nil) then
			local poseStand = CharacterStatePoseInfo(pose_stand)
			poseStand:MakeWritable()
			poseStand.velocity = 4
			poseStand.sprintMultiplier = 3
			dprint('Changed Player Stand Pose (GM)...')
		end

		local pose_standair = mmResources:GetInstance('pose_standair')
		if (pose_standair ~= nil) then
			local poseStandAir = CharacterStatePoseInfo(pose_standair)
			poseStandAir:MakeWritable()
			poseStandAir.velocity = 5
			poseStandAir.sprintMultiplier = 3.5
			dprint('Changed Player Stand Air Pose (GM)...')
		end

		local pose_swimming = mmResources:GetInstance('pose_swimming')
		if (pose_swimming ~= nil) then
			local poseSwim = CharacterStatePoseInfo(pose_swimming)
			poseSwim:MakeWritable()
			poseSwim.velocity = 8
			dprint('Changed Player Swim Pose (GM)...')
		end

		local pose_climbing = mmResources:GetInstance('pose_climbing')
		if (pose_climbing ~= nil) then
			local poseClimb = CharacterStatePoseInfo(pose_climbing)
			poseClimb:MakeWritable()
			poseClimb.velocity = 15
			poseClimb.sprintMultiplier = 2
			dprint('Changed Player Climb Pose (GM)...')
		end

		local pose_chute = mmResources:GetInstance('pose_chute')
		if (pose_chute ~= nil) then
			local poseChute = CharacterStatePoseInfo(pose_chute)
			poseChute:MakeWritable()
			poseChute.velocity = 40
			dprint('Changed Player Parachute Pose (GM)...')
		end

		local knoife = mmResources:GetInstance('knoife')
		if (knoife ~= nil) then
			local meleeData = MeleeEntityCommonData(knoife)
			meleeData:MakeWritable()
			meleeData.meleeAttackDistance = 2
			meleeData.maxAttackHeightDifference = 2
			meleeData.invalidMeleeAttackZone = 5
			dprint('Changed Knoife (Knife) (GM)...')
		end
	end
end)


function MMWeapons:OverrideGMMagSize(weaponData, newMagSize)

	if (weaponData == nil or weaponData.weaponModifierData == nil or #weaponData.weaponModifierData == 0) then
		return
	end

	for i=1, #weaponData.weaponModifierData do
		local weaponModData = WeaponModifierData(weaponData.weaponModifierData[i])
		if (weaponModData.unlockAsset:Is('UnlockAsset')) then
			local unlockAsset = UnlockAsset(weaponModData.unlockAsset)
			if (unlockAsset.name == 'Gameplay/XP2/GM_Deploytime') then
				for j=1, #weaponModData.modifiers do
					local unlockMod = weaponModData.modifiers[j]
					if (unlockMod:Is('WeaponMagazineModifier')) then
						local magMod = WeaponMagazineModifier(unlockMod)
						magMod:MakeWritable()
						magMod.magazineCapacity = newMagSize
					end
				end
			end
		end
	end
end

function MMWeapons:SetGMLevelKills(gmKillCounterInstance)

	local gmCounterData = GunMasterKillCounterEntityData(gmKillCounterInstance)
	gmCounterData:MakeWritable()

	local gmPreset_Normal = gmCounterData.weaponsPreset[1].gunMasterLevelInfos
	local gmPreset_NormalReversed = gmCounterData.weaponsPreset[2].gunMasterLevelInfos
	local gmPreset_LightWeight = gmCounterData.weaponsPreset[3].gunMasterLevelInfos
	local gmPreset_HeavyGear = gmCounterData.weaponsPreset[4].gunMasterLevelInfos
	local gmPreset_PistolRun = gmCounterData.weaponsPreset[5].gunMasterLevelInfos
	local gmPreset_SnipersDelight = gmCounterData.weaponsPreset[6].gunMasterLevelInfos
	local gmPreset_USArmsRace = gmCounterData.weaponsPreset[7].gunMasterLevelInfos
	local gmPreset_RUArmsRace = gmCounterData.weaponsPreset[8].gunMasterLevelInfos
	local gmPreset_EUArmsRace = gmCounterData.weaponsPreset[9].gunMasterLevelInfos

	gmPreset_Normal[1].killsNeeded = 1 	-- GM_MP443
	gmPreset_Normal[2].killsNeeded = 2 	-- GM_M93
	gmPreset_Normal[3].killsNeeded = 3 	-- GM_T44
	gmPreset_Normal[4].killsNeeded = 2 	-- GM_PP
	gmPreset_Normal[5].killsNeeded = 2 	-- GM_P90
	gmPreset_Normal[6].killsNeeded = 4 	-- GM_SPAS
	gmPreset_Normal[7].killsNeeded = 1 	-- GM_Jackhammer
	gmPreset_Normal[8].killsNeeded = 2 	-- GM_ACR
	gmPreset_Normal[9].killsNeeded = 3 	-- GM_MTAR
	gmPreset_Normal[10].killsNeeded = 2	-- GM_AUG
	gmPreset_Normal[11].killsNeeded = 2	-- GM_SCAR
	gmPreset_Normal[12].killsNeeded = 2	-- GM_LSAT
	gmPreset_Normal[13].killsNeeded = 2	-- GM_L86
	gmPreset_Normal[14].killsNeeded = 2	-- GM_M417
	gmPreset_Normal[15].killsNeeded = 2	-- GM_JNG90
	gmPreset_Normal[16].killsNeeded = 2	-- GM_M320
	gmPreset_Normal[17].killsNeeded = 2	-- GM_Knife

	gmPreset_NormalReversed[1].killsNeeded = 2 	-- GM_JNG90
	gmPreset_NormalReversed[2].killsNeeded = 2 	-- GM_M417
	gmPreset_NormalReversed[3].killsNeeded = 2 	-- GM_L86
	gmPreset_NormalReversed[4].killsNeeded = 2 	-- GM_LSAT
	gmPreset_NormalReversed[5].killsNeeded = 2 	-- GM_SCAR
	gmPreset_NormalReversed[6].killsNeeded = 2 	-- GM_AUG
	gmPreset_NormalReversed[7].killsNeeded = 3 	-- GM_MTAR
	gmPreset_NormalReversed[8].killsNeeded = 2 	-- GM_ACR
	gmPreset_NormalReversed[9].killsNeeded = 1 	-- GM_Jackhammer
	gmPreset_NormalReversed[10].killsNeeded = 4	-- GM_SPAS
	gmPreset_NormalReversed[11].killsNeeded = 2	-- GM_P90
	gmPreset_NormalReversed[12].killsNeeded = 2	-- GM_PP
	gmPreset_NormalReversed[13].killsNeeded = 3	-- GM_T44
	gmPreset_NormalReversed[14].killsNeeded = 2	-- GM_M93
	gmPreset_NormalReversed[15].killsNeeded = 1	-- GM_MP443
	gmPreset_NormalReversed[16].killsNeeded = 2	-- GM_M320
	gmPreset_NormalReversed[17].killsNeeded = 2	-- GM_Knife

end

return MMWeapons()