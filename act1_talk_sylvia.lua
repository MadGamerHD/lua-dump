global script_node
global about_to_run_to_escape

global function Interact()
	local sylvia = GetActor("sylvia")
	local hint = QueryObjective(0)                 
	--The 0 refers to the first active objective in the case of multiple objectives.
	SayPrep("skip", "")
	if(hint == "hint_132a" or hint == "hint_132b") then
	--HINT
	--Ask Sylvia for hint at fusebox, electrified tracks still on.
		sylvia::SID_0903:We can't go any further 'til those rail lines are safe.
	elseif (hint == "hint_133a" or hint == "hint_133b") then
	--HINT
	--Ask Sylvia for hint at dynamite before they attempt escape.
		sylvia::SID_0918:Hurry Doctor. The exit is just there.
	end
end

local function RunToEscapeInternal()
	local sylvia = GetActor("sylvia")
	local sylvia_escape_start = FindNodeByName("sylvia_escape_start")	

	about_to_run_to_escape = false
	sylvia:SetTarget(sylvia_escape_start)
	sylvia:SetMaxSpeed(4)
	sylvia:SetBehaviour("move")
	sylvia:EnableMoveWalls()
end

global function Init()
	if about_to_run_to_escape then
		RunToEscapeInternal();
		about_to_run_to_escape = false
	end
end

global function RunToEscape()
	about_to_run_to_escape = true

	-- Wait is to allow the savegame to complete
	Wait(1.5)

	about_to_run_to_escape = false
	RunToEscapeInternal()
end