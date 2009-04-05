local TBM_UEB4302 = UEB4302

UEB4302 = Class(TBM_UEB4302) {
    OnDamage = function(self, instigator, amount, vector, damageType)
        if damageType == 'Nuke' then
            amount = 0.10*amount
        end
        TBM_UEB4302.OnDamage(self, instigator, amount, vector, damageType)
    end,
}

TypeClass = UEB4302
