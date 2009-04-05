local function testCategories(cats,testCat)
   for i,cat in cats do
       if cat == testCat then
           return true
       end
    end
    return false
end


do
    LOG("RLS: Modding BPs")
    local oldModBlueprints = ModBlueprints
    
    function ModBlueprints(all_bps)
	    oldModBlueprints(all_bps)
        

        
        # Base Build power for T1 Factories
        local LandBP1 = 80
        local AirBP1 = 64
        local NavalBP1 = 144

        # Increase in BP for factory teching from T1->T2 and T2->T3
        local FactoryBP12 = 2.5
        local FactoryBP23 = 2.5
   
        # Build time reductions for units
        local LandBT1 = 1
        local LandBT2 = 0.8
        local LandBT3 = 0.6

        local AirBT1 = 1
        local AirBT2 = 0.8
        local AirBT3 = 0.6

        local NavalBT1 = 0.8
        local NavalBT2 = 0.6
        local NavalBT3 = 0.4

        # Caclulated Values
        local LandBP2 = LandBP1*FactoryBP12
        local LandBP3 = LandBP2*FactoryBP23
        local AirBP2 = AirBP1*FactoryBP12
        local AirBP3 = AirBP2*FactoryBP23
        local NavalBP2 = NavalBP1*FactoryBP12
        local NavalBP3 = NavalBP2*FactoryBP23

        --loop through the blueprints and adjust as desired.
        for id,bp in all_bps.Unit do
            for i, mod in __active_mods do
                if not mod.ui_only then
                    local curfile = mod.location .. '/icons/units/' .. bp.BlueprintId .. "_icon.dds"
                    if DiskGetFileInfo(curfile) then
                        LOG("Found build icon for " .. bp.BlueprintId .. "in " .. curfile)
                        bp.BuildIcon = curfile
                    end
                end
            end
            
            if bp.Economy and bp.Economy.BuildTime then
                bp.Economy.RepairTime = bp.Economy.BuildTime
            end
        
            # Increase unit build times
            if bp.Economy and bp.Economy.BuildTime and testCategories(bp.Categories,'MOBILE')
               and not testCategories(bp.Categories,'BUILTBYQUANTUMGATE') then

                if testCategories(bp.Categories,'TECH1') and testCategories(bp.Categories,'LAND') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(LandBP1/20)*LandBT1

                elseif testCategories(bp.Categories,'TECH2') and testCategories(bp.Categories,'LAND') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(LandBP2/40)*LandBT2

                elseif testCategories(bp.Categories,'TECH3') and testCategories(bp.Categories,'LAND') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(LandBP1/60)*FactoryBP12*FactoryBP23*LandBT3

                elseif testCategories(bp.Categories,'TECH1') and testCategories(bp.Categories,'AIR') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(AirBP1/20)*AirBT1

                elseif testCategories(bp.Categories,'TECH2') and testCategories(bp.Categories,'AIR') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(AirBP1/40)*FactoryBP12*AirBT2

                elseif testCategories(bp.Categories,'TECH3') and testCategories(bp.Categories,'AIR') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(AirBP1/60)*FactoryBP12*FactoryBP23*AirBT3

                elseif testCategories(bp.Categories,'TECH1') and testCategories(bp.Categories,'NAVAL') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(NavalBP1/20)*NavalBT1

                elseif testCategories(bp.Categories,'TECH2') and testCategories(bp.Categories,'NAVAL') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(NavalBP1/40)*FactoryBP12*NavalBT2

                elseif testCategories(bp.Categories,'TECH3') and testCategories(bp.Categories,'NAVAL') then
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(NavalBP1/60)*FactoryBP12*FactoryBP23*NavalBT3

                end
            end

            # Increase factory build rates
            if bp.Economy and bp.Economy.BuildTime 
               and bp.Economy.BuildRate and testCategories(bp.Categories,'FACTORY') 
               and testCategories(bp.Categories,'STRUCTURE') then

                if testCategories(bp.Categories,'TECH1') and testCategories(bp.Categories,'LAND') then
                    bp.Economy.BuildRate = LandBP1

                elseif testCategories(bp.Categories,'TECH2') and testCategories(bp.Categories,'LAND') then
                    bp.Economy.BuildRate = LandBP1*FactoryBP12
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(LandBP1/20)*LandBT1

                elseif testCategories(bp.Categories,'TECH3') and testCategories(bp.Categories,'LAND') then
                    bp.Economy.BuildRate = LandBP1*FactoryBP12*FactoryBP23
                    if testCategories(bp.Categories,'BUILTBYTIER2FACTORY') then
                        bp.Economy.BuildTime = bp.Economy.BuildTime*(LandBP1/40)*FactoryBP12*LandBT2
                    end

                elseif testCategories(bp.Categories,'TECH1') and testCategories(bp.Categories,'AIR') then
                    bp.Economy.BuildRate = AirBP1

                elseif testCategories(bp.Categories,'TECH2') and testCategories(bp.Categories,'AIR') then
                    bp.Economy.BuildRate = AirBP1*FactoryBP12
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(AirBP1/20)*AirBT1

                elseif testCategories(bp.Categories,'TECH3') and testCategories(bp.Categories,'AIR') then
                    bp.Economy.BuildRate = AirBP1*FactoryBP12*FactoryBP23
                    if testCategories(bp.Categories,'BUILTBYTIER2FACTORY') then
                        bp.Economy.BuildTime = bp.Economy.BuildTime*(AirBP1/40)*FactoryBP12*AirBT2
                    end

                elseif testCategories(bp.Categories,'TECH1') and testCategories(bp.Categories,'NAVAL') then
                    bp.Economy.BuildRate = NavalBP1

                elseif testCategories(bp.Categories,'TECH2') and testCategories(bp.Categories,'NAVAL') then
                    bp.Economy.BuildRate = NavalBP1*FactoryBP12
                    bp.Economy.BuildTime = bp.Economy.BuildTime*(NavalBP1/20)*NavalBT1

                elseif testCategories(bp.Categories,'TECH3') and testCategories(bp.Categories,'NAVAL') then
                    bp.Economy.BuildRate = NavalBP1*FactoryBP12*FactoryBP23
                    if testCategories(bp.Categories,'BUILTBYTIER2FACTORY') then
                        bp.Economy.BuildTime = bp.Economy.BuildTime*(NavalBP1/40)*FactoryBP12*NavalBT2
                    end
                end

            end

            # Fix Aircraft Carriers and other mobile factories:
            if id=="urs0303" then 
                bp.Economy.BuildRate = AirBP3 # Cybran aircraft carrier

            elseif id=="uas0303" then
                bp.Economy.BuildRate = AirBP3 # Aeon aircraft carrier

            elseif id=="xss0303" then
                bp.Economy.BuildRate = AirBP3 # Seraphim aircraft carrier

            elseif id=="ues0401" then
                bp.Economy.BuildRate = 3*AirBP3 # Atlantis

            elseif id=="uel0401" then
                bp.Economy.BuildRate = 3*LandBP3 # Fatboy

            elseif id=="uas0401" then
                bp.Economy.BuildRate = 3*NavalBP3 # Tempest

            elseif id=="uaa0310" then
                bp.Economy.BuildRate = 3*AirBP3 # Czar

            elseif id=="xrl0403" then
                bp.Economy.BuildRate = 3*LandBP3 # Megalith

            end

            # Reduce air crash damage by 90%
            if testCategories(bp.Categories,'AIR') and bp.Weapon then
                for j,w in ipairs(bp.Weapon) do
                    if w.WeaponCategory=="Death" then
                        w.Damage = w.Damage/10
                    end
                end
            end

        end
        LOG("RLS: Done Modding BPs")

    end


end




