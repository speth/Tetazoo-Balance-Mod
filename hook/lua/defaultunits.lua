local EffectUtil = import('/lua/EffectUtilities.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
TBM_MassFabricationUnit = MassFabricationUnit

MassFabricationUnit = Class(TBM_MassFabricationUnit) {

    OnCreate = function(self)
        self.Friends = {}
        TBM_MassFabricationUnit.OnCreate(self)
    end,

    OnConsumptionActive = function(self)
        self:UpdateProductionValues()
        self:StartProductionMonitor()
        StructureUnit.OnConsumptionActive(self)
        self:SetMaintenanceConsumptionActive()
        self:SetProductionActive(true)
    end,

    OnConsumptionInActive = function(self)
        StructureUnit.OnConsumptionInActive(self)
        if self.ProductionMonitorThread then
           KillThread(self.ProductionMonitorThread)
           self.ProductionMonitorThread = nil
        end
        self:SetMaintenanceConsumptionInactive()
        self:SetProductionActive(false)
    end,

    UpdateProductionValues = function(self)
        local aiBrain = self:GetAIBrain()
        local bp = self:GetBlueprint().Economy
        local extractors = aiBrain:GetUnitsAroundPoint(categories.MASSEXTRACTION,self:GetPosition(), (bp.BonusRange or 2), 'Ally')
        
        local friendProduction = 0
        for i,unit in extractors do
            if not unit.FabFriend and not unit:IsBeingBuilt() and unit:GetArmy() == self:GetArmy() then
                unit.FabFriend = self
                table.insert(self.Friends,unit)
                self:PlayReclaimEffects(unit, self:GetBlueprint().General.BuildBones.BuildEffectBones or {0,}, unit.ReclaimEffectsBag )
                #self:CreateAdjacentEffect(unit)
            end
            
            if unit.FabFriend == self and not unit:IsBeingBuilt() then
                friendProduction = friendProduction + unit:GetProductionPerSecondMass()
            end
        end
        # LOG('I have ' .. table.getn(self.Friends) .. ' friends, producing ' .. friendProduction .. ' mass/s')
       
        local extraMassProduction = friendProduction/(bp.MassReductionFactor or 27)
        local newEnergyConsumption = extraMassProduction*bp.AdditionalEnergyConsumption
        self:SetProductionPerSecondMass(extraMassProduction * (self.MassProdAdjMod or 1))
        self:SetEnergyMaintenanceConsumptionOverride(newEnergyConsumption)
        self:UpdateConsumptionValues()
    end,

    PlayReclaimEffects = function(self, reclaimed, BuildEffectBones, EffectsBag )
        local army = self:GetArmy()
        local pos = reclaimed:GetPosition()
        pos[2] = GetSurfaceHeight(pos[1], pos[3])+1

        local beamEnd = Entity()
        EffectsBag:Add(beamEnd)
        Warp( beamEnd, pos )

        for kBone, vBone in BuildEffectBones do
            for kEmit, vEmit in EffectTemplate.ReclaimBeams do
                local beamEffect = EffectUtil.AttachBeamEntityToEntity(self, vBone, beamEnd, -1, army, vEmit )
                EffectsBag:Add(beamEffect)
            end
        end
        
        for k, v in EffectTemplate.ReclaimObjectAOE do
            EffectsBag:Add( CreateEmitterOnEntity( reclaimed, army, v ) )
        end
    end,

    StartProductionMonitor = function(self)
        if self.ProductionMonitorThread then
           KillThread(self.ProductionMonitorThread)
           self.ProductionMonitorThread = nil
        end
        self.ProductionMonitorThread = ForkThread(self.ProductionMonitor, self)
        self.Trash:Add(self.ProductionMonitorThread)
    end,

    ProductionMonitor = function(self)
        while true do
            self:UpdateProductionValues()
            WaitSeconds(10)
        end
    end,
    
    OnDestroy = function(self)
        for i,unit in self.Friends do
            unit.ReclaimEffectsBag:Destroy()
            unit.FabFriend = nil
        end
        TBM_MassFabricationUnit.OnDestroy(self)
    end,

    RemoveFriend = function(self, other)
        for i,unit in self.Friends do
            if unit == other then
                table.remove(self.Friends,i)
                break
            end
        end
    end,
}

TBM_MassCollectionUnit = MassCollectionUnit

MassCollectionUnit = Class(TBM_MassCollectionUnit) {

    OnDestroy = function(self)
        if self.FabFriend then
            self.FabFriend:RemoveFriend(self)
        end
        TBM_MassCollectionUnit.OnDestroy(self)
    end,
}

TBM_QuantumGateUnit = QuantumGateUnit

QuantumGateUnit = Class(TBM_QuantumGateUnit) {
    OnKilled = function(self, instigator, type, overkillRatio)
        self:StopUnitAmbientSound( 'ActiveLoop' )
        StructureUnit.OnKilled(self, instigator, type, overkillRatio) # bypassing factoryunit onkilled event
        if self.UnitBeingBuilt and not self.UnitBeingBuilt:IsDead() and self.UnitBeingBuilt:GetFractionComplete() != 1 then
            self.UnitBeingBuilt:Destroy()
        end
    end,
}
