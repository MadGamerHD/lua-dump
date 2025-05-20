global played_cutscene

global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
--	local dalek = GetActor("dalek")
	
	if not played_cutscene then
		local timeline = FindNodeByName("dalek_preview_timeline")
			
		played_cutscene = true
		timeline:Trigger()
	else
		doctor:EnableStealth()
		amy:EnableStealth()
--		dalek:EnablePhysics()
--		dalek:EnableStickToFloor()
	end
end