local ProductionSound = FindNodeByName("ProductionSoundDef_1")
local DefaultSound = FindNodeByName("DefaultAmbianceSoundDef_0")

global function Enter()
	DefaultSound:StopTrigger()
	ProductionSound:Trigger()
end

global function Exit()

	DefaultSound:Trigger()
	ProductionSound:StopTrigger()

end

