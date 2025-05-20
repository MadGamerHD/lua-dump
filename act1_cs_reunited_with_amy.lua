



global function run_cutscene()

	local chisholm=GetActor("chisholm")
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
	
	local ambience = FindNodeByName("ambience_upper_cave")
	ambience:Trigger()	
	local ambience = FindNodeByName("ambience_far_cave")
	ambience:StopTrigger()	
	
	chisholm:SetBehaviour("wait")
	doctor:Teleport(FindNodeByName("loc_reunion_doctor1"))
	amy:Teleport(FindNodeByName("loc_reunion_amy1"))
	chisholm:Teleport(FindNodeByName("loc_reunion_chisholm1"))
	Wait(1)
	SayPrep("","")
	--chisholm::SID_0073:We have to get out of here.
	--amy::SID_0074:Too right.
	
	--CUT SCENE 4
	--EXT. ICE CAVE -- DAY
	--THE DOCTOR and CHISHOLM reach AMY, waiting at the TARDIS.
	doctor::SID_0075:Soon get you back to your base. Where is it?

	--doctor:: [CHISHOLM LOOKS TERRIFIED]
	
	--But Chisholm pulls away from the Doctor.  Electrified with fear.
	chisholm::SID_0076:Not there! No! No! I can't go back there! No!
	doctor::SID_0077:Why? What's wrong?
	chisholm::SID_0078:Waiting... They were waiting! 
	amy::SID_0079:He's delirious!
	doctor::SID_0080:No, Amy... He's terrified.
	
	chisholm::SID_0081:They were waiting for us! Under the ice!
	--And Chisholm spins away, tries to run.  Slips and falls, banging his head on the ice. 
	

	--And Chisholm spins away, tries to run. Slips and falls, banging his head on the ice.
	--THE DOCTOR has laid CHISHOLM down. Still out cold.
	--RE-RECORD
	--Needs emphasis on now'.
	doctor::SID_0082:Well, he's not going to tell us where he came from now...
	amy::SID_0083:So we're going to have to find it ourselves?
	doctor::SID_0084:Exactly. Whatever has happened there, someone sent an SOS. So there are people there who need our help. 
	
		--FInd another way up
		SetGlobalObjectiveState("Cyber_1_4_1", 3) -- 2 is unlock, 3 is done
		--Make sure CHisholm can follow
		SetGlobalObjectiveState("Cyber_1_4_2", 3) -- 2 is unlock, 3 is done
		--find out where Chisholm came from
		

	Wait(0.5)	
	local SatNav = FindNodeByName("SatNav")
	if (amy:IsInventoryItem(SatNav)) or (doctor:IsInventoryItem(SatNav)) then
		local satnav_cutscene = FindNodeByName("talk_about_satnav_cs4_1")
		satnav_cutscene:Trigger()
	else
		local satnav_cutscene = FindNodeByName("talk_about_satnav_cs4_2")
		satnav_cutscene:Trigger()

	end

end
