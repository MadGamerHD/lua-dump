global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local doc_loc = FindNodeByName("ruins_doc_loc")
	local amy_loc = FindNodeByName("ruins_amy_loc")


	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
	ShowLetterBox()
	SayPrep("skip", "")	
	
	doctor:Teleport(doc_loc)
	amy:Teleport(amy_loc)

	amy:StopInvisibility()

	--moved to dialogue events
	
	--CUT SCENE 21.1
	--CUT TO:	
	--INT. RUINED KAALANN. RECYCLING FACILITY -- DAY
	--A flash of light - and The Doctor and Amy appear on the floor - up against the TARDIS. 
	--The Doctor pats the TARDIS as he gets to his feet and smiles.
		--doctor::SID_0776:HA, Now that's what I call door to door.
	--He looks around. Amy is still weak, but getting to her feet. 
		--doctor::SID_0777:STEADY,Steady. Take it easy.
	--Amy looks at her hands. Perfectly solid. 
		--amy::SID_0778:I'm okay! We did it!
	--Overjoyed, she beams.
	--The Doctor laughs.
		--doctor::SID_0779:HA HA! Of course we did it. Look.
	--He's indicating their surroundings - the ruined city (storeroom), overgrown with Varga vines.
		--doctor::SID_0780:This is Kaalann as it should be. Ruined. 
		--amy::SID_0781:But how did we get here?
		--doctor::SID_0782:The Eye just spat us back to the point where we entered it.
		--amy::SID_0783:And Earth?
	-->The Doctor opens the TARDIS door.
	
end

global function End()
	local london_time = FindNodeByName("london_time")
	
	--cut scene 21.2
	london_time:Trigger()
end