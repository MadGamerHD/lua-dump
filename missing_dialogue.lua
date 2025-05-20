global function Temp()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")	
	local chisholm = GetActor("chisholm")
local cyberman = GetActor("cyberman")	
	
	--NEW
	--HINT
	--Missing dialogue to be reinserted
		chisholm::SID_1580:Thank you, thank you.

	--NEW
	--Missing dialogue to be reinserted
		amy::SID_1582:Uh?

	
	--NEW
	--Missing dialogue to be reinserted
		amy::SID_1586:Right Doctor, let’s get out of here.
end

global function OldTrigger()
	local block = FindNodeByName("prop_icecube_first")
	local anim = FindNodeByShortName("EM_ANIMATOR_IceBlock_Anim_IceBlockAnim_1")
	block:PlayAnim(anim, 1, 0)
--	Wait(5)
	local block = FindNodeByName("prop_icecube")
	local anim = FindNodeByShortName("EM_ANIMATOR_IceBlock_Anim_IceBlockAnim_2")
	block:PlayAnim(anim, 1, 0)
end

global function Trigger()
		local amy = GetActor("amy")
		local doctor = GetActor("doctor")
		
		doctor::[POSITIVE TWO]
		--nod, hand on hip
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Positive02") --5s
		amy:PlayAnim(anim, 1, 0)
		
		Wait(10)
		
		doctor::[ POSITIVE 1]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Positive01") -- 3s
		--nod
		amy:PlayAnim(anim, 1, 0)
		
			Wait(10)
		
		doctor::[ PLEADING]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Pleading") -- 5.3s
		--pray
		amy:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[NEGATIVE ONE]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Amy_Talk_Negative01") --3s
		--shake head
		amy:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[GENERIC ONE]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Generic1") --5.3s
		--hand gesture, left our first
		amy:PlayAnim(anim, 1, 0)
				Wait(4)
		
		
		doctor::[TALK_DEFENSIVE ]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Defensive") --5s
		--crossing arms, shaking head slightly
		amy:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[ CONCERNED]
		local anim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Talk_Concerned") -- 5.2s
		-- shake head, hand to cheek
		amy:PlayAnim(anim, 1, 0)

end

global function moreTrigger()
		local doctor = GetActor("doctor")
		doctor::[TALK_THINKING 3]
		--rubbing hands together
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking3") --3.76s
		doctor:PlayAnim(anim, 1, 0)
		
		Wait(10)
		
		doctor::[TALK_THINKING 2]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking2") -- 4s
		--holding haead in hand
		doctor:PlayAnim(anim, 1, 0)
		
			Wait(5)
		
		doctor::[TALK_THINKING 1]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkThinking1") -- 4.9s
		--head in hand again
		doctor:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[TALK_POSITIVE]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkPositive1") --4.3s
		--formal nodding
		doctor:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[TALK_forcefully]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkForcefully") --2.6s
		--point and hammer
		doctor:PlayAnim(anim, 1, 0)
				Wait(4)
		
		
		doctor::[TALK_DEFENSIVE 2]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkDefensive2") --4.1s
		--shy? hands folded in front. Looking at ground
		doctor:PlayAnim(anim, 1, 0)
				Wait(5)
		
--		doctor::[TALK_DEFENSIVE 1]
--		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkDefensive1") -- 4.6s
		--facing wrong way, sliding backwards (arms across chest)
--		doctor:PlayAnim(anim, 1, 0)
--				Wait(10)
		
		doctor::[TALK_CONCERN 2]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern2") -- 4.0s
		--finger in forehead
		doctor:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[TALK_concern 1]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_TalkConcern1") --3.8s
		-- back head scratching
		doctor:PlayAnim(anim, 1, 0)
				Wait(5)
	
		
		doctor::[TALK_nEGATIVE]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk negative 1") -- 1.7s
		--arms out in helpless shrug, shaking head
		doctor:PlayAnim(anim, 1, 0)
				Wait(4)
		
		doctor::[TALK 3]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk3") --4.8s
		--hands behind back, then left hand out
		doctor:PlayAnim(anim, 1, 0)
				Wait(5)
		
		doctor::[TALK 2]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk2") --2.6s
		--right hand out, left hand out
		doctor:PlayAnim(anim, 1, 0)
				Wait(4)
		
		doctor::[TALK 1]
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Talk1") --3.8s
		--hands behind back
		doctor:PlayAnim(anim, 1, 0)
				Wait(5)
end
