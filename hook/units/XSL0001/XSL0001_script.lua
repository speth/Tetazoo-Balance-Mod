local TBM_XSL0001 = XSL0001

XSL0001 = Class(TBM_XSL0001) {
    CreateEnhancement = function(self, enh)
        local bp = self:GetBlueprint().Enhancements[enh]
        if not bp then return end

        if enh == 'T4Engineering' then
            SWalkingLandUnit.CreateEnhancement(self, enh)
            local bp = self:GetBlueprint().Enhancements[enh]
            if not bp then return end
            local cat = ParseEntityCategory(bp.BuildableCategoryAdds)
            self:RemoveBuildRestriction(cat)
            if not Buffs['SeraphimACUT4BuildRate'] then
                BuffBlueprint {
                    Name = 'SeraphimACUT4BuildRate',
                    DisplayName = 'SeraphimCUT4BuildRate',
                    BuffType = 'ACUBUILDRATE',
                    Stacks = 'REPLACE',
                    Duration = -1,
                    Affects = {
                        BuildRate = {
                            Add =  bp.NewBuildRate - self:GetBlueprint().Economy.BuildRate,
                            Mult = 1,
                        },
                        MaxHealth = {
                            Add = bp.NewHealth,
                            Mult = 1.0,
                        },
                        Regen = {
                            Add = bp.NewRegenRate,
                            Mult = 1.0,
                        },
                    },
                }
            end
            Buff.ApplyBuff(self, 'SeraphimACUT4BuildRate')
        elseif enh == 'T4EngineeringRemove' then
            SWalkingLandUnit.CreateEnhancement(self, enh)
            if Buff.HasBuff( self, 'SeraphimACUT4BuildRate') then
                Buff.RemoveBuff(self, 'SeraphimACUT4BuildRate')
            end
            self:AddBuildRestriction( categories.SERAPHIM * 
                (categories.BUILTBYTIER4COMMANDER + categories.BUILTBYTIER3COMMANDER+categories.BUILTBYTIER2COMMANDER) )
            # do stuff
        elseif enh == 'BlastAttackRemove' then
            TBM_XSL0001.CreateEnhancement(self,'BlastAttackRemove')
            TBM_XSL0001.CreateEnhancement(self,'RateOfFireRemove')
        else
            TBM_XSL0001.CreateEnhancement(self, enh)
        end
    end,

    OnCreate = function(self)
        TBM_XSL0001.OnCreate(self)
        self:AddBuildRestriction( categories.SERAPHIM * categories.BUILTBYTIER4COMMANDER ) -- require T4 build suite to build experimentals
        
        AddBuildRestriction(self:GetArmy(), categories.EXPERIMENTAL * categories.BUILTBYQUANTUMGATE * (categories.AEON + categories.CYBRAN + categories.UEF)) -- only build spare ACUs for your own race
    end,

    OnKilled = function(self)
        LOG("XSL0001:OnKilled")
        local army = self:GetArmy()
        local backupACUs = ArmyBrains[army]:GetListOfUnits(categories.SERAPHIM * categories.EXPERIMENTAL * categories.BUILTBYQUANTUMGATE, false)
        if backupACUs then
            local position = backupACUs[1]:GetPosition()
            local orientation = backupACUs[1]:GetOrientation()
            backupACUs[1]:Destroy()
            local NewGuy = CreateUnit('xsl0001', army, position[1], position[2], position[3], orientation[1], orientation[2], orientation[3], orientation[4])
            NewGuy:PlayCommanderWarpInEffect()
        end
        TBM_XSL0001.OnKilled(self)
    end,
    
}

TypeClass = XSL0001

