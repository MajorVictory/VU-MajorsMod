class 'MMLevel_BandarDesert'


function MMLevel_BandarDesert:__init()
    print("Waiting for XP3_Desert...")
    self.mapPartition = Guid('CC4B754F-DC2D-11DF-B4FF-DE2D36FBFBF4', 'D') --Guid('4CA1C116-7FA3-4163-A17E-325ACD02FD4F', 'D')
    self.mapRegistryContainerGuid = Guid('958A27B8-F6B4-AE8C-4AE8-1FC8E2AB60BF', 'D') --Guid('273AC4A3-21D1-3D7E-B740-9387A30E1AF7', 'D') --XP3_Desert/ConquestLarge0
    self.replaced = true
    self.loaded = false

    Events:Subscribe('Level:RegisterEntityResources', self.onRegisterEntityResources)
    Events:Subscribe('Partition:Loaded', self, self.OnPartitionLoaded)
    Events:Subscribe('Level:LoadResources', self, self.OnLoadResources)
end

function MMLevel_BandarDesert:onRegisterEntityResources(levelData)

    --local container = mmResources:CreateRegistryContainer()
    --ResourceManager:AddRegistry(container, ResourceCompartment.ResourceCompartment_Game)
end

function MMLevel_BandarDesert:OnPartitionLoaded(partition)
    if partition == nil then
        return
    end

   if (partition.guid == self.mapPartition) then
        if (self.loaded == false) then
            self.loaded = true

            --mmResources:AddToPartition('a10', partition)
            --mmResources:AddToPartition('civcar03', partition)
            --mmResources:AddToPartition('deliveryvan', partition)
        end
    end
end

function MMLevel_BandarDesert:OnLoadResources( levelName, gameMode, isDedicated )
    print("Mounting Bundles...")
    --ResourceManager:MountSuperBundle('SPChunks')
    --ResourceManager:MountSuperBundle('Levels/MP_007/MP_007')
    --ResourceManager:MountSuperBundle('Levels/SP_Tank/SP_Tank')
    --ResourceManager:MountSuperBundle('XP3Chunks')
    --ResourceManager:MountSuperBundle('Levels/XP3_Desert/XP3_Desert')
end

Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
    if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
        print('Injecting Bundles...')
        bundles = {
            --'Levels/SP_Tank/SP_Tank',
            --'Levels/SP_Tank/HighwayToTeheran_01',
            --'Levels/XP3_Desert/XP3_Desert',
            --'Levels/XP3_Desert/RushLarge0',
            bundles[1],
        }
        hook:Pass(bundles, compartment)
        print('Bundles injected: '..dump(bundles))
    end
end)

return MMLevel_BandarDesert()