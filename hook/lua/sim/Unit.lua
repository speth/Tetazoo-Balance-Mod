TBM_Unit = Unit
    
Unit = Class(TBM_Unit) {

    OnStartBuild = function(self, unitBeingBuilt, order)
        if order == 'Repair' and unitBeingBuilt.FinishedBeingBuilt then
            #LOG("Repairing a completed unit")
            local targetBP = unitBeingBuilt:GetBlueprint()
            self.RealBuildRate = self:GetBuildRate()
            self:SetBuildRate(self.RealBuildRate*targetBP.Economy.BuildTime/targetBP.Economy.RepairTime)
        end
        TBM_Unit.OnStartBuild(self, unitBeingBuilt, order)
    end,

    OnStopBuild = function(self, unitBeingBuilt)
        if self.RealBuildRate then
            self:SetBuildRate(self.RealBuildRate)
            self.RealBuildRate = nil
        end
            
        TBM_Unit.OnStopBuild(self, unitBeingBuilt)
    end,

    OnStartBeingBuilt = function(self, builder, layer)
        TBM_Unit.OnStartBeingBuilt(self, builder, layer)
        self.FinishedBeingBuilt = false
    end,

    OnStopBeingBuilt = function(self, builder, layer)
        TBM_Unit.OnStopBeingBuilt(self, builder, layer)
        self.FinishedBeingBuilt = true
    end,

    GetCaptureCosts = function(self, target_entity)
        local target_bp = target_entity:GetBlueprint().Economy
        local bp = self:GetBlueprint().Economy

        local time = ((target_bp.RepairTime or target_bp.BuildTime or 10) / self:GetBuildRate()) / 2
        local energy = target_bp.BuildCostEnergy or 100
        time = time * (self.CaptureTimeMultiplier or 1)

        return time, energy, 0
    end,

}
