--21
--plays on interaction with amy standing by the emperor

--21.1
--21.2
--21.3
--21.4
--ends GAME OVER
-----------------------------------------------------------------
-----------------------------------------------------------------
global function Start()
      local doctor = GetActor("doctor")
      local amy = GetActor("amy")
      local tick_tock = FindNodeByName("tick_tock")
      local smoke = FindNodeByName("gens_smoke")

      smoke:StopTrigger()
      tick_tock:StopTrigger()
            
      SayPrep("skip", "")
      ShowLetterBox()

      doctor:SetBehaviour("wait")
--     amy:StopInvisibility()

end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function End_21()
      FindNodeByName("lua_transition").script.BlackScreen(3)
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function Start_21_1()
      local daleks = FindNodeByName("council_daleks")
      local music = FindNodeByName("music_21_1")

      PlayMusic(music)
      daleks:StopTrigger()
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function End_21_1()
      FindNodeByName("lua_transition").script.BlackScreen(3)
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function Start_21_2()
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function End_21_2()
      FindNodeByName("lua_transition").script.BlackScreen(3)
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function Start_21_3()
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function End_21_3()
      FindNodeByName("lua_transition").script.BlackScreen(3)
end
-----------------------------------------------------------------
-----------------------------------------------------------------
global function Start_21_4()
	local chronon = FindNodeByTag("Chronon")	
	chronon:Hide()
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
global function End()
      HideLetterBox()
end
-----------------------------------------------------------------
-----------------------------------------------------------------