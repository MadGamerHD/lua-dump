global function run_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local chisholm = GetActor("chisholm")
		Wait(1)
		HideFade()

		local loc_node =FindNodeByName("loc_doctor_at_rope")
		doctor:Teleport(loc_node)
		local loc_node =FindNodeByName("loc_chisholm_at_rope")
		chisholm:Teleport(loc_node)
		local loc_node =FindNodeByName("loc_amy_hoist_chisholm")
		amy:Teleport(loc_node)		

		SayPrep("skip", "")
		

		
		--CUT SCENE 3
		--INT. ICE CAVE -- DAY
		--THE DOCTOR has CHISHOLM roped up.  AMY is above them, on the skidoo, ready to winch the injured man up.
		doctor::SID_0035: Don't worry. We'll soon have you sorted out.
		doctor::SID_0034: All right, Amy.  Start the motor.

		-- Amy tosses rope down from above after tying it to skidoo
		doctor::SID_0036:That's the way. Brilliant!
		

		--And then the ice cave is hit by another tremor - and the ice opens up beneath the skidoo.
		--Any shouts in panic.
		amy::SID_0037: Doctor!
		Wait(1)
		doctor::SID_0038:Jump!


		--doctor:: [The Skidoo tumbles over the edge, Chisholm falls down, The Doctor is knocked back almost losing his screwdriver]
		Wait(1)
		local loc_node =FindNodeByName("loc_doctor_fall_from_skidoo")
		doctor:Teleport(loc_node)
		local loc_node =FindNodeByName("loc_chisholm_fall_from_skidoo")
		chisholm:Teleport(loc_node)
		Wait(0.25)
		local wall = FindNodeByTag("ice_barrier")
		local control = FindNodeByTag("skidoo_control")
		control:StopTrigger()
		local winch = FindNodeByTag("winch")
		winch:StopTrigger()
		local SatNav = FindNodeByName("SatNav")
		
		if (doctor:IsInventoryItem(SatNav) or amy:IsInventoryItem(SatNav)) then
		else
			FindNodeByTag("skidoo_track"):Trigger()
			--FindNodeByName("int_SatNav"):Trigger()
		end
		
		local skidoo = FindNodeByTag("skidoo_model")
		skidoo:StopTrigger()
		--local fallen_skidoo = FindNodeByName("fallen_skidoo")
		--skidoo:Move(fallen_skidoo, 0.25, "lerp")
		skidoo = FindNodeByName("FACT_skidoo")
		skidoo:Trigger()
		Wait(0.25)
		wall:StopTrigger()
		Wait(2)

		--The Doctor throws Chisholm aside as the skidoo crashes. Recovering, and seeing that the injured Chisholm is relatively unharmed...
		--to Chisholm
		doctor::SID_0039:Amy? Are you all right?
		
		--doctor::SID_0039: Well, that didn't go quite to plan.
		
		--to Amy (shouting up to her high ledge)
		--doctor::SID_1020:Amy?  Are you all right?
		
		--Peeping over the edge...
		amy::SID_0040: I'm okay! But you look kind of stuck.


		--The Doctor looks around - the skidoo has punched a hole through an ice sheet - revealing another exit.
		doctor::SID_0041: Don't think so. The Skidoo did the trick after all. There's another way out of here!
		
		--doctor::SID_0041:No. Actually looks like the skidoo did the trick after all. Sort of. It's opened up another way out.
		Wait(1)

		--Then the ice shakes again.  Ice falls from the roof.
		amy::SID_0042:You'd better get a move on. These shoes really aren't much good on ice. Especially when it's shaking!
	
		--The Doctor helps Chisholm up.
		doctor::SID_0043:Erm, come on. Don't mean to worry you, but the whole plateau could be about to collapse.
		local loc_node =FindNodeByName("loc_doctor_end_cs3")
		doctor:Teleport(loc_node)
		

		
		local chisholm = GetActor("chisholm")

		local chisholm_script = FindNodeByName("chisholm_script")
		chisholm_script.script.UnlockLocator(1)
		chisholm_script.script.UnlockLocator(2)
		chisholm_script.script.UnlockLocator(3)
		chisholm_script.script.UnlockLocator(4)
	
			--Use the rope to hoist Chisholm
		SetGlobalObjectiveState("Cyber_1_3_2", 3) -- 2 is unlock, 3 is done
		--Get back to the TARDIS
		AddGlobalObjective("Cyber_1_4")
		SetGlobalObjectiveState("Cyber_1_4_1", 2) -- 2 is unlock, 3 is done
		--Make sure CHisholm can follow
		SetGlobalObjectiveState("Cyber_1_4_2", 2) -- 2 is unlock, 3 is done

end
	
