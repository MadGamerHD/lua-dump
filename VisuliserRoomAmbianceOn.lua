local VisuliserSound = FindNodeByName("VisuliserRoomAreaSoundDef_0")
local DefaultSound = FindNodeByName("DefaultAmbianceSoundDef_0")

global function Enter()
	DefaultSound:StopTrigger()
	VisuliserSound:Trigger()
end

global function Exit()

	DefaultSound:Trigger()
	VisuliserSound:StopTrigger()

end

