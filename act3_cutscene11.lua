global script_node

global function Start()
	local ambience1 =FindNodeByName("ambience_tunnels")
	local ambience2 = FindNodeByName("ambience_control_room")
	local music = FindNodeByName("CS11_music")

	ambience1:StopTrigger()
	ambience2:Trigger()
	PlayMusic(music)
end

global function End()
	local cs11_end = FindNodeByName("Cutscene_11_end")

	cs11_end:Trigger()
	FindNodeByName("lua_transition").script.BlackScreenNoDelay(5)
end
