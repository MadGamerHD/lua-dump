global script_node

local doctor = FindNodeByName("TheDoctor_Actor_0")
local amy = FindNodeByName("Amy_Actor_0")


global function Trigger()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("pc")
end

---------------------------------------------------------------------------
-- Steam vent shenanigans
---------------------------------------------------------------------------
global function SteamPlayer()

	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()

	if(doctor_player) then
		doctor:Die("steam")
	else
		amy:Die("steam")
	end
end

global function ShockPlayer()

	local doctor_player =FindNodeByName("common_scripts").script.DoctorIsPlayer()

	if(doctor_player) then
		doctor:Die("electric")
	else
		amy:Die("electric")
	end
end



global function TeleportToBildgeArea()
	local teleport_target = FindNodeByName("BildgeTeleportTarget")
	amy:Teleport(teleport_target)
	
	local bilge_gameplay = FindNodeByName("BilgePumpGameplayScript")
	bilge_gameplay.script.BeginDiverGameplay()
end

global function TeleportToFinalRoom()
	doctor:Teleport(FindNodeByName("FinalRoomTeleportTarget_Doctor"))
	amy:Teleport(FindNodeByName("FinalRoomTeleportTarget_Amy"))
end



--local cutscene = FindNodeByName("ActiveCutScene_10")
--cutscene:Trigger()


--test code
local current_intensity = 15.0
local target_intensity = 15.0
local ticks_until_update = 20

global function Idle()

	ticks_until_update = ticks_until_update - 1
	
	if ticks_until_update <= 0 then
		target_intensity = Random(10 + 15)
	end
	current_intensity = (current_intensity + (target_intensity - current_intensity) / 20.0)
	
	FindNodeByName("AccelleratorLight"):SetAttr("IntensityMultiplier", current_intensity)
end
-- end test code
