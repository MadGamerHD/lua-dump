global model
global script_node
local positiona=FindNodeByName("tower_door_posa")
local me=FindNodeByName("door_prop")


global function Trigger()

	--local me=script_node.FindProp()
	me:Move(positiona, 2, "lerp")
	Wait(2)
--	me:MoveToOrigin(12, "lerp")
	

end

global function Interact()
	local amy=GetActor("amy")
	local doctor = GetActor("doctor")
	SayPrep("skip", "")	
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	
		--doctor:SetTarget(model)
		--doctor:Face(2,"sine")
		SayPrep("skip","")
		--VO
		--interact with the locked tower door
		doctor::SID_1153: The Door has been bolted from the inside.
		doctor:SetBehaviour("pc")
	else
		SayPrep("skip","")
		--amy:SetTarget(model)
		--amy:Face(2,"sine")
		--VO
		--interact with the locked tower door
		amy::SID_1154: Mr. Chisholm has bolted the Door.
		amy:SetBehaviour("pc")
	end


end
