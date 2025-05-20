global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	ShowLetterBox()
	
	local music = FindNodeByName("music_exposition_16s")
	PlayMusic(music)
	
	SayPrep("skip","")
	Wait(0.5)
	local loc_doc  = FindNodeByName("loc_cs7_2_doc1")
	--doctor:SetTarget(loc_doc)
	doctor:SetTarget(amy)
	doctor:Face(0.5, "sine")
	
	
	--CUT SCENE 7.2
	--mini cutscene after succesful minigame. objective intructions
	doctor::SID_0252: Excellent. I've setup the Beacon to emit an amplified sonic burst.
	amy:SetFocus(doctor)
	
	local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Pleading") -- 5.3s
		--pray
		amy:PlayAnim(anim, 1, 0)
	amy::SID_0253:So set it off, and all the Cybermats in the station go bang?
	--doctor:SetTarget(amy)
	--doctor:Face(0.5, "sine")
	doctor:SetFocus(amy)
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern1") --3.8s
		-- back head scratching
		amy:SetBehaviour("wait")
		doctor:PlayAnim(anim, 1, 0)
	doctor::SID_0254:Afraid it's not quite that simple. To make sure we take out as many Cybermats as possible we have to drop it right into their Nest.
	local hatch=FindNodeByName("script_cs7_3")
	doctor:SetBehaviour("wait")
	doctor:SetTarget(loc_doc)
	if(hatch.script.nest_spotted) then
		--OPTION 1: If the Cybermat nest has already been located:
		amy::SID_0255: So back to the Nest, then?
		SayPrep("", "async")
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2") --2.6s
		--right hand out, left hand out
		doctor:PlayAnim(anim, 1, 0)
		doctor::SID_0256:Amy, you're a star. And even brighter than Alpha Ceti Beta 6.
		Wait(2)
		doctor:ClearFocus()
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")
		SetGlobalObjectiveState("Cyber_2_4_3", 2) -- 2 is unlock, 3 is done
		Wait(1)
	else
		--OPTION 2: If the Cybermat nest has NOT already been located:
		amy::SID_0257: And where is the Nest?
		SayPrep("", "async")
		doctor:ClearFocus()
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2") --2.6s
		--right hand out, left hand out
		doctor:PlayAnim(anim, 1, 0)
		doctor::SID_0258: That is what we need to find out!
		Wait(1)
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")
		Wait(2)
	end



end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	amy:ClearFocus()
	local mdb = FindNodeByName("modified_distress_beacon")
	doctor:AddInventoryItem(mdb)
	HideLetterBox()
local music = FindNodeByName("background_music")
		PlayMusic(music)
	
	doctor:SetBehaviour("pc")
	doctor:EnablePhysics()
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	--doctor:EnableStealth()
	--amy:EnableStealth()
end
