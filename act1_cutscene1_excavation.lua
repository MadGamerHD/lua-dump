global script_node

global function run_cutscene()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	ShowLetterBox()
	local area = FindNodeByShortName("EM_AREA_Episode1_Act1_Area01:0")
	--area:StopTrigger()
	area = FindNodeByShortName("EM_AREA_BG_Snow:0")
	area:Trigger()
	area = FindNodeByShortName("EM_AREA_Cave:0")
	area:Trigger()
	area = FindNodeByName("EM_ENTITY_AfterBurnEM_AREA_Episode1_Act1_Area01_0")
	--area:StopTrigger()
	local music = FindNodeByName("CS1_music")
	PlayMusic(music)
	
	local props = FindNodeByTag("skidoo_model")
	props:Hide()
	local props = FindNodeByTag("skidoo_control")
	props:Hide()
	local props = FindNodeByTag("winch")
	props:Hide()
	
	Wait(1)
	local rope = FindNodeByTag("rope_model")
	rope:StopTrigger()
	
	
	
	
end

global function end_cutscene() --redundant now
	local OverlayManager = FindManagerByName("EmAdventureGame_OverlayManager")
	OverlayManager:SetCallback(script_node, "TitlesOver")
	OverlayManager:ShowTitles()
end

global function TitlesOver()
	--local chisholm = GetActor("chisholm")
	local area = FindNodeByShortName("EM_AREA_Episode1_Act1_Area01:0")
	--area:Trigger()
	--chisholm:GetTransform():SetNodeParent( area )

	area = FindNodeByShortName("EM_AREA_BG_Snow:0")
	area:StopTrigger()
	area = FindNodeByShortName("EM_AREA_Cave:0")
	area:StopTrigger()
	area = FindNodeByName("EM_ENTITY_AfterBurnEM_AREA_Episode1_Act1_Area01_0")
	--area:Trigger()
	--local chisholm = FindNodeByShortName("EM_ENTITY_Chisholm_00")
	--chisholm:SyncDataFromDef()
	
	local props = FindNodeByTag("skidoo_model")
	props:Show()
	local props = FindNodeByTag("skidoo_control")
	props:Show()
	local props = FindNodeByTag("winch")
	props:Show()
	
	--ShowFade()
	Wait(1)
	LetterBoxOverride(1);
	local cutscene_2 = FindNodeByName("Cutscene_2")
	cutscene_2:Trigger()
	--FindNodeByName("lua_transition").script.BlackScreen(3)
	
end


global function ActivateTitles()
	
	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")
	TITLES:ResetProjectBlindData();
	TITLES:EnableNode()

	--local titlesWav = FindNodeByName("titles_wav")
	--PlayMusic(titlesWav)

end

global function DisableTitles()

	local TITLES = FindNodeByShortName("EM_LOCATOR_TitlesActivate:0")
	TITLES:DisableNode();
	
end

-------------------------------------------------
-- Show Episode Title (sumoTool)

global function ShowEpisodeTitleStart()
	
	-- SumoTool Show/Start EpisodeTitle
	ShowIntroTitle();
	
end

-------------------------------------------------
-- Hide Episode Title (sumoTool)

global function HideLetterbox()
	
	-- SumoTool Hide/End EpisodeTitle
	LetterBoxOverride(0);
	
end

-------------------------------------------------
