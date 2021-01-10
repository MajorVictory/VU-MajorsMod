class "MMPlayers"

function MMPlayers:Write(mmResources)

	-- chat lag spike fix
	if (mmResources:IsLoaded('chat')) then
		mmResources:SetLoaded('chat', false)
		local chat = UIMessageCompData(mmResources:GetInstance('chat'))
		chat:MakeWritable()
		MessageInfo(chat.chatMessageInfo).messageQueueSize = 20
	end

	if (mmResources:IsLoaded('playerphys')) then
		mmResources:SetLoaded('playerphys', false)

		local playerPhys = CharacterPhysicsData(mmResources:GetInstance('playerphys'))
		playerPhys:MakeWritable()
		playerPhys.jumpPenaltyTime = 0
		playerPhys.jumpPenaltyFactor = 0
		print('Changed Player Physics...')
	end

	if (mmResources:IsLoaded('yump')) then
		mmResources:SetLoaded('yump', false)

		local playerYump = JumpStateData(mmResources:GetInstance('yump'))
		playerYump:MakeWritable()
		playerYump.jumpHeight = 8
		playerYump.jumpEffectSize = 5
		print('Changed Player Jump...')
	end

	if (mmResources:IsLoaded('pose_stand') and
		mmResources:IsLoaded('pose_standair') and
		mmResources:IsLoaded('pose_swimming') and
		mmResources:IsLoaded('pose_climbing') and
		mmResources:IsLoaded('pose_chute')) then

		mmResources:SetLoaded('pose_stand', false)
		mmResources:SetLoaded('pose_standair', false)
		mmResources:SetLoaded('pose_swimming', false)
		mmResources:SetLoaded('pose_climbing', false)
		mmResources:SetLoaded('pose_chute', false)

		local poseStand = CharacterStatePoseInfo(mmResources:GetInstance('pose_stand'))
		poseStand:MakeWritable()
		poseStand.velocity = 8
		poseStand.sprintMultiplier = 5
		print('Changed Player Stand Pose...')

		local poseStandAir = CharacterStatePoseInfo(mmResources:GetInstance('pose_standair'))
		poseStandAir:MakeWritable()
		poseStandAir.velocity = 10
		poseStandAir.sprintMultiplier = 5
		print('Changed Player Stand Air Pose...')

		local poseSwim = CharacterStatePoseInfo(mmResources:GetInstance('pose_swimming'))
		poseSwim:MakeWritable()
		poseSwim.velocity = 40
		print('Changed Player Swim Pose...')

		local poseClimb = CharacterStatePoseInfo(mmResources:GetInstance('pose_climbing'))
		poseClimb:MakeWritable()
		poseClimb.velocity = 15
		poseClimb.sprintMultiplier = 2
		print('Changed Player Climb Pose...')

		local poseClimb = CharacterStatePoseInfo(mmResources:GetInstance('pose_chute'))
		poseClimb:MakeWritable()
		poseClimb.velocity = 40
		print('Changed Player Parachute Pose...')
	end

	if (mmResources:IsLoaded('kit_us_engineer')) then
		mmResources:SetLoaded('kit_us_engineer', false)

		local primaryUnlocks = CustomizationUnlockParts(mmResources:GetInstance('kit_us_engineer', 'Primary'))
		local secondaryUnlocks = CustomizationUnlockParts(mmResources:GetInstance('kit_us_engineer', 'Secondary'))
		local gadget1Unlocks = CustomizationUnlockParts(mmResources:GetInstance('kit_us_engineer', 'Gadget1'))
		local gadget2Unlocks = CustomizationUnlockParts(mmResources:GetInstance('kit_us_engineer', 'Gadget2'))
		local specialUnlocks = CustomizationUnlockParts(mmResources:GetInstance('kit_us_engineer', 'Special'))

		primaryUnlocks:MakeWritable()
		primaryUnlocks.selectableUnlocks:add(SoldierWeaponUnlockAsset(ResourceManager:SearchForDataContainer('Weapons/Model98B/U_M98B')))

		secondaryUnlocks:MakeWritable()
		secondaryUnlocks.selectableUnlocks:add(SoldierWeaponUnlockAsset(ResourceManager:SearchForDataContainer('Weapons/XP1_Jackhammer/U_Jackhammer')))

		gadget1Unlocks:MakeWritable()
		gadget1Unlocks.selectableUnlocks:add(SoldierWeaponUnlockAsset(ResourceManager:SearchForDataContainer('Weapons/Gadgets/Ammobag/U_Ammobag')))

		gadget2Unlocks:MakeWritable()
		gadget2Unlocks.selectableUnlocks:add(SoldierWeaponUnlockAsset(ResourceManager:SearchForDataContainer('Weapons/Gadgets/C4/U_C4')))

		specialUnlocks:MakeWritable()
		specialUnlocks.selectableUnlocks:add(SoldierWeaponUnlockAsset(ResourceManager:SearchForDataContainer('Weapons/Gadgets/M15/U_M15')))
		print('Changed US Engineer...')
	end
end

return MMPlayers()