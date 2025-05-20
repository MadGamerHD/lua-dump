global checking_danger_state

checking_danger_state = false

global function Stealth_off()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local loc = FindNodeByName("amy_move_tolift")
	local music = FindNodeByName("background_music")	

	doctor:DisableStealth()
	amy:DisableStealth()
	PlayMusic(music)				
	
	WaitFrame()
	amy:SetTarget(loc)
	amy:SetMoveTime(2)
	amy:SetBehaviour("move")
end



global function Trigger()
	local amy = GetActor("amy")
	
	if amy:IsDetected() then
		checking_danger_state = true
		
	else
		Stealth_off()
	end
end


global function Idle()
	if(checking_danger_state) then
		local amy = GetActor("amy")
		if amy:IsDetected() then
			Wait(1)
		else	
			checking_danger_state = false
			Stealth_off()
		end
	end
end