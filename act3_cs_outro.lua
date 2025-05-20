global function run_cutscene_start()
	local doctor=GetActor("doctor")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")

	SayPrep("skip", "")

	-- Get back to the lift
	SetGlobalObjectiveState("Cyber_3_7_1", 3) -- 2 is unlock, 3 is done
	-- Speed up the lift
	SetGlobalObjectiveState("Cyber_3_7_2", 3) -- 2 is unlock, 3 is done

	
	--CUT SCENE 15
	--EXT. LIFT -- DAY
	--THE DOCTOR, AMY and CHISHOLM pile into the lift car.  The Doctor sonics the control box.
		doctor::SID_0340:Hold on!
	--And the lift flies up the shaft at speed.

	--EXT. SURVEY OUTPOST  DAY
	--THE DOCTOR,AMY and CHISHOLM run for their lives away from the survey buildings towards the TARDIS.
	--An explosion below ground, but beyond the outpost throws them to the floor as the Cyberman mothershp detonates in a rage of ice and fire.  It lasts only a moment.
	--The Doctor picks himself up, dusting snow off his jacket.
		doctor::SID_0372:Well, that seemed to go according to plan... in the end.
		amy::SID_0373:Do you even know what "a plan" is?
	--The doctor grins and Overhead - a small plane.
		chisholm::SID_0374:That'll be the Fort Cecil plane.  
	--Amy sees other people coming out of the buildings (just two or three and too far away to see them clearly). 
		amy::SID_0375:Look. Survivors.
		doctor::SID_0376:Not a bad day's work, then. The nano-virus will have reversed with the destruction of the ship. They'll be good as new.
		chisholm::SID_0377:There's going to be a lot of questions. 
		doctor::SID_0378:Most of them asked by someone from UNIT, I daresay. Just mention my name and you'll be okay. 
	--As the Doctor opens the TARDIS.
		chisholm::SID_0379:You never said... What is it?
		doctor::SID_0380:The Doctor. Just the Doctor.
	--And, with Amy, steps into the TARDIS - which begins to dematerialize before stunned Chisholm's eyes.
	--And with the TARDIS engines still whining and roaring...
	
	--CUT TO
	--EXT. ARCTIC WILDERNESS -- DAY
	--With the sound of the TARDIS over...
	--Cybermen frozen mid-march, icicles starting to hang from them.  The blowing snow, starting to pile up around them - to bury them, once more...
	--CUT TO
	--CREDITS
end
