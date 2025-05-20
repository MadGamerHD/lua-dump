global script_node

global function ActorText()
end

global function StartScene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")

	CutToLetterBox()
	amy:SetBehaviour("wait")
	doctor:SetBehaviour("wait")

	PlayMusic(FindNodeByName("Cut1_MusicDef"))
end

global function StartCut2()
	local Cut_2 = FindNodeByName("Cut_2")

	HideLetterBox()
	Cut_2:Trigger()
end

global function EndScene()
	FindNodeByTag("Panel1"):StopTrigger()
	FindNodeByTag("Panel2"):StopTrigger()
	FindNodeByTag("Panel3"):StopTrigger()
	FindNodeByTag("Panel4"):StopTrigger()
	FindNodeByTag("Panel5"):StopTrigger()
	FindNodeByTag("Panel6"):StopTrigger()
	FindNodeByName("CombinationScriptControl").script.SleepControls()
	FindNodeByName("Quantums"):Sleep()
	FindNodeByName("ConsoleAmbiance"):Sleep()
	
	-- controls audio
	FindNodeByShortName("tape_loop"):Sleep()
	FindNodeByShortName("Ob_6_1Sound"):Sleep() -- Gyroscope
	FindNodeByShortName("Atom_Audio"):Sleep()
	FindNodeByShortName("cooling"):Sleep()
end

-------------------------------------------------
-- End Of Titles Sequence

global function DisableTitles()
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")

	TITLES:DisableNode();
end

global function ShowEpisodeTitleStart()
	-- SumoTool Show/Start EpisodeTitle
	ShowIntroTitle();
end
-------------------------------------------------
-- Hide Episode Title (sumoTool)

global function HideLetterBox()
	-- SumoTool Hide/End EpisodeTitle
	LetterBoxOverride(0);
end

global function DisableTitles()
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")

	TITLES:DisableNode();
end

global function EndTitles()
	StartCut2()
	LetterBoxOverride(1);
end
--------
global function Titles()
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")

	TITLES:ResetProjectBlindData();
	TITLES:EnableNode()
	PlayMusic(FindNodeByName("titles_wav_def"))
end
	