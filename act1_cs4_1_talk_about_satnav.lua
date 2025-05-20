global function run_cutscene()
	local chisholm=GetActor("chisholm")
	local amy=GetActor("amy")
	local doctor=GetActor("doctor")
	local focus_node =FindNodeByName("loc_satnav_in_hand_focus")
	
	
--	local loc_node =FindNodeByName("loc_cs4_doc_end")
--	doctor:Teleport(loc_node)
--	local amy_node =FindNodeByName("loc_cs4_amy_end")
--	amy:Teleport(amy_node)
--	ShowLetterBox()
--	local SatNav = FindNodeByName("SatNav")
--	amy:AddInventoryItem(SatNav )
	
	
	SayPrep("","")
	local SatNav = FindNodeByName("SatNav")
	if (amy:IsInventoryItem(SatNav)) then
		--CUT SCENE 4.1
		--Dialogue options depending upon whether the Doctor or Amy has found the SatNav on the Skidoo. 
		--OPTION 1: If Amy has picked up the SatNav
		amy::SID_0085:I grabbed a Sat Nav from the Skidoo before it fell. That might tell us where to go.
		doctor:SetTarget(amy)
		amy:SetTarget(doctor)
		doctor:Face(0.5,"lerp")
		doctor::SID_0086:Amy. You're brilliant. Let's have a look.
		doctor:SetFocus(focus_node)
		amy:Face(1.0,"lerp")
		Wait(0.5)
		amy:SetFocus(focus_node)
		amy::SID_0087:It could have taken a bit of a battering. Might not work.
		
		--rubbing hands together
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking3") --3.76s
		doctor:PlayAnim(anim, 1, 0)
		
		amy:SetFocus(doctor)
		doctor::SID_0088:I repaired the Great Klaxian Generators of Thraad.
		doctor:SetFocus(amy)
		SayPrep("skip", "async")
		anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Defensive") --5s
		--crossing arms, shaking head slightly
		amy:PlayAnim(anim, 1, 0.5)
		--*EDIT had to cut up one line (0088) into three.
		doctor::SID_1014: I got the ionic-flux engines of the Djagradorf Imperial Flagship running with an old chewing gum wrapper and a mousetrap. 
		Wait(3)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointForward") --3.7s
		doctor:PlayAnim(anim,1,0.5)
		Wait(2.5)
		SayPrep("","")
		--*EDIT had to cut up one line (0088) into three.
		doctor::SID_1015: I think I can fix a Sat Nav.
		amy:RemoveInventoryItem(SatNav)
		doctor:AddInventoryItem(SatNav)
		
		AddGlobalObjective("Cyber_1_6")
		--Find the sat nav
		SetGlobalObjectiveState("Cyber_1_6_1", 3) -- 2 is unlock, 3 is done
		--connect the Sat Nav to the TARDIS
		SetGlobalObjectiveState("Cyber_1_6_2", 2) -- 2 is unlock, 3 is done
		--local jump = FindNodeByName("Lua_Teleport_2_Tardis")
		--jump:Trigger()
			
	elseif (doctor:IsInventoryItem(SatNav)) then

		amy:SetTarget(doctor)
		amy:Face(1.0,"lerp")
		doctor:SetTarget(amy)
		doctor:Face(0.5,"lerp")
		SayPrep("", "async")

		--OPTION 2: If the Doctor has picked up the SatNav
		doctor::SID_0900:Good thing I salvaged the Sat Nav from the Skidoo. That should help point us in the right direction.
		Wait(2)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkDefensive2") --4.1s
		--shy? hands folded in front. Looking at ground
		doctor:PlayAnim(anim, 1, 0)
		Wait(1)
		amy:SetFocus(focus_node)
		Wait(1)
		amy::SID_0090:Hmm. It looks a bit smashed up to me.
		Wait(3)
		amy:SetFocus(doctor)
		SayPrep("skip", "")
		doctor:SetFocus(amy)
		doctor::SID_0091:I repaired the Great Klaxian Generators of Thraad. 
		
		anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Defensive") --5s
		--crossing arms, shaking head slightly
		amy:PlayAnim(anim, 1, 0.5)
		
		--rubbing hands together
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking3") --3.76s
		doctor:PlayAnim(anim, 1, 0)
		--*EDIT had to cut up one line (0091) into three.
		doctor::SID_1016: I got the ionic-flux engines of the Djagradorf Imperial Flagship running with an old chewing gum wrapper and a mousetrap. 
		amy:SetBehaviour("wait")
		
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPointForward") --3.7s
		doctor:PlayAnim(anim,1,0.5)
		--*EDIT had to cut up one line (0091) into three.
		doctor::SID_1017: I think I can fix a Sat Nav.
		doctor::SID_0092: If I hook this up to the TARDIS, I can rewire it in no time.
		
		AddGlobalObjective("Cyber_1_6")

		--Find the sat nav
		SetGlobalObjectiveState("Cyber_1_6_1", 3) -- 2 is unlock, 3 is done
		--connect the Sat Nav to the TARDIS
		SetGlobalObjectiveState("Cyber_1_6_2", 2) -- 2 is unlock, 3 is done
		--local jump = FindNodeByName("Lua_Teleport_2_Tardis")
		--jump:Trigger()

	end
	
	doctor:ClearFocus()
	
	local waypoint =FindNodeByName("loc_cs4_1_doc_2_chisholm")
	doctor:SetTarget(waypoint)
	doctor:SetMoveTime(3)
	doctor:SetBehaviour("move")
	
	

end