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
        self:AddBuildRestriction( categories.SERAPHIM * categories.BUILTBYTIER4COMMANDER )
    end,

}

TypeClass = XSL0001

