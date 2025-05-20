global script_node

local inposition = 0

global function Interact()
	local eye_script = FindNodeByName("examine_consoles")
	eye_script.script.ShowConsoleText()
end

global function Use()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local eye_script = FindNodeByName("eye_disabled_script_0")	
	local screwdriver = FindNodeByName("screwdriver")
	local doc_loc = FindNodeByName("console5_doc_loc")
	local amy_loc = FindNodeByName("console5_amy_loc")
	local RandomRef = FindNodeByName("RandomRefusalScript")
	
	if doctor:IsUsingInventoryItem(screwdriver) then
		eye_script.script.HackNextConsoleSpeech()
		SetSayCallback(script_node, "Hack")
		
		doctor:SetBehaviour("wait")
		doctor:SetTarget(doc_loc)
		doctor:SetMoveTime(2)
		doctor:SetBehaviour("move")
		doctor:SetCallback(script_node,"SonicAnim")
		
		amy:SetTarget(amy_loc)
		amy:SetMoveTime(2)
		amy:SetBehaviour("move")
		amy:SetCallback(script_node,"Hack")
	else
		RandomRef.script.RandomRefusal()
	end
end

global function SonicAnim()
	local doctor = GetActor("doctor")
	local use_sonic = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_DRW_Crouch_InteractSS")
	local sonic_script = FindNodeByName("Sonic_Script:0")
		
	sonic_script.script.PlayAnim("EM_ANIMATOR_sonic_INGAME_Anim_SON_Crouch_InteractSS", 1.25)
	doctor:PlayAnimBlendOut(use_sonic,1,0.5,0.5)
	doctor:SetCallback(script_node,"Hack")	
end

global function Hack()
	local eye_script = FindNodeByName("eye_disabled_script_0")
	local beep = FindNodeByName("console_beep1")
	local console = FindNodeByName("Console1Interact")
	local consoleH = FindNodeByName("Console1InteractHacked")
	
	inposition = inposition+1

	--Called three times, amy in position, doc in position+ played anim and speech complete
	if inposition == 3 then
		eye_script.script.HackNextConsole()
		beep:Trigger()
		console:Sleep()
		consoleH:Wake()
	end
end



