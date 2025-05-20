global first
first = true

global function Trigger()
	local doctor = GetActor("doctor")
	--local music = FindNodeByName("music_enter_stealth_def")
	--PlayMusic(music)
	doctor:EnableStealth()
	doctor:SetBehaviour("pc")
	
	if(first) then
		first = false
		local cyberman2 = GetActor("cyberman_2")
		local cyberman3 = GetActor("cyberman_3")
		cyberman2:GetTransform():Trigger()
		cyberman3:GetTransform():Trigger()
		SaveCheckpoint()
	end
end