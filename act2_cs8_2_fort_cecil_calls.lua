global script_node

global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local cecil=GetActor("cecil")
	SayPrep("skip","")
	--amy:SetBehaviour("wait")
	
	--CUT SCENE 8.03
	--Triggered by walking out of the room or interacting with the radio.
	--INT. RADIO ROOM  DAY
	--As they turn to go - over the radio... (O.S.)
	cecil::SID_0297:Fort Cecil to GSO Zebra Bay. Fort Cecil to GSO Zebra Bay, do you read me? Confirming supply delivery.
	Wait(1)
	doctor::SID_0298:What? They can't! They can't come here! We have to stop them!
	--He rushes to the radio.  Grabs the mic.
	doctor::SID_0299:Fort Cecil, this is GSO Zebra Bay. Stay away! Do you hear me? Stay away!
	cecil::SID_0300:Do you read us?
	amy::SID_0301:It's not working. 
	--The Doctor notes damage to the radio set from fallen pipe. 
	doctor::SID_0302:The Capacitor's blown.
	amy::SID_0303:Like that means anything to me.
	

	local cybermat_part=FindNodeByName("cybermat_part")
	if (doctor:IsInventoryItem(cybermat_part)) then
		local cutscene = FindNodeByName("radio_room_csc2")
		cutscene:Trigger()
	else
		cybermat_part = FindNodeByName("script_cybermat_part")
		cybermat_part.script.has_played_radio = true
		local end_cutscene = FindNodeByName("LuaDoctorCutscene")
		end_cutscene.script.End()
	end
end
