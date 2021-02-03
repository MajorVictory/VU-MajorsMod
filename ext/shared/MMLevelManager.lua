class 'MMLevelManager'


function MMLevelManager:__init()
    self.registryDone = false
    self.partitionsDone = false
    self.superBundlesDone = false
    self.bundlesDone = false

    Events:Subscribe('Level:LoadResources', self, self.OnLoadResources)
    Hooks:Install('ResourceManager:LoadBundles', 100, self, self.onLoadBundles)
    --Events:Subscribe('Partition:Loaded', self, self.OnPartitionLoaded)
    Events:Subscribe('Level:RegisterEntityResources', self.onRegisterEntityResources)

end

function MMLevelManager:Write(mmResources)

    
end

function MMLevelManager:OnLoadResources( levelName, gameMode, isDedicated )
    if self.superBundlesDone then
        return
    end

    local mapData = mmResources:Get(SharedUtils:GetLevelName())

    if (mapData ~= nil and mapData.SuperBundles) then
        print("Mounting Super Bundles: "..dump(mapData.SuperBundles))

        for i=1, #mapData.SuperBundles do
            ResourceManager:MountSuperBundle(mapData.SuperBundles[i])
        end
        self.superBundlesDone = true
    end
end

function MMLevelManager:onLoadBundles(hook, bundles, compartment)
    if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() and not self.bundlesDone then

        local mapData = mmResources:Get(SharedUtils:GetLevelName())

        if (mapData ~= nil and mapData.Bundles) then
            print("Injecting Bundles: "..dump(mapData.Bundles))

            local newBundles = {};

            for i=1, #mapData.Bundles do
                if (mapData.Bundles[i] == 'CURRENTLEVEL') then
                    newBundles[#newBundles+1] = bundles[1]
                else
                    newBundles[#newBundles+1] = mapData.Bundles[i]
                end
            end

            hook:Pass(newBundles, compartment)
            print("Bundles Injected: "..dump(newBundles))
            self.bundlesDone = true
        end
    end
end

function MMLevelManager:OnPartitionLoaded(partition)

    local mapName = mmResources:GetMap(partition.guid)
    if mapName == nil or mapName ~= SharedUtils:GetLevelName() then
        return
    end

    local mapData = mmResources:Get(mapName)
    if (mapData ~= nill and mapData.Vehicles) then
        print('Loading partitions for level: '..mapName)

        for i=1, #mapData.Vehicles do
            mmResources:AddToPartition(mapData.Vehicles[i], partition)
        end
        self.partitionsDone = true
    end
end


function MMLevelManager:onRegisterEntityResources(levelData)

    print('Creating registry for level: '..SharedUtils:GetLevelName())

    local container = mmResources:CreateRegistryContainer()
    if container == nil then
        return
    end
    ResourceManager:AddRegistry(container, ResourceCompartment.ResourceCompartment_Game)
end

return MMLevelManager()