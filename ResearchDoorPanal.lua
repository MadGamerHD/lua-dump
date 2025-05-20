global DoorOpen
global script_node

DoorOpen = 0

global function Interact()
	local doctor = GetActor("doctor")
	SayPrep("skip", "")
	
	if DoorOpen == 0 then
		--VO
		--Examine the door panal for the locked door in the central research room
			doctor::SID_1041:The Dalek Sensor isn't quite powerful enough to open this door. I'll need to bypass the security seal.
	else
		--VO
		--Examine the door panal for the locked door in the central research room (door opened)
			doctor::SID_1889:The security lock has been bypassed.
	end
end

global function Use()
	local doctor = GetActor("doctor")
	local screwdriver = FindNodeByName("screwdriver")
	local docScript = FindNodeByName("DoctorScript_0")
	local crystal = FindNodeByName("CrystalObj")
	local use_loc = FindNodeByName("use_sonic")
	
	SayPrep("skip", "")
	
	if (doctor:IsInventoryItem(crystal)) then
		if doctor:IsUsingInventoryItem(screwdriver) and DoorOpen == 0 then
			DoorOpen = 1

			doctor:SetBehaviour("wait")
			doctor:SetTarget(use_loc)
			doctor:SetMaxSpeed(2)
			doctor:SetBehaviour("move")
			doctor:SetCallback(script_node, "AtLoc")
		else
			docScript.script.NoPoint()
		end
	else
		--NEW
		--VO 
		--Trying to escape the research room without crystal
			doctor::SID_1043:I need to search this room thoroughly before I leave.
	end
end

global function AtLoc()
	local doctor = GetActor("doctor")
	local doorScript = FindNodeByName("DoorPropLuaScript_9")
	local use_sonic = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_SonicUseFromIdle")
	local sonic_anim = FindNodeByShortName("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle")
	local sonic_script = FindNodeByName("Sonic_Script:0")
	local ResearchDoorTrigger = FindNodeByName("ResearchDoorTrigger")
	
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_SonicUseFromIdle", 1.25)
	doctor:PlayAnimAndWaitBlendOut(use_sonic,1,0.5,0.5)
	doorScript.script.ForceOpenDoor()
	ResearchDoorTrigger:StopTrigger()
	doctor:SetBehaviour("pc")

	--NEW
	--VO
	--Used screwdriver on  the security panal in the research room to get the door open.
		doctor::SID_1042:Just needed a little boost!	
end
