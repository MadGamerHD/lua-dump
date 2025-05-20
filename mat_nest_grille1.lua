global spotted_nest
global script_node
global not_blown_yet

not_blown_yet = true

global function Interact()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")

	SayPrep("skip","")
	
	
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	
		if(not_blown_yet) then
			if(spotted_nest==nil) then
				doctor:SetBehaviour("wait")
				spotted_nest=true
				local cutscene=FindNodeByName("found_cybermat_nest_cs7_3")
				cutscene:Trigger()
				
				
			else
				local mdb=FindNodeByName("modified_distress_beacon")
				local have_MDB=doctor:IsInventoryItem(mdb)
				if(have_MDB) then
					--VO. interacting with the vent to the cybermat nest, have beacon
					doctor::SID_0229: If I use the Sonic to distract the Cybermats, then Amy might be able to drop the Beacon into the Nest from up there.
				else
					--VO. interacting with the vent to the cybermat nest, doesn't have beacon
					doctor::SID_0230: I could use the Sonic to distract the Mats, Amy could get at the Nest, but we still need to find something to help us disable them.
				end
				doctor:SetBehaviour("pc")
				amy:SetTarget(doctor)
				amy:SetBehaviour("follow")
				amy:SetMaxSpeed(6)
			end
		else
			doctor::SID_2023: The Cybermat nest is completely destroyed.
		end
	else
		amy::SID_2024: The nest is destroyed now.
	end
end

global function after_spot_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local mdb=FindNodeByName("modified_distress_beacon")
	local have_MDB=doctor:IsInventoryItem(mdb)
	if(have_MDB) then
		SetGlobalObjectiveState("Cyber_2_4_3", 2) -- 2 is unlock, 3 is done
		not_blown_yet = false
		local cutscene = FindNodeByName("blowing_nest_cs7_4")
		cutscene:Trigger()
	else
		local cutscene = FindNodeByName("go_to_beacon")
		cutscene:Trigger()
		--HINT
		doctor::SID_0850:But first we need to find a weapon of some kind to use on them.
		doctor:SetBehaviour("pc")
		doctor:EnablePhysics()
		amy:SetTarget(doctor)
		amy:SetBehaviour("follow")
		--doctor:EnableStealth()
		--amy:EnableStealth()
		HideLetterBox()
		local music = FindNodeByName("background_music")
		PlayMusic(music)

	end
end

global function Use()

	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local mdb=FindNodeByName("modified_distress_beacon")
	local use_MDB=doctor:IsUsingInventoryItem (mdb)
	local sonic=FindNodeByName("Screwdriver")
	local use_sonic=doctor:IsUsingInventoryItem (sonic)
	if(use_MDB) then
		local cutscene = FindNodeByName("blowing_nest_cs7_4")
		cutscene:Trigger()
	elseif(use_sonic) then
		local have_MDB=doctor:IsInventoryItem(mdb)
		if(have_MDB) then
			local cutscene = FindNodeByName("blowing_nest_cs7_4")
			cutscene:Trigger()
		end
	else
		local nah = FindNodeByName("common_scripts")
		nah.script.RandomRefusal()
	end
end





global function Amy_In_Place()

	local amy = GetActor("amy")
	local amy_locator = FindNodeByName("loc_amy_climb_to_nest1")
	amy:SetTarget(amy_locator)
	amy:SetMaxSpeed(2)
	amy:SetBehaviour("move")

	amy:SetCallback(script_node,"AmyClimb1")
	amy:DisableWalls()

end

global function AmyClimb1()
	local amy = GetActor("amy")
	local amy_climb = FindNodeByPartialName("amy_Anim_AMY_ClimbUp1m")
	amy:DisablePhysics()
	amy:PlayAnim(amy_climb,1,0)
	amy:DisableAnimLoop()
	amy:SetCallback(script_node,"WalkNext")
end

global function WalkNext()

	local amy = GetActor("amy")
	local amy_locator = FindNodeByName("loc_amy_climb_to_nest2")
	amy:SetTarget(amy_locator)

	amy:SetBehaviour("move")
	--amy:DisableWalls()
	amy:SetCallback(script_node,"AmyClimb2")

end

global function AmyClimb2()
	local amy = GetActor("amy")
	local amy_climb = FindNodeByPartialName("amy_Anim_AMY_ClimbUp1m")
	--local amy_climb = FindNodeByPartialName("AMY_ClimbUp1m")

	amy:PlayAnim(amy_climb,1,0)
	amy:DisableAnimLoop()
	
	amy:SetCallback(script_node,"AmyDone")
end

global function AmyDone()
	local doctor=GetActor("doctor")
	local amy = GetActor("amy")
	--amy:EnablePhysics()
	--ShowFade()
	--doctor:SetBehaviour("pc")
	--local cutscene = FindNodeByName("radio_room_csc")
	---cutscene:Trigger()
end

global function Trigger()
--for testing only
	local doctor=GetActor("doctor")
	local mdb=FindNodeByName("modified_distress_beacon")
	doctor:AddInventoryItem(mdb)
end
