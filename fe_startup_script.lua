global script_node

local menu_manager = FindManagerByName("EmAdventureGame_MenuManager")
local camera = FindNodeByTag("FE_MAIN_CAMERA")
local skip = false

camera:CutTo()

global function IntroLoop()
	menu_manager:SetFEAnimation(1)

	local DrProp = FindNodeByName("DrIntroProp")
	local DrAnim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_Cutscene_FE_01_Characters_Loop")
	
	local AmyProp = FindNodeByName("AmyIntroProp")
	local AmyAnim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Cutscene_FE_01_Characters_Loop")
	
	local DoorProp = FindNodeByName("DoorIntroProp")
	local DoorAnim = FindNodeByShortName("EM_ANIMATOR_Door_Anim_Cutscene_FE_01_Characters_Loop")

	DrProp:PlayAnim(DrAnim, 1, 0)
	AmyProp:PlayAnim(AmyAnim, 1, 0)
	DoorProp:PlayAnim(DoorAnim, 1, 0)
end

global function ExitTardis()
	menu_manager:SetFEAnimation(1)

	local DrProp = FindNodeByName("DrIntroProp")
	local DrAnim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_Cutscene_FE_01_Characters")
	
	local AmyProp = FindNodeByName("AmyIntroProp")
	local AmyAnim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Cutscene_FE_01_Characters")
	
	local DoorProp = FindNodeByName("DoorIntroProp")
	local DoorAnim = FindNodeByShortName("EM_ANIMATOR_Door_Anim_Cutscene_FE_01_Characters")

	DrProp:PlayAnim(DrAnim, 1, 0)
	AmyProp:PlayAnim(AmyAnim, 1, 0)
	DoorProp:PlayAnim(DoorAnim, 1, 0)
	DoorProp:SetCallback(script_node,"ExitTardisEnd")
	WaitFrame()
	WaitFrame()
	WaitFrame()
	DrProp:GetTransform():Show()
	AmyProp:GetTransform():Show()
end

global function ExitTardisEnd()
	if not skip then
		menu_manager:SetFEAnimation(0)
		IntroLoop()
	end
end

global function EnterTardis()
	menu_manager:SetFEAnimation(1)
	skip = true

	local DrProp = FindNodeByName("DrIntroProp")
	local DrAnim = FindNodeByShortName("EM_ANIMATOR_TheDoctor_Anim_Cutscene_FE_01_Characters_Exit")
	
	local AmyProp = FindNodeByName("AmyIntroProp")
	local AmyAnim = FindNodeByShortName("EM_ANIMATOR_Amy_Anim_Cutscene_FE_01_Characters_Exit")
	
	local DoorProp = FindNodeByName("DoorIntroProp")
	local DoorAnim = FindNodeByShortName("EM_ANIMATOR_Door_Anim_Cutscene_FE_01_Characters_Exit")

	DrProp:PlayAnim(DrAnim, 1, 0)
	AmyProp:PlayAnim(AmyAnim, 1, 0)
	DoorProp:PlayAnim(DoorAnim, 1, 0)	
	DoorProp:SetCallback(script_node,"EnterTardisEnd")
end

global function EnterTardisEnd()
	menu_manager:SetFEAnimation(0)
end

global function Trigger()
	ExitTardis()
end