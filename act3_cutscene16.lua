global function run_cutscene()
	local alarm= FindNodeByName("audio_mothership_alarm")
	local music = FindNodeByName("CS16_music")
		
	alarm:StopTrigger()
	PlayMusic(music)
	
	--Wait(49)
	--ShowFade()	
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function CreditsWarmup()
	local creditsLoc = FindNodeByPartialName("EM_LOCATOR_Titles_Credits:0")

--enable locator for credits
--warmup particle system
	creditsLoc:EnableNode()
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function HideLetterBoxForCredits()
	LetterBoxOverride(0)
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function RollCredits()
-- cut to credits camera, roll credits

	ShowEndCredits()
	--ShowEpisodeTitle()
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function EndCredits()
	local creditsLoc = FindNodeByPartialName("EM_LOCATOR_Titles_Credits:0")
        
	--hide them again becasue sumotool doesnt reset itself and the last frame of the anim is a full-screen black+text screen
	HideEndCredits() 
        StopMusic()
        
	--hide locator for credits again
      	creditsLoc:DisableNode()
		CutToFade()
      	EndAct()
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function end_cutscene()
      HideLetterBox()
end
-----------------------------------------------------------------
-----------------------------------------------------------------