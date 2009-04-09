local ParentBeginSession = BeginSession

function BeginSession()
	ParentBeginSession()
    for army1, brain1 in ArmyBrains do
		if ArmyIsCivilian(army1) == false and ArmyIsOutOfGame(army1) == false then
			brain1.CalculateScore = PhantomCalculateScore
		end
	end

end

function PhantomCalculateScore(self)
	local massValueDestroyed = self:GetArmyStat("Enemies_MassValue_Destroyed",0.0).Value
	local massValueLost = self:GetArmyStat("Units_MassValue_Lost",0.0).Value
	local energyValueDestroyed = self:GetArmyStat("Enemies_EnergyValue_Destroyed",0.0).Value
	local energyValueLost = self:GetArmyStat("Units_EnergyValue_Lost",0.0).Value

	local energyValueCoefficient = 0.02
	return math.floor((massValueDestroyed - massValueLost) + (energyValueDestroyed - energyValueLost) * energyValueCoefficient)
end
