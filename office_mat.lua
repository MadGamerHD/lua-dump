
if not IsLoadingSavedGame() then
	local mat = GetActor("office_mat")
	mat:EnableSensors()

end


global function Interact()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	SayPrep("skip", "")
	--HINT
	--cybermat blocking the way
	doctor::SID_0407: Come on little fella. Shoo.
	--VO
	--cybermat blocking the way
	doctor::SID_0408: Hmm, he's not going anywhere.
	
end

global function Use()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local sonic = FindNodeByName("Screwdriver")
	if(doctor:IsUsingInventoryItem(sonic) ) then
		local cutscene = FindNodeByName("cybermat_scurries_CS6_3")
		cutscene:Trigger()
		local computer = FindNodeByName("int_computer")
		computer:Trigger()
	else
		FindNodeByName("common_scripts").script.RandomRefusal()	
	end
end

global function Trigger()
	ShowLetterBox()
	local doctor=GetActor("doctor")
	local mat=GetActor("office_mat")
	doctor:SetBehaviour("wait")
	mat:SetTarget(doctor)
	mat:SetMoveTime(0.6)
	--mat:SetMaxSpeed(2.5)
	mat:SetBehaviour("move")
	Wait(0.45)
	local anim = FindNodeByShortName("EM_ANIMATOR_Cybermat_Anim_Cybermat_ReadyToAttack")
	mat:PlayAnim(anim, 1, 0.5)
	local audio_bite = FindNodeByName("audio_cybermat_attacks")
	audio_bite:Trigger()
	Wait(0.5)
	
	doctor:Die("electric")
end



