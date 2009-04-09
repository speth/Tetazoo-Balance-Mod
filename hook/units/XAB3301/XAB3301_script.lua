#****************************************************************************
#**
#**  File     :  /data/units/XAB3301/XAB3301_script.lua
#**  Author(s):  Jessica St. Croix, Ted Snook, Dru Staltman
#**
#**  Summary  :  Aeon Quantum Optics Facility Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local VizMarker = import('/lua/sim/VizMarker.lua').VizMarker

# Setup as RemoteViewing child of AStructureUnit
local RemoteViewing = import('/lua/RemoteViewing.lua').RemoteViewing
AStructureUnit = RemoteViewing( AStructureUnit )


#****************************************************************************
#**
#**  File     :  /lua/shield.lua
#**  Author(s):  John Comes, Gordon Duclos
#**
#**  Summary  : Shield lua module
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local Entity = import('/lua/sim/Entity.lua').Entity
local EffectTemplate = import('/lua/EffectTemplates.lua')
local Util = import('/lua/utilities.lua')
local Shield = import('/lua/shield.lua').Shield

FakeShield = Class(Shield) {
    OnDamage =  function(self,instigator,amount,vector,type)
    end,
    
    OnState = State {
        Main = function(self)
        end,
    },
    
    OffState = State {
        Main = function(self)
        end,
    },
    
    DamageRechargeState = State {
        Main = function(self)
        end,
    },

    EnergyDrainRechargeState = State {
        Main = function(self)
        end,
    },
}

XAB3301 = Class( AStructureUnit ) {
    OnCreate = function(self)

        
        AStructureUnit.OnCreate(self)
        bpShield = self:GetBlueprint().Defense.FakeShield
        if bpShield then
            self:DestroyShield()
            self.MyShield = FakeShield {
                Owner = self,
                Mesh = bpShield.Mesh or '',
                MeshZ = bpShield.MeshZ or '',
                ImpactMesh = bpShield.ImpactMesh or '',
                ImpactEffects = bpShield.ImpactEffects or '',    
                Size = bpShield.ShieldSize or 10,
                ShieldMaxHealth = bpShield.ShieldMaxHealth or 250,
                ShieldRechargeTime = bpShield.ShieldRechargeTime or 10,
                ShieldEnergyDrainRechargeTime = bpShield.ShieldEnergyDrainRechargeTime or 10,
                ShieldVerticalOffset = bpShield.ShieldVerticalOffset or -1,
                ShieldRegenRate = bpShield.ShieldRegenRate or 1,
                ShieldRegenStartTime = bpShield.ShieldRegenStartTime or 5,
                PassOverkillDamage = bpShield.PassOverkillDamage or false,
            }
            self:SetFocusEntity(self.MyShield)
            self:EnableShield()
            self.Trash:Add(self.MyShield)
        end
        
        self.RegenRatePositive = bpShield.ShieldRegenRate
        self.RegenRateNegative = bpShield.ShieldUseRate
        self.TargetChangeCost = bpShield.TargetChangeCost
        
    end,
    
    OnTargetLocation = function(self, location)
        # Initial energy drain here - we drain resources instantly when an eye is relocated (including initial move)
        local aiBrain = self:GetAIBrain()
        local bp = self:GetBlueprint()
        local have = aiBrain:GetEconomyStored('ENERGY')
        local need = bp.Economy.InitialRemoteViewingEnergyDrain
        if not ( have > need ) then
            return
        end

        if not self.RemoteViewingData.IntelButton then
            return
        end
        
#        LOG(self.MyShield:GetHealth())
        if self.MyShield:GetHealth() <= self.TargetChangeCost then
            return
        end

        # Drain economy here
        aiBrain:TakeResource( 'ENERGY', bp.Economy.InitialRemoteViewingEnergyDrain )
        self.MyShield:AdjustHealth(self,-self.TargetChangeCost)

        self.RemoteViewingData.VisibleLocation = location
        self:CreateVisibleEntity()
    end,

    CreateVisibleEntity = function(self)
#        LOG('CreateVisibleEntity')

        if self.RemoteViewingData.IntelButton then
            self.RegenRate = -self.RegenRateNegative
            self:RestartRegen()
        end

        AStructureUnit.CreateVisibleEntity(self)
    end,

    DisableVisibleEntity = function(self)
#        LOG('DisableVisibleEntity')
        self.RegenRate = self.RegenRatePositive
        self:RestartRegen()
        AStructureUnit.DisableVisibleEntity(self)
    end,

    OnIntelEnabled = function(self)
        # Make sure the button is only calculated once rather than once per possible intel type
        if not self.RemoteViewingData.IntelButton then
            self.RemoteViewingData.IntelButton = true
            self.RemoteViewingData.DisableCounter = self.RemoteViewingData.DisableCounter - 1
            self:CreateVisibleEntity()
#            LOG('OnIntelEnabled')

            if self.MyShield:GetHealth() <= 0 then
                return
             end
        end
        AStructureUnit.OnIntelEnabled(self)
    end,

    OnIntelDisabled = function(self)
        # make sure button is only calculated once rather than once per possible intel type
        if self.RemoteViewingData.IntelButton then
#            LOG('OnIntelDisabled')
            self.RemoteViewingData.IntelButton = false
            self.RemoteViewingData.DisableCounter = self.RemoteViewingData.DisableCounter + 1
            self:DisableVisibleEntity()

        end
        AStructureUnit.OnIntelDisabled(self)
    end,

    DisableResourceMonitor = function(self)
#        LOG('DisableResourceMonitor')
        WaitSeconds(0.5)
       
        local fraction = self:GetResourceConsumed()
        local shieldHP = self.MyShield:GetHealth()
        while fraction == 1 and shieldHP > 0 do
            WaitSeconds(0.5)
            fraction = self:GetResourceConsumed()
            shieldHP = self.MyShield:GetHealth()
        end
        if self.RemoteViewingData.IntelButton then
            self.RemoteViewingData.DisableCounter = self.RemoteViewingData.DisableCounter + 1
            self.RemoteViewingData.ResourceThread = self:ForkThread(self.EnableResourceMonitor)
            self:DisableVisibleEntity()
        end
    end,

    EnableResourceMonitor = function(self)
#        LOG('EnableResourceMonitor')
        local recharge = self:GetBlueprint().Intel.ReactivateTime or 10
               
        WaitSeconds(recharge)
        self.RemoteViewingData.DisableCounter = self.RemoteViewingData.DisableCounter - 1
        self:CreateVisibleEntity()
    end,

    RestartRegen = function(self)
        if self.RegenThread then
           KillThread(self.RegenThread)
           self.RegenThread = nil
        end

        self.RegenThread = ForkThread(self.RegenStartThread, self)
        self.Trash:Add(self.RegenThread)
    end,
    
    RegenStartThread = function(self)
        while self.MyShield:GetHealth() < self.MyShield:GetMaxHealth() do
            self.MyShield:AdjustHealth(self, self.RegenRate)
            self.MyShield:UpdateShieldRatio(-1)
            WaitSeconds(1)
        end
    end,
    
}

TypeClass = XAB3301
