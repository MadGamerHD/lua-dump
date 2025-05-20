global script_node

-- global variables
global show_instructions
global do_floor_switch_vo
global door_blocked_vo_index
global door_open_vo_index

-- setup global variables
if not IsLoadingSavedGame() then

	show_instructions = true
	do_floor_switch_vo = true
	door_blocked_vo_index = 0
	door_open_vo_index = 0
end

global function DoDoorBlockedRefusal()
	local doctor = GetActor("doctor")
	
	if door_blocked_vo_index == 0 then
		--*NEW
		--VO
		doctor::SID_2668:There's only ocean behind this door now.
	elseif door_blocked_vo_index == 1 then
		--*NEW
		--VO
		doctor::SID_2669:Opening this door without a diver suit would be a bad idea.
	elseif door_blocked_vo_index == 2 then
		--*NEW
		--VO
		doctor::SID_2670:No, the door keeps out the water. And I like breathing.
	end
	
	door_blocked_vo_index = door_blocked_vo_index + 1
	if door_blocked_vo_index == 3 then
		door_blocked_vo_index = 0
	end
end

global function DoDoorAlreadyOpenRefusal()
	local doctor = GetActor("doctor")
	
	if door_open_vo_index == 0 then
		--*NEW
		--VO
		doctor::SID_2671:I could lock the door again but that wouldn't be much help right now.
	elseif door_open_vo_index == 1 then
		--*NEW
		--VO
		doctor::SID_2672:I'm glad I don't have to remember any more codes for this door.
	elseif door_open_vo_index == 2 then
		--*NEW
		--VO
		doctor::SID_2673:It's already open.
	end
	
	door_open_vo_index = door_open_vo_index + 1
	if door_open_vo_index == 3 then
		door_open_vo_index = 0
	end
end
