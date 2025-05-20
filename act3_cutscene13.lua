global script_node

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local cyber4 = GetActor("cyberman_4")
	local cyber5 = GetActor("cyberman_5")
	local music = FindNodeByName("cs13_music")
	local ambience1 = FindNodeByName("ambience_active_mothership")
	local ambience2 = FindNodeByName("ambience_control_room")
	
	ShowLetterBox()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	
	cyber4:GetTransform():StopTrigger()
	cyber5:GetTransform():StopTrigger()
			
	PlayMusic(music)
	ambience1:StopTrigger()
	ambience2:Trigger()	
end

global function End()
	local cs13_end = FindNodeByName("Cutscene_13_end")
	
	cs13_end:Trigger()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(3)
end
