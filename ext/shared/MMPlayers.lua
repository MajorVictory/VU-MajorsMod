class "MMPlayers"

function MMPlayers:Write(mmResources)
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
		playerYump.jumpHeight = 5
		playerYump.jumpEffectSize = 1.5
		print('Changed Player Jump...')
	end

	if (mmResources:IsLoaded('pose_stand') and mmResources:IsLoaded('pose_standair')) then
		mmResources:SetLoaded('pose_stand', false)
		mmResources:SetLoaded('pose_standair', false)

		local poseInfo = CharacterStatePoseInfo(mmResources:GetInstance('pose_stand'))
		poseInfo:MakeWritable()
		poseInfo.velocity = 10
		poseInfo.sprintMultiplier = 4
		print('Changed Player Stand Pose...')

		local poseInfoAir = CharacterStatePoseInfo(mmResources:GetInstance('pose_standair'))
		poseInfoAir:MakeWritable()
		poseInfoAir.velocity = 8
		poseInfoAir.sprintMultiplier = 5
		print('Changed Player Stand Air Pose...')
	end
end

return MMPlayers()