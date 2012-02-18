do

cbfp_NukesRestricted = NukesRestricted

# Fixes a bug in the Community Bug Fix patch.
# Only disable nukes if nukes are disabled. Seriously.
function NukesRestricted( WeaponLabel )
    ret = cbfp_NukesRestricted( WeaponLabel )
    if ret == 1 then
       NoSML = false
       ret = false
    end
    return ret
end

cbfp_TacticalMissilesRestricted = TacticalMissilesRestricted

# Fixes a bug in the Community Bug Fix patch.
# This doesn't actually do anything because there is no mechanism
# for disabling Tacs at the moment.
function TacticalMissilesRestricted( WeaponLabel )
    ret = cbfp_TacticalMissilesRestricted( WeaponLabel )
    if ret == 1 then
       NoTML = false
       ret = false
    end
    return ret
end

end
