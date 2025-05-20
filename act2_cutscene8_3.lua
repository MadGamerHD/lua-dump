global script_node

global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	ShowLetterBox()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	HideFade()

end

global function end_cutscene()
	CutToFade()
	local doctor = GetActor("doctor")

	local cybermat_part=FindNodeByName("cybermat_part")
	if (doctor:IsInventoryItem(cybermat_part)) then
		--local cutscene = FindNodeByName("radio_room_csc2")
		local cutscene = FindNodeByName("Cutscene_8_4")
		cutscene:Trigger()
	else
		cybermat_part = FindNodeByName("script_cybermat_part")
		cybermat_part.script.has_played_radio = true
		HideLetterBox()
		doctor:SetBehaviour("pc")
		doctor:EnablePhysics()
	end
end
