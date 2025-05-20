--Cutscene 1
--ends with titles

global script_node

-------------------------------------------------
-- Start Of Cutscene 1

global function PerformCutscene1()
	FindNodeByName("Shark_Prop_0"):Sleep()
	CutToLetterBox()
	local music = FindNodeByName("cs1_music")

	PlayMusic(music)

end

-------------------------------------------------
-- End Of Cutscene 1

global function EndCutscene1()
	local blue_door = FindNodeByTag("cs1_blue_door")
	local green_door = FindNodeByTag("cs1_green_door")
	local amb_creak = FindNodeByName("amb_creak")
	
	amb_creak:StopTrigger()
	
	blue_door:Trigger()
	green_door:Trigger()
	FindNodeByName("Shark_Prop_0"):Wake()
end

-------------------------------------------------
-- Show Episode Title (sumoTool)

global function ShowEpisodeTitleStart()
	-- SumoTool Show/Start EpisodeTitle
	ShowIntroTitle();
end

global function DisableTitles()
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")
	TITLES:DisableNode();
end

-------------------------------------------------
-- Hide Episode Title (sumoTool)

global function HideLetterbox()
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")

	TITLES:Show()

	-- SumoTool Hide/End EpisodeTitle
	LetterBoxOverride(0);
end

-------------------------------------------------
-- Start Of Titles Sequence

global function Titles()
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")
	TITLES:ResetProjectBlindData();
	TITLES:EnableNode()
	TITLES:Hide()
	--DebugPrint("TriggerDone Supposedly")
	
	local titlesWav = FindNodeByName("titles_wav")
	PlayMusic(titlesWav)
end

-------------------------------------------------
-- End Of Titles Sequence

global function EndTitles()
	local cutscene = FindNodeByName("ActiveCutScene_2")
	cutscene:Trigger()
	FindNodeByName("lua_transition").script.BlackScreen(15)
	LetterBoxOverride(1);
end

-------------------------------------------------


