global script_node
global doors_open
doors_open = false
local show_flushing = true
local button_waypoint

local doctor = GetActor("doctor")
local amy = GetActor("amy")



global function Trigger()
	local amy = GetActor("amy")
	amy:SetBehaviour("wait")
	button_waypoint = FindNodeByName("bilge_button_loc_0")
	amy:Teleport(button_waypoint)
		
		
		Wait(1)
		amy:PlayAnim(FindNodeByPartialName("Anim_AMY_Interact1m"), 1.0, 0.0)
		Wait(1.967)

end




global function Init()
	if(doors_open) then
		--Open bilge pump doors
		local door_0 = FindNodeByName("bilge_door_prop_0")
		local door_1 = FindNodeByName("bilge_door_prop_1")
		local anim = FindNodeByPartialName("Anim_WaterTightDoor_Opening")
		door_0:PlayAnim(anim, 1000.0, 0.0)
		door_1:PlayAnim(anim, 1000.0, 0.0)
	end
end


---------------------------------------------------------------------------
-- Diver stuff
---------------------------------------------------------------------------

local diver_0 = FindNodeByTag("diver_actor_0")
local diver_1 = FindNodeByTag("diver_actor_1")

local num_divers_in_bilge_area = 0

local function KillDivers()

	--Close the bilge pump doors!
	local door_0 = FindNodeByName("bilge_door_prop_0")
	local door_1 = FindNodeByName("bilge_door_prop_1")
	local anim = FindNodeByPartialName("Anim_WaterTightDoor_Closing")
	door_0:PlayAnim(anim, 3.0, 0.0)
	door_1:PlayAnim(anim, 3.0, 0.0)

	local anim = FindNodeByPartialName("Anim_CYS_Death")
	
	diver_0:SetBehaviour("wait")
	diver_0:PlayAnim(anim, 1, 0)
	diver_0:DisableSensors()
	
	diver_1:SetBehaviour("wait")
	diver_1:PlayAnim(anim, 1, 0)
	diver_1:DisableSensors()
	
	num_divers_in_bilge_area = 0
end

local function FlushBilgeTank()

	amy:PlayAnim(FindNodeByPartialName("Anim_AMY_Interact1m"), 1.0, 0.0)
	Wait(1.967)
	
	KillDivers() -- temp, replace with epic cutscene ?
	
	local door = FindNodeByName("bilge_door_prop_entrance")
	local anim = FindNodeByPartialName("Anim_WaterTightDoor_Opening")
	door:PlayAnim(anim, 1.0, 0.0)
	
	Wait(3)
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	-- Enable the teleport/ladder up to the final room
	FindNodeByName("TeleportTrigger_1"):EnableNode()
end

global function BeginDiverGameplay()

	--Open bilge pump doors
	local door_0 = FindNodeByName("bilge_door_prop_0")
	local door_1 = FindNodeByName("bilge_door_prop_1")
	local anim = FindNodeByPartialName("Anim_WaterTightDoor_Opening")
	door_0:PlayAnim(anim, 3.0, 0.0)
	door_1:PlayAnim(anim, 3.0, 0.0)
	doors_open = true

	--amy:EnableStealth()

	local spline_0 = FindNodeByName("DiverSpline_0")
	diver_0:SetSpline(spline_0);
	diver_0:SetBehaviour("patrol")
	--diver_0:EnableSensors()
	
	local spline_1 = FindNodeByName("DiverSpline_1")
	diver_1:SetSpline(spline_1);
	diver_1:SetBehaviour("patrol")
	--diver_1:EnableSensors()
	
	-- Disable the teleport/ladder up to the final room
	FindNodeByName("TeleportTrigger_1"):DisableNode()
	
	--SaveCheckpoint()

end

global function DiverEntersBilgeArea()

	print("Diver has entered bilge area")

	num_divers_in_bilge_area = num_divers_in_bilge_area + 1
	print(num_divers_in_bilge_area)
	
	local trigger_diver = GetTriggerNode():FindActor()
	if(trigger_diver == diver_0) then
		local spline = FindNodeByName("DiverSpline_bilge_0")
		diver_0:SetSpline(spline)
	end
	if(trigger_diver == diver_1) then
		local spline = FindNodeByName("DiverSpline_bilge_1")
		diver_1:SetSpline(spline)
	end
end

global function DiverExitsBilgeArea()

	print("Diver exits bilge area")
	

	num_divers_in_bilge_area = num_divers_in_bilge_area - 1
	print(num_divers_in_bilge_area)

	local trigger_diver = GetTriggerNode():FindActor()
	if(trigger_diver == diver_0) then
		local spline = FindNodeByName("DiverSpline_0")
		diver_0:SetSpline(spline)
	end
	if(trigger_diver == diver_1) then
		local spline = FindNodeByName("DiverSpline_1")
		diver_1:SetSpline(spline)
	end
end

global function DiverLeavesBilgeArea()
	num_divers_in_bilge_area = num_divers_in_bilge_area - 1
end

-- Bilge pump interaction functions
local function BilgePumpHint(line)
	local amy = GetActor("amy")
	SayPrep("skip", "")
	if(line == 0) then
		if(show_flushing) then
			--NEW
			--VO
			--pressing the bilge pump button while being chased. not knowing about the pump
			amy::SID_2622:Looks like some sort of pump room. Maybe I can lure both divers in there and shut the doors.
		else
			amy:SetBehaviour("wait")
			--NEW
			--VO
			--pressing the bilge pump button before both divers are trapped in the room
			amy::SID_2623:I think I need to get both divers in there before I press it again. 
			amy:SetBehaviour("pc")
			amy::SID_2624:There not enough power in this rust bucket to flush a third time.
		end
	else
		if(show_flushing) then
			--NEW
			--VO
			--pressing the bilge pump button while being chased. not knowing about the pump
			amy::SID_2625:I better lose this guy before I investigate the buttons.
		else
			--NEW
			--VO
			--pressing the bilge pump button while being chased. knowing about the pum
			amy::SID_2626:I need to lure him inside the room.
		end

	end
end


global function Interact()
	if(num_divers_in_bilge_area >= 2) then
		amy:SetBehaviour("wait")
		amy:DisableStealth()
		amy:SetTarget(button_waypoint)
		amy:SetMoveTime(1.5)
		amy:SetBehaviour("move")
		Wait(1.5)
		amy:PlayAnim(FindNodeByPartialName("Anim_AMY_Interact1m"), 1.0, 0.0)
		Wait(1.967)
		
		local cutscene = FindNodeByName("Flushing_bilge_full")
		cutscene:Trigger()
		--FlushBilgeTank()
	else
		if amy:IsDetected() then
			BilgePumpHint(1)
		else
			if(show_flushing and num_divers_in_bilge_area == 0) then
				show_flushing = false
				amy:SetBehaviour("wait")
				amy:DisableStealth()
				amy:SetTarget(button_waypoint)
				amy:SetMoveTime(1)
				amy:SetBehaviour("move")
				Wait(1)
				amy:PlayAnim(FindNodeByPartialName("Anim_AMY_Interact1m"), 1.0, 0.0)
				Wait(1.967)
				--give the cutscene an end point
				local cutscene_script = FindNodeByName("script_flushing_bilge_empty")
				cutscene_script.script.amy_waypoint = button_waypoint
				local cutscene = FindNodeByName("Flushing_bilge_empty")
				cutscene:Trigger()
			else

				BilgePumpHint(0)
				--print("We need both divers in the bilge pump")
			end
		end
	end
end

global function Interact0()
	button_waypoint = FindNodeByName("bilge_button_loc_0")
	Interact()
end

global function Interact1()
	button_waypoint = FindNodeByName("bilge_button_loc_1")
	Interact()
end

global function Interact_examine()
	local  doctor = GetActor("doctor")
	SayPrep("skip", "")
	--NEW
	--VO
	--interacting with bilge pump after it has served it's purpose
	doctor::SID_2627: Amy has exhausted the power this pump had left.
end



global function Interact_Watertight_Door_Outside()
	local amy = GetActor("amy")
	local  doctor = GetActor("doctor")
	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()
	SayPrep("skip", "")
	if(doctor_player) then
		--NEW
		--VO
		--interacting with door to bilge area from outside
		doctor::SID_2628: No controls on this side. Looks like we have to find another way forward.

	else	
		--NEW
		--VO
		--interacting with door to bilge area from outside
		amy::SID_2629: I need to find a way to open this from the other side.
	end

end

