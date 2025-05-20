--global toggle


-- CLOSE the door

local left_door=FindNodeByName("inner_front_door_left") 
local right_door=FindNodeByName("inner_front_door_right") 
local loc_right_door=FindNodeByName("loc_inner_front_door_right")
local loc_left_door=FindNodeByName("loc_inner_front_door_left")  
local stoggle=FindNodeByName("script_inner_front_door")



global function Trigger()
		stoggle.script.people_in_door  = stoggle.script.people_in_door-1
		if(stoggle.script.toggle == "open" and stoggle.script.people_in_door == 0) then
			FindNodeByName("script_inner_front_door").script.toggle  = "closed"
			local audio_door = FindNodeByName("audio_GSO_door_close")
			audio_door:Trigger()
			left_door:MoveToOrigin(1, "lerp")
			right_door:MoveToOrigin(1, "lerp")
			--toggle = "closed"
			WaitFrame()
		end

end



