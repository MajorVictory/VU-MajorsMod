class "MMPlayers"

function MMPlayers:__init()
	Events:Subscribe('Level:Loaded', self, self.onLevelLoaded)
end

function MMPlayers:Write(mmResources)

	-- chat lag spike fix
	if (mmResources:IsLoaded('chat')) then
		mmResources:SetLoaded('chat', false)
		local chat = UIMessageCompData(mmResources:GetInstance('chat'))
		chat:MakeWritable()
		MessageInfo(chat.chatMessageInfo).messageQueueSize = 20
	end

	if (mmResources:IsLoaded('mpsoldierhpmodule')) then
		mmResources:SetLoaded('mpsoldierhpmodule', false)

		local playerHP = VeniceSoldierHealthModuleData(mmResources:GetInstance('mpsoldierhpmodule'))
		playerHP:MakeWritable()
		playerHP.timeForCorpse = 1
		playerHP.immortalTimeAfterSpawn = 0

		print('Changed Corpses...')
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
end

function MMPlayers:onLevelLoaded(levelName, gameMode)

	local slowSpeedGamemodes = {
		'SquadDeathMatch0',
		'TeamDeathMatch0',
		'TeamDeathMatchC0',
		'GunMaster0',
		'Scavenger0',
		'CaptureTheFlag0'
	}
	local gm = SharedUtils:GetCurrentGameMode()


	if (table.has(slowSpeedGamemodes, gm)) then

		local yump = mmResources:GetInstance('yump')
		if (yump ~= nil) then
			local playerYump = JumpStateData(yump)
			playerYump:MakeWritable()
			playerYump.jumpHeight = 6
			playerYump.jumpEffectSize = 5
			print('Changed Player Jump ('..gm..')...')
		end

		local pose_stand = mmResources:GetInstance('pose_stand')
		if (pose_stand ~= nil) then
			local poseStand = CharacterStatePoseInfo(pose_stand)
			poseStand:MakeWritable()
			poseStand.velocity = 4
			poseStand.sprintMultiplier = 3
			dprint('Changed Player Stand Pose ('..gm..')...')
		end

		local pose_standair = mmResources:GetInstance('pose_standair')
		if (pose_standair ~= nil) then
			local poseStandAir = CharacterStatePoseInfo(pose_standair)
			poseStandAir:MakeWritable()
			poseStandAir.velocity = 5
			poseStandAir.sprintMultiplier = 3.5
			dprint('Changed Player Stand Air Pose ('..gm..')...')
		end

		local pose_swimming = mmResources:GetInstance('pose_swimming')
		if (pose_swimming ~= nil) then
			local poseSwim = CharacterStatePoseInfo(pose_swimming)
			poseSwim:MakeWritable()
			poseSwim.velocity = 8
			dprint('Changed Player Swim Pose ('..gm..')...')
		end

		local pose_climbing = mmResources:GetInstance('pose_climbing')
		if (pose_climbing ~= nil) then
			local poseClimb = CharacterStatePoseInfo(pose_climbing)
			poseClimb:MakeWritable()
			poseClimb.velocity = 15
			poseClimb.sprintMultiplier = 2
			dprint('Changed Player Climb Pose ('..gm..')...')
		end

		local pose_chute = mmResources:GetInstance('pose_chute')
		if (pose_chute ~= nil) then
			local poseChute = CharacterStatePoseInfo(pose_chute)
			poseChute:MakeWritable()
			poseChute.velocity = 40
			dprint('Changed Player Parachute Pose ('..gm..')...')
		end
	end

	local kitSetups = {
		US = {
			Assault = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
			Engineer = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {
					'Weapons/RPG7/U_RPG7',
					'Weapons/Sa18IGLA/U_Sa18IGLA'
				},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
			Recon = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
			Support = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
		},
		RU = {
			Assault = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
			Engineer = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {
					'Weapons/FIM92A/U_FIM92',
					'Weapons/SMAW/U_SMAW'
				},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
			Recon = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
			Support = {
				ID_M_SOLDIER_PRIMARY = {},
				ID_M_SOLDIER_SECONDARY = {},
				ID_M_SOLDIER_GADGET1 = {},
				ID_WEAPON_CATEGORYGADGET1 = {},
				ID_M_SOLDIER_GADGET2 = {},
				GRENADE = {},
				KNIFE = {}
			},
		}
	}

	for teamName, team in pairs(kitSetups) do
		for kitName, kit in pairs(team) do
			if (kitName ~= '*') then
				local kitData = self:findKit(teamName, kitName, true)
				for i=1, #kitData do

					local unlockCategories = ebxEditUtils:GetWritableContainer(kitData[i][1], 'WeaponTable')
					local specialsDone = false
					local newUnlockCategories = {}

					for categoryId, weapons in pairs(kit) do

						local categoryIndex = self:CategoryIdToIndex(categoryId)
						local unlockCategory = unlockCategories.unlockParts[categoryIndex]
						unlockCategory:MakeWritable()

						for weapon=1, #weapons do
							unlockCategory.selectableUnlocks:add(ebxEditUtils:GetWritableInstance(weapons[weapon]))
							print('Adding ['..tostring(categoryId)..']: '..weapons[weapon])
						end
					end

					print('Changed Kit: '..teamName..' - '..kitName)
				end
			end
		end
	end
end

function MMPlayers:CategoryIdToIndex(categoryId)

	if (categoryId == 'ID_M_SOLDIER_PRIMARY') then
		return 1
	elseif (categoryId == 'ID_M_SOLDIER_SECONDARY') then
		return 2
	elseif (categoryId == 'ID_M_SOLDIER_GADGET1') then
		return 3
	elseif (categoryId == 'ID_WEAPON_CATEGORYGADGET1' or categoryId == 'GADGET1') then
		return 5
	elseif (categoryId == 'ID_M_SOLDIER_GADGET2') then
		return 6
	elseif (categoryId == 'GRENADE') then
		return 7
	elseif (categoryId == 'KNIFE') then
		return 8
	end
	return 4
end

-- Tries to find first available kit
-- @param teamName string Values: 'US', 'RU'
-- @param kitName string Values: 'Assault', 'Engineer', 'Support', 'Recon'
-- @param returnAll boolean returns all matches
function MMPlayers:findKit(teamName, kitName, returnAll)

    local gameModeKits = {
        '', -- Standard
        '_GM', --Gun Master on XP2 Maps
        '_GM_XP4', -- Gun Master on XP4 Maps
        '_XP4', -- Copy of Standard for XP4 Maps
        '_XP4_SCV' -- Scavenger on XP4 Maps
    }

    local matches = {}

    for kitType=1, #gameModeKits do
        local properKitName = string.lower(kitName)
        properKitName = properKitName:gsub("%a", string.upper, 1)

        local fullKitName = string.upper(teamName)..properKitName..gameModeKits[kitType]
        local kit = ResourceManager:SearchForDataContainer('Gameplay/Kits/'..fullKitName)
        if kit ~= nil  then
        	print('Found Kit: '..fullKitName)
            table.insert(matches, {kit, gameModeKits[kitType]})
            if (not returnAll) then
        		return {kit, gameModeKits[kitType]}
        	end
        end
    end

    return matches
end

return MMPlayers()