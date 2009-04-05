local TBM_UAL0001 = UAL0001

UAL0001 = Class(TBM_UAL0001) {
    CreateEnhancement = function(self, enh)
        local bp = self:GetBlueprint().Enhancements[enh]
        if not bp then return end

        if enh == 'T4Engineering' then
            AWalkingLandUnit.CreateEnhancement(self, enh)
            local bp = self:GetBlueprint().Enhancements[enh]
            if not bp then return end
            local cat = ParseEntityCategory(bp.BuildableCategoryAdds)
            self:RemoveBuildRestriction(cat)
            if not Buffs['AeonACUT4BuildRate'] then
                BuffBlueprint {
                    Name = 'AeonACUT4BuildRate',
                    DisplayName = 'AeonCUT4BuildRate',
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
            Buff.ApplyBuff(self, 'AeonACUT4BuildRate')
        elseif enh == 'T4EngineeringRemove' then
            AWalkingLandUnit.CreateEnhancement(self, enh)
            if Buff.HasBuff( self, 'AeonACUT4BuildRate') then
                Buff.RemoveBuff(self, 'AeonACUT4BuildRate')
            end
            self:AddBuildRestriction( categories.AEON * 
                (categories.BUILTBYTIER4COMMANDER + categories.BUILTBYTIER3COMMANDER+categories.BUILTBYTIER2COMMANDER) )
        elseif enh == 'CrysalisBeamRemove' then
            TBM_UAL0001.CreateEnhancement(self,'HeatSinkRemove')
            TBM_UAL0001.CreateEnhancement(self,'CrysalisBeamRemove')

        else
            TBM_UAL0001.CreateEnhancement(self, enh)
        end
    end,

    OnCreate = function(self)
        TBM_UAL0001.OnCreate(self)
        self:AddBuildRestriction( categories.AEON * categories.BUILTBYTIER4COMMANDER )
    end,

}

TypeClass = UAL0001

