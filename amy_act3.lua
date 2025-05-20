global model

global function Interact()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0)                 
	--The 0 refers to the first active objective in the case of multiple objectives.
	local struggle = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_StruggleInChair")

	SayPrep("skip", "async")
	
	if amy:IsDetected() then
	--HINT
	--Talk Amy - detected in stealth mode.
	--*NOTE: If detected and escaping Daleks no hint given.
		amy::SID_2035:Run!
	
	else
		amy:ClearFocus()
		if(hint == "hint_311a") then
			--HINT
			--Amy's helpful hints Act3 - stealth section
			amy::SID_0388:All these Cyberslaves look like they're patrolling. But I think we can slip past.
		elseif (hint == "hint_321a") then
			--HINT
			--Amy's helpful hints Act3 - pneumatic lifts (These lifts won't hold both of us - wrong as they hold three!)
			amy::SID_0392:To get up there, we could use the lifts in turns.
		elseif (hint == "hint_343a") then
			local doctors_head_locator = doctor:FindNodeByTag("head_locator")

			--HINT
			--Amy's helpful hints Act3 - open cuffs (a)
			amy::SID_0393:Get these cuffs off me.
			amy:PlayAnimAndWait(struggle,1,0.5)
			amy:SetFocus(doctors_head_locator)
		elseif (hint == "hint_343b") then
			local doctors_head_locator = doctor:FindNodeByTag("head_locator")

			--HINT
			--Amy's helpful hints Act3 - open cuffs (b)
			amy::SID_0394:You must be able to open them somehow. The Screwdriver?
			amy:SetFocus(doctors_head_locator)
		elseif (hint == "hint_351a") then
			--HINT
			--Amy's helpful hints Act3 - find the weak wall (a)
			doctor::SID_0395:We can't go through the door, they'll catch us instantly.
		elseif (hint == "hint_351b") then
			--HINT
			--Amy's helpful hints Act3 - find the weak wall (b)
			amy::SID_0396:Then we'll have to go through the wall.
		elseif (hint == "hint_352a") then
			--HINT
			--Amy's helpful hints Act3 - blast the wall
			amy::SID_0397:Can't we use the Lasers somehow?
		elseif (hint == "hint_361a") then
			--HINT
			--Amy's helpful hints Act3 - put the cybermen to sleep
			amy::SID_1006:Let's go straight to the Control Room.
		elseif (hint == "hint_362a") then
			--HINT
			--Amy's helpful hints Act3 - put the cybermen to sleep
			amy::SID_1007:Can you configure the Computer to put the Cybermen back to sleep?
		elseif (hint == "hint_371a") then
			--HINT
			--Amy's helpful hints Act3 - back to the lift
			amy::SID_1008:There's a shortcut back to the Lift over the gantries.
		elseif (hint == "hint_371b") then
			--HINT
			--Amy's helpful hints Act3 - back to the lift
			amy::SID_1009:Let's go straight back to the Lift. 
		else
			--HINT
			--Amy's helpful hints Act3 - general talk
			amy::SID_1012:Let's have a look around.
		end
	end
end

global function Trigger()
	local amy = GetActor("amy")
	--local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_CChairIdle")
	local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_GetOutOfChair")
	--local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_E1_StruggleInChair")
	amy:PlayAnim(anim_amy, 1, 0.1)
end

