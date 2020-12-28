class 'MMLevel_BandarDesert'


function MMLevel_BandarDesert:__init()
    print("Waiting for XP3_Desert/ConquestLarge0...")
    self.registryContainerGuid = Guid('4F81CD2D-1683-F9EE-304D-91260ACB625C', 'D') --XP3_Desert/ConquestLarge0
    self.replaced = true
    self.loaded = false

    Events:Subscribe('Level:RegisterEntityResources', self.onRegisterEntityResources)
    Events:Subscribe('Level:LoadResources', self, self.OnLoadResources)
end

function MMLevel_BandarDesert:onRegisterEntityResources(levelData)

    local BandarResourceContainer = RegistryContainer()
    
    print('Adding instances to registry')

    for resourceName, resourceData in pairs(mmResources:Get()) do
        if (resourceData.Entities) then
            print("Adding Entities ["..resourceName.."]...")
            for i = 1, #resourceData.Entities do
                local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Entities[i]))
                if (res) then
                    print("["..i.."] Added: "..res.typeInfo.name)
                    BandarResourceContainer.entityRegistry:add(res)
                else
                    print("["..i.."] Failed: "..resourceData.Entities[i])
                end
            end
        end
        if (resourceData.Blueprints) then
            print("Adding Blueprints ["..resourceName.."]...")
            for i = 1, #resourceData.Blueprints do
                local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Blueprints[i]))
                if (res) then
                    print("["..i.."] Added: "..res.typeInfo.name)
                    BandarResourceContainer.blueprintRegistry:add(res)
                else
                    print("["..i.."] Failed: "..resourceData.Blueprints[i])
                end
            end
        end
        if (resourceData.LogicReferrence) then
            print("Adding Logic Referrences ["..resourceName.."]...")
            for i = 1, #resourceData.LogicReferrence do
                local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.LogicReferrence[i]))
                if (res) then
                    print("["..i.."] Added: "..res.typeInfo.name)
                    BandarResourceContainer.referenceObjectRegistry:add(res)
                else
                    print("["..i.."] Failed: "..resourceData.LogicReferrence[i])
                end
            end
        end
    end

    ResourceManager:AddRegistry(BandarResourceContainer, ResourceCompartment.ResourceCompartment_Game)
end

function MMLevel_BandarDesert:OnLoadResources( levelName, gameMode, isDedicated )
    print("Mounting Bundles...")
    ResourceManager:MountSuperBundle('SPChunks')
    ResourceManager:MountSuperBundle('MPChunks')
    ResourceManager:MountSuperBundle('Levels/MP_007/MP_007')
    ResourceManager:MountSuperBundle('Levels/SP_Tank/SP_Tank')
    ResourceManager:MountSuperBundle('XP3Chunks')
    ResourceManager:MountSuperBundle('Levels/XP3_Desert/XP3_Desert')
end

Hooks:Install('ResourceManager:LoadBundles', 100, function(hook, bundles, compartment)
    if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
        print('Injecting Bundles...')
        bundles = {
            'Levels/MP_007/MP_007',
            'Levels/MP_007/Rush',
            'Levels/SP_Tank/SP_Tank',
            'Levels/SP_Tank/HighwayToTeheran_01',
            bundles[1],
            'Levels/XP3_Desert/RushLarge0',
        }
        hook:Pass(bundles, compartment)
        print('Bundles injected: '..dump(bundles))
    end
end)

return MMLevel_BandarDesert()