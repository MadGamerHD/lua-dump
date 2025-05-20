local laser1=FindNodeByName("script_laser1")
local laser2=FindNodeByName("script_laser2")
local mirror0=FindNodeByName("script_mirror0")
local mirror1=FindNodeByName("script_mirror1")
local ControlScript = FindNodeByName("Laser_puzzle_scripts")
local laser1_pos1=FindNodeByShortName("EM_ENTITY_Laser1_Pos1:0") -- left pointing at chair
local laser2_pos1=FindNodeByShortName("EM_ENTITY_Laser2_Pos1:0") -- right pointing at chair
local laser1_pos2=FindNodeByShortName("EM_ENTITY_Laser1_Pos2:0") -- left pointing at mirror
local laser2_pos2=FindNodeByShortName("EM_ENTITY_Laser2_Pos2:0") -- right pointing at mirror
local mirror2_pos1=FindNodeByShortName("EM_ENTITY_LaserBeam_Miss1:0") -- left mirror fire at wrong end
local mirror1_pos1=FindNodeByShortName("EM_ENTITY_LaserBeam_Miss2:0") -- right mirror fire at wrong end
local mirror1_pos2=FindNodeByShortName("EM_ENTITY_LaserBeam_Wall1:0") -- right mirror
local mirror2_pos2=FindNodeByShortName("EM_ENTITY_LaserBeam_Wall2:0") -- left mirror

global function TurnOffAllLasers()
	laser1_pos1:StopTrigger()
	laser2_pos1:StopTrigger()
	laser1_pos2:StopTrigger()
	laser2_pos2:StopTrigger()
	mirror1_pos1:StopTrigger()
	mirror2_pos1:StopTrigger()
	mirror1_pos2:StopTrigger()
	mirror2_pos2:StopTrigger()
end

global function Interact()
	local doctor = GetActor("doctor")
	local cutscene_12_1 = FindNodeByName("wall_blasted_open")
	local cutscene_12_2 = FindNodeByName("wall_not_blasted")

	Stop2dMode()
	
	if(laser1.script.state=="correct") then
		laser1_pos2:Trigger()

		if(mirror0.script.state=="correct") then
			 mirror2_pos2:Trigger()
		else
			 mirror2_pos1:Trigger()
		end
	else
		laser1_pos1:Trigger()
	end
	
	if(laser2.script.state=="correct") then
		laser2_pos2:Trigger()

		if(mirror1.script.state=="correct") then
			mirror1_pos2:Trigger()
		else
			mirror1_pos1:Trigger()
		end
	else
		laser2_pos1:Trigger()
	end
	
	if (laser2.script.state=="correct" and mirror1.script.state=="correct" and laser1.script.state=="correct" and mirror0.script.state=="correct") then
	--Both lasers lined up - hoorah!
		cutscene_12_1:Trigger()	
	else
	--Not all lasers hit mirrors - need to deflect those lasers
		cutscene_12_2:Trigger()
	end	
end
