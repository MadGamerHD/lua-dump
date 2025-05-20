
global model
global script_node
global go_creaking

go_creaking = false
local positiona = FindNodeByName("loc_moving_platform1")
local audio_crack = FindNodeByName("audio_2d_ice_crack1")
local me=script_node:FindProp()

global function Idle()
	--me:WaterBob(0.1)
	me:WaterBobSide(0.05)
	Wait(6)
	if(go_creaking) then
		audio_crack:Trigger()
	end
	me:Move(positiona, 6, "sine")
	Wait(12)
	if(go_creaking) then
		audio_crack:Trigger()
	end
	me:MoveToOrigin(6, "sine")
	Wait(6)
end


