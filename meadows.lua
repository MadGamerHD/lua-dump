global script_node
local first
local asked_about_base
local asked_about_slaves
local full_conversation
local cycle_hint


local idle_time = 0
local POIs =
	{
		"loc_meadows_poi_1",
		"loc_meadows_poi_2", 
		"loc_meadows_poi_3"
	}


full_conversation = true
cycle_hint = 1

global function Trigger()
	StopPOIWait()
	ResetPlayerCamera()
end

--CYBER_MEADOWS_BASE:     Tell about GSO.
--CYBER_MEADOWS_SLAVES: Tell about Cyberslaves.
global function Interact()
	local meadows=GetActor("meadows")
	if(full_conversation) then
		local doctor=GetActor("doctor")
		
		ShowLetterBox()
		local waypoint = FindNodeByName("loc_meadows_talk")
		meadows:SetTarget(waypoint)
		waypoint = FindNodeByName("loc_meadows_talk_doc")
		doctor:SetTarget(waypoint)
		doctor:SetMoveTime(1)
		doctor:SetBehaviour("move")
		
		local camera_view = FindNodeByName("spline_meadows_talk_Node")	
		SetPOIPosAndLookZ(camera_view)
		BeginPOI(2, 400, 2, true, true)
		
		Wait(1)
		
		

		
		meadows:SetBehaviour("move")
		meadows:SetMoveTime(0.5)
		Wait(0.5)
		meadows:SetFocus(doctor)
		
		local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
		DecisionManager:AddOption("icon2.tga", "CYBER_MEADOWS_BASE", script_node, "Decision1") -- GSO
		DecisionManager:AddOption("icon1.tga", "CYBER_MEADOWS_SLAVES", script_node, "Decision2") --meadows
		DecisionManager:Start()
	else
		SayPrep("skip", "")	
		if (cycle_hint == 1) then
			--HINT
			cycle_hint = 2
			meadows::SID_1538:As I told you, we came to investigate the irregular readings under the ice.
		else
			--HINT
			meadows::SID_0425:Look, I really need to work on this Serum.
		end
	end
end

global function Decision1()
	local doctor=GetActor("doctor")
	local meadows=GetActor("meadows")
	SayPrep("skip", "")	
	doctor:SetBehaviour("wait")

	--CUT SCENE 7.01
	--HINT. DIALOGUE TREE
	--DIALOGUE TREE 
	--Question 1 -  talking to Meadows about the GSO
	doctor::SID_0418:Can you tell me about the base?
	meadows::SID_0419:Survey readings showed up irregular results under the ice. We came to investigate them.
	doctor::SID_0420:Irregular? How?
	meadows::SID_0421: A geo-physics scan showed shapes that looked like large man-made structures.
	meadows::SID_0422: We thought it was an indication of a pre-ice age settlement.
	doctor::SID_0423: But it wasn't human?
	meadows::SID_0424: No
	asked_about_base = true
	if(asked_about_slaves) then
		HideLetterBox()
		doctor:SetBehaviour("pc")
		local loc = FindNodeByName("loc_cs7_end_meadows_table")
		meadows:SetTarget(loc)
		meadows:ClearFocus()
		meadows:SetMoveTime(1)
		meadows:SetBehaviour("move")

		full_conversation = false
		StopPOIWait()
		ResetPlayerCamera()
	else
		local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
		--DecisionManager:AddOption("icon2.tga", "CYBER_MEADOWS_BASE", script_node, "Decision1") -- GSO
		DecisionManager:AddOption("icon1.tga", "CYBER_MEADOWS_SLAVES", script_node, "Decision2") --meadows
		DecisionManager:Start()
	end
end

global function Decision2()
	local doctor=GetActor("doctor")
	local meadows=GetActor("meadows")
	SayPrep("skip", "")	
	doctor:SetBehaviour("wait")

	--CUT SCENE 7.02
	--HINT. DIALOGUE TREE
	--Running out of questions
	doctor::SID_1537:Tell me about the Cyberslaves.
	meadows::SID_0426:Saving my team is all that's important right now.
	
	doctor::SID_0427:Which is why it's a good thing that I'm here.
	asked_about_slaves = true
	if(asked_about_base) then
		HideLetterBox()
		doctor:SetBehaviour("pc")
		local loc = FindNodeByName("loc_cs7_end_meadows_table")
		meadows:SetTarget(loc)
		meadows:ClearFocus()
		meadows:SetMoveTime(1)
		meadows:SetBehaviour("move")

		full_conversation = false
		StopPOIWait()
		ResetPlayerCamera()
	else
		local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
		DecisionManager:AddOption("icon2.tga", "CYBER_MEADOWS_BASE", script_node, "Decision1") -- GSO
		--DecisionManager:AddOption("icon1.tga", "CYBER_MEADOWS_SLAVES", script_node, "Decision2") --meadows
		DecisionManager:Start()
	end
end

global function Idle()

	if(not full_conversation) then
		Wait(5)
		local meadows=GetActor("meadows")
	
			local random
			local waypoint
			
		random = Random(#POIs)
		waypoint = FindNodeByShortName(POIs[random])
		meadows:SetTarget(waypoint)
		meadows:SetMaxSpeed(1.0)
		meadows:SetBehaviour("move")
	end
	local waitttime = 5+ Random(8)
	Wait(waitttime) 
end
