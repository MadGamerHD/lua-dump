

global toggle
global people_in_door
people_in_door = 0
-- OPEN the door

local left_door=FindNodeByName("prop_office_door") 
local loc_left_door=FindNodeByName("loc_office_door")  

if not IsLoadingSavedGame() then
	toggle = "closed"
	people_in_door = 0
end

global function Trigger()
	people_in_door = people_in_door+1
	if(toggle == "closed") then
		toggle = "open"
		local audio_door = FindNodeByName("audio_GSO_door_open")
		audio_door:Trigger()
		left_door:Move(loc_left_door, 1, "lerp")
		WaitFrame()
	end
end

