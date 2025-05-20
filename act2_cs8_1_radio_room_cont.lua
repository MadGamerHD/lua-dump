global script_node

global function run_part_3()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local cecil=GetActor("cecil")
	SayPrep("skip","")
	--amy:SetBehaviour("wait")
	
	--CUT SCENE 8.21
	--Played once the cybermat part and the radio has been interacted with.
	--INT. RADIO ROOM  DAY
	--The Doctor pulls out the capacitor.  Shows it to Amy so she knows what she's looking for.
	doctor::SID_0304:Look, this is it. I have to get back to Professor Meadows.
	--*EDIT split up previous line into three
	doctor::SID_1027: This Nano-synthesizer might be the only chance we have to save Chisholm and the rest of the team. 
	--*EDIT split up previous line into three
	doctor::SID_1028: But we have to get that Radio working.
	doctor::SID_0305:Find another Capacitor, Amy. Get the Radio working again and warn Fort Cecil.
	amy::SID_0306:Now I'm a radio engineer. Great.
	--And the Doctor is out of there.
	
	local doc_point=FindNodeByName("loc_csc_DocToLab")
	doctor:Teleport(doc_point)
	--amy:SetBehaviour("pc")
	
	local meadows = FindNodeByTag("meadows")
	meadows:StopTrigger()
	
	--Fix the Radio
	AddGlobalObjective("Cyber_2_5")

	--Sub objective
	--FInd a new capacitor
	SetGlobalObjectiveState("Cyber_2_5_1", 2) -- 2 is unlock, 3 is done
	--Replace the capacitor in the radio
	SetGlobalObjectiveState("Cyber_2_5_2", 2) -- 2 is unlock, 3 is done
	--Wanr Fort Cecil
	SetGlobalObjectiveState("Cyber_2_5_3", 2) -- 2 is unlock, 3 is done
end
