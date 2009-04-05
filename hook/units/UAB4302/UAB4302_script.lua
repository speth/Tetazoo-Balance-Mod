local TBM_UAB4302 = UAB4302

UAB4302 = Class(TBM_UAB4302) {
    OnDamage = function(self, instigator, amount, vector, damageType)
        if damageType == 'Nuke' then
            amount = 0.10*amount
        end
        TBM_UAB4302.OnDamage(self, instigator, amount, vector, damageType)
    end,
}

TypeClass = UAB4302
