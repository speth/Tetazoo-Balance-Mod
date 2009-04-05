TBM_SConstructionUnit = SConstructionUnit

SConstructionUnit = Class(TBM_SConstructionUnit) {

    OnStartBuild = function(self, unitBeingBuilt, order)
        #LOG(order)
        if order == 'Repair' and unitBeingBuilt.FinishedBeingBuilt then
        #    LOG("Repairing a completed unit")
            self.RealBuildRate = self:GetBuildRate()
            self:SetBuildRate(self.RealBuildRate*unitBeingBuilt:GetBlueprint().Economy.BuildTime/unitBeingBuilt:GetBlueprint().Economy.RepairTime)
        end
        TBM_SConstructionUnit.OnStartBuild(self, unitBeingBuilt, order)
    end,

}

