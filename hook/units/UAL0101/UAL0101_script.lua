TBM_UAL0101 = UAL0101

UAL0101 = Class(TBM_UAL0101) {
    
    OnStopBeingBuilt = function(self,builder,layer)
        TBM_UAL0101.OnStopBeingBuilt(self,builder,layer)
        LOG("Spirit: " .. repr(self))
    end,
    
}

TypeClass = UAL0101