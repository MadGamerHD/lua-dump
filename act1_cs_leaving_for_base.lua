global function run_cutscene()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	doctor:SetBehaviour("wait")
	SayPrep("skip", "")
	

	--connect the Sat Nav to the TARDIS
	SetGlobalObjectiveState("Cyber_1_6_2", 3) -- 2 is unlock, 3 is done
	
	--CUT SCENES 5
	--Having fixed the SatNav (see above) and connected it up to the TARDIS (minigame), the Doctor now has the coordinates of the GSO and prepares to go there
	

	doctor::SID_0096:Right. Now we find out what got our friend Chisholm so terrified.
	amy::SID_0097:Yeah! Like that's a good idea.
	doctor::SID_0793:Of course it is. Why wouldn't it be?
	--And the Doctor activates the TARDIS.

	--doctor:SetBehaviour("pc")
	EndAct()
end
