global first
global model

global function Interact()
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	
		local doctor=GetActor("doctor")
		--doctor:SetTarget(model)
		--doctor:Face(2,"sine")
		SayPrep("skip","")
		--*EDIT (from:This vent releases steam when the button is pressed.)
		--VO
		--interacting with steam vent
		doctor::SID_0135:A Steam Vent.
		--doctor:SetBehaviour("pc")
	else
		local amy=GetActor("amy")

		--amy:SetTarget(model)
		--amy:Face(2,"sine")
		SayPrep("skip","")
		if(first == nil) then
			--find a tool to use against cyberslave
			SetGlobalObjectiveState("Cyber_2_2_1", 3) -- 2 is unlock, 3 is done
			--block the flow of the steam vent

			SetGlobalObjectiveState("Cyber_2_2_2", 2) -- 2 is unlock, 3 is done
			--*EDIT (from:This vent releases steam when the button is pressed.)
			--VO
			--interacting with steam vent
			amy::SID_0136:It's a Steam Vent.
			first = 1
		else
			--VO
			--interacting with steam vent, second time
			amy::SID_1151:If I could find way to trigger the Steam from this Vent...
		end
		--amy:SetBehaviour("pc")
	end
end
