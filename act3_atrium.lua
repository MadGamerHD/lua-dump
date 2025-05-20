global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local supreme = GetActor("supreme")

	--CUT SCENE 18
	--INT. RUINED KAALANN. VISUALISER -- DAY
	--The Doctor and Amy are in the Visualiser Room by the eye monitor. 
	--Use sonic with primary console (gameplay)
		doctor::SID_0729:This should do the trick.
	--On the screen - Daleks, led by the Supreme Dalek escorting the Eye of Time contained in the metallic sphere up the Atrium (open shaft).
		doctor::SID_0734:The Supreme Dalek. Who else?

	--INT. RUINED KAALANN. OPEN SHAFT -- DAY
	--The Daleks are elevating up an open shaft with the contained Eye. 
		supreme::SID_0735:Secure Kaalann. 
	--Daleks continue up the atrium.
		supreme::SID_0736:Prepare to activate the Eye of Time.

	--CUT TO:
	--INT. RUINED KAALANN. VISUALISER -- DAY
	--The Doctor and Amy watch.
		amy::SID_0737:What are we gonna do?
		doctor::SID_0738:We have to release the Eye before the Daleks activate it. Then the natural timeline will be restored. 
		doctor::SID_0846:The Daleks don't crush Earth, and Amy Pond gets born.
		amy::SID_0739:That's great. But how are we gonna get past that lot?
	--She means the Daleks on the Visualiser screen.
	--The Doctor smiles.
		doctor::SID_0740:What? Like I wouldn't have a plan? Everything we need is in here. 
	-->Visualiser blows and exposes inner parts - eye stalk falls out
	
	--on end
	AddGlobalObjective("Dalek_3_3")
end