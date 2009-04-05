local TBM_URL0001 = URL0001

URL0001 = Class(TBM_URL0001) {
    CreateEnhancement = function(self, enh)
        local bp = self:GetBlueprint().Enhancements[enh]
        if not bp then return end

        if enh == 'T4Engineering' then
            CWalkingLandUnit.CreateEnhancement(self, enh)
            local cat = ParseEntityCategory(bp.BuildableCategoryAdds)
            self:RemoveBuildRestriction(cat)
            if not Buffs['CybranACUT4BuildRate'] then
                BuffBlueprint {
                    Name = 'CybranACUT4BuildRate',
                    DisplayName = 'CybranCUT4BuildRate',
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
            Buff.ApplyBuff(self, 'CybranACUT4BuildRate')
        elseif enh == 'T4EngineeringRemove' then
            CWalkingLandUnit.CreateEnhancement(self, enh)
            if Buff.HasBuff( self, 'CybranACUT4BuildRate') then
                Buff.RemoveBuff(self, 'CybranACUT4BuildRate')
            end
            self:AddBuildRestriction( categories.CYBRAN * 
                (categories.BUILTBYTIER4COMMANDER + categories.BUILTBYTIER3COMMANDER+categories.BUILTBYTIER2COMMANDER) )

        elseif enh == 'NewStealthGenerator' then
            LOG("NewStealthGenerator")
            CWalkingLandUnit.CreateEnhancement(self, enh)


            if self.IntelEffectsBag then
                EffectUtil.CleanupEffectBag(self,'IntelEffectsBag')
                self.IntelEffectsBag = nil
            end
            self.CloakEnh = false
            self.StealthEnh = true
            self:EnableUnitIntel('RadarStealth')
            self:EnableUnitIntel('SonarStealth')

            if not Buffs['CybranACUStealthBonus'] then
               BuffBlueprint {
                    Name = 'CybranACUStealthBonus',
                    DisplayName = 'CybranACUStealthBonus',
                    BuffType = 'ACUSTEALTHBONUS',
                    Stacks = 'ALWAYS',
                    Duration = -1,
                    Affects = {
                        MaxHealth = {
                            Add = bp.NewHealth,
                            Mult = 1.0,
                        },
                    },
                } 
            end
            if Buff.HasBuff( self, 'CybranACUStealthBonus' ) then
                Buff.RemoveBuff( self, 'CybranACUStealthBonus' )
            end  
            Buff.ApplyBuff(self, 'CybranACUStealthBonus')

        elseif enh == 'NewStealthGeneratorRemove' then
            CWalkingLandUnit.CreateEnhancement(self, enh)
            self:RemoveToggleCap('RULEUTC_CloakToggle')
            self:DisableUnitIntel('RadarStealth')
            self:DisableUnitIntel('SonarStealth')   
            self:DisableUnitIntel('Cloak')        
            self.StealthEnh = false
            self.CloakEnh = false 
            self.StealthFieldEffects = false
            self.CloakingEffects = false
            if Buff.HasBuff( self, 'CybranACUStealthBonus' ) then
                Buff.RemoveBuff( self, 'CybranACUStealthBonus' )
            end 

            if Buff.HasBuff( self, 'CybranACUCloakBonus' ) then
                Buff.RemoveBuff( self, 'CybranACUCloakBonus' )
            end  

        elseif enh == 'NewCloakingGenerator' then
            LOG("NewCloakingGenerator")
            CWalkingLandUnit.CreateEnhancement(self, enh)

            self:AddToggleCap('RULEUTC_CloakToggle')
            self.StealthEnh = false
			self.CloakEnh = true
            self:EnableUnitIntel('Cloak')
            if not Buffs['CybranACUCloakBonus'] then
               BuffBlueprint {
                    Name = 'CybranACUCloakBonus',
                    DisplayName = 'CybranACUCloakBonus',
                    BuffType = 'ACUCLOAKBONUS',
                    Stacks = 'ALWAYS',
                    Duration = -1,
                    Affects = {
                        MaxHealth = {
                            Add = bp.NewHealth,
                            Mult = 1.0,
                        },
                    },
                } 
            end
            if Buff.HasBuff( self, 'CybranACUCloakBonus' ) then
                Buff.RemoveBuff( self, 'CybranACUCloakBonus' )
            end  
            Buff.ApplyBuff(self, 'CybranACUCloakBonus')

        elseif enh == 'NewCloakingGeneratorRemove' then
            CWalkingLandUnit.CreateEnhancement(self, enh)
            
            self:RemoveToggleCap('RULEUTC_CloakToggle')
            self:DisableUnitIntel('RadarStealth')
            self:DisableUnitIntel('SonarStealth')
            self:DisableUnitIntel('Cloak')
            self.StealthEnh = false
            self.CloakEnh = false 
            self.StealthFieldEffects = false
            self.CloakingEffects = false

            if Buff.HasBuff( self, 'CybranACUCloakBonus' ) then
                Buff.RemoveBuff( self, 'CybranACUCloakBonus' )
            end  

        elseif enh == 'MicrowaveLaserGeneratorRemove' then
            CWalkingLandUnit.CreateEnhancement(self, enh)
            self:CreateEnhancement('CoolingUpgradeRemove')
            self:SetWeaponEnabledByLabel('MLG', false)

        else
            TBM_URL0001.CreateEnhancement(self, enh)
        end
    end,

    OnIntelEnabled = function(self)
        CWalkingLandUnit.OnIntelEnabled(self)
        if self.CloakEnh and self:IsIntelEnabled('Cloak') then 
            self:SetEnergyMaintenanceConsumptionOverride(self:GetBlueprint().Enhancements['NewCloakingGenerator'].MaintenanceConsumptionPerSecondEnergy or 0)
            self:SetMaintenanceConsumptionActive()
            if not self.IntelEffectsBag then
			    self.IntelEffectsBag = {}
			    self.CreateTerrainTypeEffects( self, self.IntelEffects.Cloak, 'FXIdle',  self:GetCurrentLayer(), nil, self.IntelEffectsBag )
			end            
        elseif self.StealthEnh and self:IsIntelEnabled('RadarStealth') and self:IsIntelEnabled('SonarStealth') then
            self:SetEnergyMaintenanceConsumptionOverride(self:GetBlueprint().Enhancements['NewStealthGenerator'].MaintenanceConsumptionPerSecondEnergy or 0)
            self:SetMaintenanceConsumptionActive()  
            if not self.IntelEffectsBag then 
	            self.IntelEffectsBag = {}
		        self.CreateTerrainTypeEffects( self, self.IntelEffects.Field, 'FXIdle',  self:GetCurrentLayer(), nil, self.IntelEffectsBag )
		    end                  
        end		
    end,

    OnCreate = function(self)
        TBM_URL0001.OnCreate(self)
        self:AddBuildRestriction( categories.CYBRAN * categories.BUILTBYTIER4COMMANDER )
    end,

}

TypeClass = URL0001

