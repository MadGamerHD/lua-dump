global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local supreme = GetActor("supreme")

	--CUT SCENE 21
	--INT. RUINED KAALANN. SUPREME COUNCIL CHAMBER -- DAY
	--As the magnetic field begins to collapse lightning-like bolts of energy streak out from the instable Eye of Time, striking the chamber.
		doctor::SID_0773:Amy!
	--Amy is staggering towards him, impossibly weak and barely solid now.
		amy::SID_0774:Doctor...
	--The Doctor moves next to her and they run and leap into the Eye with Amy...
		doctor::SID_1164:GERONIMO!
	-->An instant later - BANG! The Eye disappears!
	-->NOTE: Cut scene simplified to remove Daleks being hit by lighting or Supreme gaining sight temporarily.

end

global function End()
	local ruins_time = FindNodeByName("ruins_time")

	--cut scene 21.1
	ruins_time:Trigger()
end
