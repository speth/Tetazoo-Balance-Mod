TBM_Unit = Unit
    
Unit = Class(TBM_Unit) {

    OnStartBuild = function(self, unitBeingBuilt, order)
        if order == 'Repair' and unitBeingBuilt.FinishedBeingBuilt then
            LOG("Repairing a completed unit")
            self.RealBuildRate = self:GetBuildRate()
            self:SetBuildRate(self.RealBuildRate*unitBeingBuilt:GetBlueprint().Economy.BuildTime/unitBeingBuilt:GetBlueprint().Economy.RepairTime)
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
}
