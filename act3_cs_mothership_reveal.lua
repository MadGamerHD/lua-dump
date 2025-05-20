global function run_cutscene()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local amy_point = FindNodeByName("loc_csb_amy0")	
	local doc_point = FindNodeByName("loc_csb_doc0")
	local loc1 = FindNodeByName("loc_doctor1_csb")
	local loc2 = FindNodeByName("loc_amy1_csb")
	local subwayArea = FindNodeByTag("area02")

	ShowLetterBox()
	doctor:DisableStealth()
	amy:DisableStealth()
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	amy:Teleport(amy_point)
	doctor:Teleport(doc_point)
	
	SayPrep("skip", "")
	
	--CUT SCENE 10
	--INT. EXCAVATION. ABOVE THE CYBERMAN SHIP -- DAY
	--THE DOCTOR and AMY hide, looking down on the partially excavated Cyberman ship.  It is huge.  
	--The side of the ship has been torn open.  There are parts of Cybermen still stuck in the ice.  
		doctor::SID_0363:Must've crashed here before the last ice age.  
	
	doctor:DisableStealth()
	doctor:SetTarget(loc1)
	doctor:SetMaxSpeed(1)
	doctor:SetBehaviour("move")
	
	Wait(2)
	amy:SetTarget(loc2)
	amy:SetMaxSpeed(1)
	amy:SetBehaviour("move")
	
	doctor:GetTransform():SetNodeParent( subwayArea )
	amy:GetTransform():SetNodeParent( subwayArea )
 
		amy::SID_0364:And it's just been waiting here for someone to dig it out?
		doctor::SID_0365:The Cybermen will be in suspended animation but the ship will have been sentient since it crashed. Listening for signs of life on the surface.  
		doctor::SID_0366:When it heard the GSO excavating it sent out the Cybermats. Clever stuff, really. And deadly.  
		doctor::SID_0367:Once the Cybermen are awake they'll complete their mission; Cyber-conversion of every human being on Earth. 
	--The Doctor leads Amy cautiously along a gantry towards the ship.
	
end

global function end_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	
	HideLetterBox()
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	
	--Find a way through the tunnels
	SetGlobalObjectiveState("Cyber_3_1", 3) -- 2 is unlock, 3 is done
	--Find a way to the controlroom
	AddGlobalObjective("Cyber_3_2")
	--Negotiate the gantries
	SetGlobalObjectiveState("Cyber_3_2_1", 2) -- 2 is unlock, 3 is done
end
