global model
global script_node
global go_creaking

go_creaking = false
local positiona = FindNodeByName("loc_moving_platform2")
local audio_crack = FindNodeByName("audio_2d_ice_crack3")
local me=script_node:FindProp()

global function Idle()
	me:WaterBob(0.05)
	Wait(18)
	me:Move(positiona, 12, "acc")
	if(go_creaking) then
		audio_crack:Trigger()
	end
	Wait(18)
	me:MoveToOrigin(12, "acc")
	if(go_creaking) then
		audio_crack:Trigger()
	end
end