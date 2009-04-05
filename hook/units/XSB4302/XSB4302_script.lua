local TBM_XSB4302 = XSB4302

XSB4302 = Class(TBM_XSB4302) {
    OnDamage = function(self, instigator, amount, vector, damageType)
        if damageType == 'Nuke' then
            amount = 0.10*amount
        end
        TBM_XSB4302.OnDamage(self, instigator, amount, vector, damageType)
    end,
}

TypeClass = XSB4302
