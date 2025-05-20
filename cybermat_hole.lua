global model
global first

global function Interact()
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	
		local doctor=GetActor("doctor")
		--doctor:SetTarget(model)
		--doctor:Face(2,"sine")
		SayPrep("skip","")
		if(first == nil) then
			--VO
			--examine cybermat hole, first
			doctor::SID_0146: I think the Cybermat disappeared into the main station. 
			first = 1
		else
			--VO
			--examine cybermat hole, second
			doctor::SID_0147:Cybermats like hiding in air vents and dank cellars. They'll have a nest somewhere by now.
		end
		doctor:SetBehaviour("pc")
	else
		
		local amy=GetActor("amy")
		SayPrep("skip","")
		--amy:SetTarget(model)
		--amy:Face(2,"sine")
		--VO
		--examine cybermat hole
		amy::SID_0148: That creepy Cybermat went through there.
		amy:SetBehaviour("pc")
	end
end
