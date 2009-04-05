local TBM_URB4302 = URB4302

URB4302 = Class(TBM_URB4302) {
    OnDamage = function(self, instigator, amount, vector, damageType)
        if damageType == 'Nuke' then
            amount = 0.10*amount
        end
        TBM_URB4302.OnDamage(self, instigator, amount, vector, damageType)
    end,
}

TypeClass = URB4302
