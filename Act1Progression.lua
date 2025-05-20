
global script_node

local doctor = GetActor("doctor")
local amy = GetActor("amy")

global keypad_difficulty
if not IsLoadingSavedGame() then
	keypad_difficulty = 0
end

global function GetKeypadSequenceLength()
	if(keypad_difficulty == 0) then
		return 3
	elseif(keypad_difficulty == 1) then
		return 3
	elseif(keypad_difficulty == 2) then
		return 4
	elseif(keypad_difficulty == 3) then
		return 4
	else
		return 5
	end
end

global function IncreaseKeypadDifficulty()
	keypad_difficulty = keypad_difficulty + 1
end



