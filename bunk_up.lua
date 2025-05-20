
global function Interact()

	local doctor = GetActor("doctor")
	local chisholm = FindNodeByName("chisholm_script")
	local chisholm_ready = chisholm.script.chisholm_pos
	SayPrep("skip", "async")
	
	if(chisholm_ready == 4) then
		--doctor::SID_0058: Come on, I'll give you a bunk up here.
		local me = FindNodeByName("bunk_up_int")
		chisholm.script.chisholm_pos = 5
		--chisholm.script.current_locator = 9
		chisholm = GetActor("chisholm")
		chisholm:Teleport(FindNodeByName("loc_chisholm9"))
		me:StopTrigger()
	else
		--VO
		--interacting with bunk up
		--doctor::SID_0059: I'll have to give Chishom a push up this ledge. But first I need to get him here.
	end

end
