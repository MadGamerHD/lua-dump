global script_node
global model
global option
option = 0
local anim_amy = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_AMY_Interact1m")
local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_InteractPanel")
local common_scripts = FindNodeByName("common_scripts")
local first = true

global function Trigger()
	local amy=GetActor("amy")
	local loc = FindNodeByName("loc_locker")
	amy:SetTarget(loc)
	amy:SetMoveTime(1)
	amy:SetBehaviour("move")
	Wait(1)
	SayPrep("skip", "async")
	--VO
	--interact with locker door have code
--	amy::SID_0873:Let's see if Chisholm's code works.
	amy:PlayAnim(anim_amy, 1, 0.1)
	Wait(1)
	
	local audio_door = FindNodeByName("audio_locker_door")
	audio_door:Trigger()	
	local capacitor = FindNodeByName("Int_capacitor_3d")
	capacitor:Trigger()
	local me = script_node:FindProp()
	local positiona = FindNodeByName("loc_locker_door")
	me:Move(positiona, 2, "lerp")
	local int_node = FindNodeByName("int_locker")
	amy:SetBehaviour("pc")
	SayPrep("skip", "")
	int_node:StopTrigger()
end
	
global function Interact()
	local amy=GetActor("amy")
	local doctor = GetActor("doctor")
	SayPrep("skip", "")	
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	if(doctor_player) then	
		if(first) then
			--doctor:PlayAnim(anim, 1, 0.1)
			--Wait(1)
			--VO
			--interacting with locker with code - option 1
			first = false
			doctor::SID_1157: Locked.
		else
			--VO
			--interacting with locker with code - option 1
			doctor::SID_2408: Locked. I need to concentrate on the Cybermats for now.
		end
		doctor:SetBehaviour("pc")
	else

		local tower=FindNodeByName("script_intercom") 
		local got_code = tower.script.got_locker_code
		if(got_code) then
			local loc = FindNodeByName("loc_locker")
			amy:SetTarget(loc)
			amy:SetMoveTime(1)
			amy:SetBehaviour("move")
			Wait(1)
			SayPrep("skip", "async")
			--VO
			--interact with locker door have code
			amy::SID_0873:Let's see if Chisholm's code works.
			amy:PlayAnim(anim_amy, 1, 0.1)
			Wait(1)
			
			local audio_door = FindNodeByName("audio_locker_door")
			audio_door:Trigger()	
			local capacitor = FindNodeByName("Int_capacitor_3d")
			capacitor:Trigger()
			local me = script_node:FindProp()
			local positiona = FindNodeByName("loc_locker_door")
			me:Move(positiona, 2, "lerp")
			local int_node = FindNodeByName("int_locker_use")
			amy:SetBehaviour("pc")
			SayPrep("skip", "")
			int_node:StopTrigger()
			--door:StopTrigger()

		else
			if(option == 0) then
				option = 1
				--VO
				--interacting with locker with code - option 1
				amy::SID_0447:There's a code lock on this cabinet.
			elseif(option == 1) then
				option = 2
				--VO
				--interacting with locker with code - option 2
				amy::SID_0449:Maybe Chisholm knows the code.
			else
				option = 0
				--VO
				--interacting with locker with code - option 3
				amy::SID_0448: I don't think I can guess the code.
			end
			amy:SetBehaviour("pc")
		end
	end
end

global function Use()
	local doctor =GetActor("doctor")
	local Sonic = FindNodeByName("Screwdriver")
	if doctor:IsUsingInventoryItem(Sonic) then
		SayPrep("skip", "")
		doctor::SID_1885: I'm not raiding people's lockers without good reason.
	else
		FindNodeByName("common_scripts").script.RandomRefusal()	
	end
end
