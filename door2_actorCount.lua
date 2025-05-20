global actors_in_range
actors_in_range = 0

-- In a seperate script as this can get called when the Doctor is interacting with the door
-- causing the action to be overwritten
global function DoorOpen()
	actors_in_range = actors_in_range  + 1
end
