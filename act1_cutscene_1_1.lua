--1.1
--played after cs1
--ends with titles

global script_node

-------------------------------------------------
-- Start Of Cutscene 1_1

global function Start()
	local music = FindNodeByName("music_1_1")
	local tard_amb = FindNodeByName("tard_amb")	
	local traf_amb = FindNodeByName("traf_amb")	

	PlayMusic(music)
	tard_amb:StopTrigger()	
	traf_amb:Trigger()
end

-------------------------------------------------
-- End Of Cutscene 1_1

global function End()

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
	
	-- SumoTool Hide/End EpisodeTitle
	LetterBoxOverride(0);
	
end

-------------------------------------------------
-- Start Of Titles Sequence

global function Titles()
	
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")
	TITLES:ResetProjectBlindData();
	TITLES:EnableNode()
	--DebugPrint("TriggerDone Supposedly")
	
	local titlesWav = FindNodeByName("titles_wav")
	PlayMusic(titlesWav)
	
end

-------------------------------------------------
-- End Of Titles Sequence

global function EndTitles()

	local cutscene_2 = FindNodeByName("cutscene_2")
	cutscene_2:Trigger()
	FindNodeByName("lua_transition").script.BlackScreen(3)
	LetterBoxOverride(1);

end

-------------------------------------------------



