#****************************************************************************
#**
#**  Author(s):  Mikko Tyster, Atte Hulkkonen
#**
#**  Summary  :  Seraphim T3 Mobile Lightning Anti-Air
#**
#**  Copyright � 2008 Blade Braver!
#****************************************************************************

local SLandUnit = import('/lua/seraphimunits.lua').SLandUnit
local SDFUnstablePhasonBeam = import('/mods/Tetazoo Balance Mod/lua/kirvesweapons.lua').SDFUnstablePhasonBeam
local Dummy = import('/mods/Tetazoo Balance Mod/lua/kirvesweapons.lua').Dummy
local EffectTemplate = import('/mods/Tetazoo Balance Mod/lua/kirveseffects.lua')

DSLK004 = Class(SLandUnit) {
    Weapons = {
        PhasonBeam1 = Class(SDFUnstablePhasonBeam) {
        FxMuzzleFlash = {'/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_01_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_02_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_03_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_04_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_05_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_06_emit.bp','/mods/Tetazoo Balance Mod/Effects/Emitters/seraphim_electricity_emit.bp'},
		},
		
		PhasonBeam2 = Class(SDFUnstablePhasonBeam) {
        FxMuzzleFlash = {'/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_01_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_02_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_03_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_04_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_05_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_06_emit.bp','/mods/Tetazoo Balance Mod/Effects/Emitters/seraphim_electricity_emit.bp'},
        },
		
		Dummy = Class(Dummy) {},
    },
	
	AmbientEffects = 'OrbGlowEffect',
	
	OnStopBeingBuilt = function(self,builder,layer)
		SLandUnit.OnStopBeingBuilt(self,builder,layer)
        local army =  self:GetArmy()
        if self.AmbientEffects then
            for k, v in EffectTemplate[self.AmbientEffects] do
				CreateAttachedEmitter(self, 'Orb', army, v)
            end
        end
    end,
}
TypeClass = DSLK004