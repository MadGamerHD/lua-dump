


-- CLOSE the door

local left_door=FindNodeByName("prop_office_door") 
local loc_left_door=FindNodeByName("loc_office_door")  
local stoggle=FindNodeByName("script_office_door")



global function Trigger()
		stoggle.script.people_in_door  = stoggle.script.people_in_door-1
		if(stoggle.script.toggle == "open" and stoggle.script.people_in_door == 0) then
			FindNodeByName("script_office_door").script.toggle  = "closed"
			local audio_door = FindNodeByName("audio_GSO_door_close")
			audio_door:Trigger()
			left_door:MoveToOrigin(1, "lerp")
			--toggle = "closed"
			WaitFrame()
		end

end

