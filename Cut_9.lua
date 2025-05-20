global function StartScene()
	local doctor = GetActor("doctor")

	CutToLetterBox()

	doctor:SetBehaviour("wait")

	FindNodeByName("ConsoleAmbiance"):Trigger()
	FindNodeByName("TARDIS_Ambiance"):Trigger()

	PlayMusic(	FindNodeByName("DocMusicDef"))
end


global function EndScene()
	local doctor = GetActor("doctor")
	local crystal = FindNodeByName("KontronCrystal")
	local watch =  FindNodeByName("FobWatch")

	HideLetterBox()

	doctor:SetBehaviour("pc")

	--Find out what is happening
	--Find the Date Bank
	--Find the Voltmeter
	AddGlobalObjective("Objective_2_1")

	FindNodeByName("AllControlsScript").script.ResetAllControls()
end
