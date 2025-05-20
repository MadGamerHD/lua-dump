global model
global script_node
global melted
local wall=FindNodeByTag("tunnel_wall2")
local first


melted = false


global function BridgeLand()

	local drop_sound = FindNodeByName("audio_bridge_falls")
	drop_sound:Trigger()
	local wall_sound = FindNodeByName("audio_ice_wall_collapse") --7.8s
	wall_sound:Trigger()
	
	--local collision = FindNodeByName("bridge_collision_more")
	--collision:StopTrigger()
	local collision = FindNodeByName("bridge_collision")
	collision:StopTrigger()
	Wait(1)
	local exit_wall = FindNodeByTag("Ice_wall")
	exit_wall:StopTrigger()
	exit_wall = FindNodeByName("EM_ENTITY_AfterBurn_Icewall")
	exit_wall:StopTrigger()
	
	local chisholm_script = FindNodeByName("chisholm_script")
	chisholm_script.script.UnlockLocator(13)
	chisholm_script.script.UnlockLocator(14)
	local doctor=GetActor("doctor")
	HideLetterBox()
	doctor:SetBehaviour("pc")
	--SaveCheckpoint()
end

local function BridgeFall()
	local prop = script_node:FindProp()
	--prop_bridge_Platform
	local position_a = FindNodeByTag("bridge_platform_a")
	prop:Move(position_a, 1.5, "acc")
	local anim = FindNodeByTag("column_anim")
	local particles = FindNodeByName("Ice_wall_effects")
	anim:Trigger()
	particles:Trigger()
	Wait(2.75)

	local int_node=FindNodeByTag("bridge_platform_int")
	int_node:StopTrigger()
	local stop_trigger = FindNodeByName("trigger_remember_chisholm2")
	stop_trigger:StopTrigger() -- no longer stop Doc from progressing
	BridgeLand()
end


global function Interact()
	local doctor = GetActor("doctor")
	local SwitchLocator = FindNodeByName("loc_bridge_platform")
	doctor:SetTarget(SwitchLocator)
	doctor:SetCallback(script_node, "InteractMoveFinished")
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")
end

global function InteractMoveFinished()
	local doctor = GetActor("doctor")
	local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Into_Push")
	SayPrep("skip","")
	if(melted) then
		
		ShowLetterBox()
		--VO
		--Said while pushing very heavy ice stalactite
		doctor::SID_0057: Now, just a sharp push.
		local camera_cut=FindNodeByName("cutscene_falling_bridge")
		camera_cut:Trigger()
		doctor:PlayAnimAndWait(anim, 1, 0.1)
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Push")
		doctor:PlayAnim(anim, 1, 0.1)
		--Wait(1)

		Wait(1)
		local audio_ice = FindNodeByName("audio_ice_crack_column")
		audio_ice:Trigger()
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_OutOf_Push")
		doctor:PlayAnim(anim, 1, 0.1)
		BridgeFall()
	else
		doctor:PlayAnimAndWait(anim, 1, 0.1)
		Wait(0.5)
		anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_OutOf_Push")
		doctor:PlayAnim(anim, 1, 0.1)
		Wait(0.6)
		if (first == nil) then
			--*NEW
			--VO
			--Try to push the stalagmite – first time
			doctor::SID_1143: The ice is slightly too thick to just push.
			first = 1
		else
			--*NEW
			--VO	
			--Try to push the stalagmite – second time
			doctor::SID_1144: It's too thick to just push... If only I could find a way to melt it slightly.
		end
		doctor:SetBehaviour("pc")
	end
end

global function Push()
	ShowLetterBox()
	LockActorCamera()
	local doctor = GetActor("doctor")
	local SwitchLocator = FindNodeByName("loc_bridge_platform")
	doctor:SetTarget(SwitchLocator)
	doctor:SetCallback(script_node, "UseMoveFinished")
	doctor:SetMoveTime(1)
	doctor:SetBehaviour("move")

end
global function UseMoveFinished()
	SayPrep("", "async")
	local doctor=GetActor("doctor")
	

		doctor:SetBehaviour("wait")
		local sonic_script = FindNodeByName("Sonic_Script:0")
		sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 0.75)
		local anim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle") --4.3
		melted = true
		--NEW
		--VO
		--using sonic on Ice pillar
		doctor::SID_2406:I'll just heat the area around its base
		doctor:PlayAnim(anim, 1, 0.1)
		Wait(3)
		local audio_ice = FindNodeByName("audio_ice_crack_column")
		audio_ice:Trigger()
		Wait(1.3)
		
		HideLetterBox()
		FreeActorCamera()
		doctor:SetBehaviour("pc")

	SayPrep("skip", "")

end

global function Use()
	local doctor=GetActor("doctor")
	local screwdriver = FindNodeByName("Screwdriver")
	if (doctor:IsUsingInventoryItem(screwdriver)) then
		
	
		if(melted) then
			SayPrep("", "async")
			local doctor=GetActor("doctor")
			--NEW
			--VO
			--using sonic on melted Ice pillar
			doctor::SID_2465:I've melted the base a bit. Pushing might work now.
		else
		
			Push()
		end
	else
		--*NEW
		--VO
		--using wrong item on stalagmite
		doctor::SID_1145: That won't do any good. It needs something hot.
	end
end

global function Trigger()
	local prop = script_node:FindProp()
	prop:TeleportToOrigin()
	BridgeFall()
end
