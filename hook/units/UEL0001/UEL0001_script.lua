local TBM_UEL0001 = UEL0001

UEL0001 = Class(TBM_UEL0001) {
    CreateEnhancement = function(self, enh)
        local bp = self:GetBlueprint().Enhancements[enh]
        if not bp then return end

        if enh == 'T4Engineering' then
            TWalkingLandUnit.CreateEnhancement(self, enh)
            local bp = self:GetBlueprint().Enhancements[enh]
            if not bp then return end
            local cat = ParseEntityCategory(bp.BuildableCategoryAdds)
            self:RemoveBuildRestriction(cat)
            if not Buffs['AeonACUT4BuildRate'] then
                BuffBlueprint {
                    Name = 'UEFACUT4BuildRate',
                    DisplayName = 'UEFCUT4BuildRate',
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
            Buff.ApplyBuff(self, 'UEFACUT4BuildRate')
        elseif enh == 'T4EngineeringRemove' then
            TWalkingLandUnit.CreateEnhancement(self, enh)
            if Buff.HasBuff( self, 'UEFACUT4BuildRate') then
                Buff.RemoveBuff(self, 'UEFACUT4BuildRate')
            end
            self:AddBuildRestriction( categories.UEF * 
                (categories.BUILTBYTIER4COMMANDER + categories.BUILTBYTIER3COMMANDER+categories.BUILTBYTIER2COMMANDER) )
        elseif enh == 'DamageStablizationRemove' then
            TBM_UEL0001.CreateEnhancement(self,'DamageStablizationRemove')
            TBM_UEL0001.CreateEnhancement(self,'HeavyAntiMatterCannonRemove')
        else
            TBM_UEL0001.CreateEnhancement(self, enh)
        end
    end,

    OnCreate = function(self)
        TBM_UEL0001.OnCreate(self)
        self:AddBuildRestriction( categories.UEF * categories.BUILTBYTIER4COMMANDER )
    end,

}

TypeClass = UEL0001

