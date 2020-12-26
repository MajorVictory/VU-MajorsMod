class 'MMLevel_BandarDesert'


function MMLevel_BandarDesert:__init()
    print("Initializing MetroModShared")
    self:RegisterVars()
    self:RegisterEvents()
end


function MMLevel_BandarDesert:RegisterVars()
    self.m_RegistryGUID = Guid('4F81CD2D-1683-F9EE-304D-91260ACB625C', 'D') --XP3_Desert/ConquestLarge0

    self.m_Enable = false
    
    self.lav25g0 = Guid('0AA2C0B7-6B2C-76F5-B7CE-50276A615E3A', 'D')
    self.lav25i0 = nil
    self.lav25g1 = Guid('2108D7BF-0820-4F57-967F-B952D4AC8BCB', 'D')
    self.lav25i1 = nil
    self.lav25g2 = Guid('ADF563C9-28B1-C42B-993E-B2FD40F36078', 'D')
    self.lav25i2 = nil
    self.lav25g3 = Guid('5C58DA9D-F492-40A6-B7C4-B513D90E4733', 'D')
    self.lav25i3 = nil
    self.lav25g4 = Guid('7FBD2EE5-7E3F-4CA0-0263-A258A0924834', 'D')
    self.lav25i4 = nil
    self.lav25g5 = Guid('A4EA9BD4-D228-11DF-B6A2-F818A1A10C85', 'D')
    self.lav25i5 = nil
    
    self.lav25g6 = Guid('0AA2C0B7-6B2C-76F5-B7CE-50276A615E3A', 'D')
    self.lav25i6 = nil
    
    
    self.dirtbike0 = Guid('33960E31-BB2A-4CAD-80B9-FBDA32E36745', 'D')
    self.dirtbikei0 = nil
    self.dirtbike1 = Guid('7CAE2DB9-FE40-4F7A-937D-4617CD9CC0E8', 'D')
    self.dirtbikei1 = nil
    self.dirtbike2 = Guid('399323F8-87EB-11E1-AF32-BE54FEE25012', 'D')
    self.dirtbikei2 = nil
    self.dirtbike3 = Guid('CE069226-E864-2B46-F269-97F0486ADFF5', 'D')
    self.dirtbikei3 = nil
    self.dirtbike4 = Guid('A401FE88-C8AE-43D1-BD60-13F9464060B6', 'D')
    self.dirtbikei4 = nil

    self.replaced = false
end


function MMLevel_BandarDesert:RegisterEvents()
    self.m_PartitionLoadedEvent = Events:Subscribe('Partition:Loaded', self, self.OnPartitionLoaded)
    Events:Subscribe('Level:LoadResources', self, self.OnLoadResources)
end

function MMLevel_BandarDesert:OnLoadResources( dedicated )
    ResourceManager:MountSuperBundle('Xp3Chunks')
    ResourceManager:MountSuperBundle('Levels/XP3_Desert/RushLarge0')

end

function MMLevel_BandarDesert:OnLoadBundles( hook, bundles, compartment )
    if #bundles == 1 and IsPrimaryLevel(bundles[1]) then
        bundles = {
            'levels/xp5_004/xp5_004',
            'levels/xp5_004/rush',
            "levels/xp5_004/xp5_004_uiendofround",
            "levels/xp5_004/xp5_004_uiloadingmp",
            "levels/xp5_004/xp5_004_uiloadingsp",
            "levels/xp5_004/xp5_004_uiplaying",
            bundles[1]
        }
        print(bundles)
        hook:Pass(bundles, compartment)
    end
end

function MMLevel_BandarDesert:OnPartitionLoaded(p_Partition)
    if p_Partition == nil then
        return
    end
    
    for _, p_Instance in ipairs(p_Partition.instances) do
        if p_Instance.instanceGuid == self.m_RegistryGUID then
            print("cloning")
            if(self.replaced == false) then
                self.replaced = true

                local s_Instance = RegistryContainer(p_Instance:Clone(p_Instance.instanceGuid))

                print('Adding instances to registry!')

                for resourceName, resourceData in pairs(mmResources:Get()) do
                    if (resourceData.Entities) then
                        print("Adding Entities ["..resourceName.."]...")
                        for i = 1, #resourceData.Entities do
                            local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Entities[i], 'D'))
                            s_Instance.entityRegistry:add(res)
                        end
                    end
                    if (resourceData.Blueprints) then
                        print("Adding Blueprints ["..resourceName.."]...")
                        for i = 1, #resourceData.Blueprints do
                            local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.Blueprints[i], 'D'))
                            s_Instance.blueprintRegistry:add(res)
                        end
                    end
                    if (resourceData.LogicReferrence) then
                        print("Adding Logic Referrences ["..resourceName.."]...")
                        for i = 1, #resourceData.LogicReferrence do
                            local res = ResourceManager:SearchForInstanceByGuid(Guid(resourceData.LogicReferrence[i], 'D'))
                            s_Instance.referenceObjectRegistry:add(res)
                        end
                    end
                end
                
                p_Partition:ReplaceInstance(p_Instance, s_Instance, true)
            end
        end

    end
end

return MMLevel_BandarDesert()