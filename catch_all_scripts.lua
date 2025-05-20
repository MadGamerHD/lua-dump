global function run_cutscene()
	local doctor=GetActor("doctor")
	local meadows=GetActor("meadows")
	local amy=GetActor("amy")
	local chisholm=GetActor("chisholm")
	
	local cyberslave=GetActor("cyberslave")
	local cyberman=GetActor("cyberman")
	--VO
	--interact with control panel in the TARDIS
--	doctor::SID_0398:We need to know where Chisholm came from before we can go anywhere. 
	--VO
	--interact with control panel in the TARDIS
--	doctor::SID_0399:The TARDIS should be able to help me fix the Sat Nav.
	
	--VO
	--interact with TARDIS door option 1
--	doctor::SID_0400: I can't leave just yet.
	--VO
	--interact with TARDIS door option 2
--	doctor::SID_0401: Tempting as it is, we need to stay until we've know what’s been going on here.


		--HINT.
		--searching in computer
	doctor::SID_0453: Seems there was a team of 10 people here.
		--HINT.
		--searching in computer
	amy::SID_0454: So plenty more cyberslaves to deal with.
		--HINT.
		--searching in computer
	doctor::SID_0455: There's a work log here. Filled in painstakingly until two weeks ago.
		--HINT.
		--searching in computer
	amy::SID_0456: Until they found the arm.
		--HINT.
		--searching in computer
	doctor::SID_0457:Looks like it.
	
	--VO
	--control panel after the meltdown has started
	doctor::SID_0484: We need to get out of here. The whole ship is going to blow.
	
	--CUT LINES (in case we still need them)
--AMY (SID_0291) S:8.01  
--Script		:"Doctor!  Help!" 	

--DOCTOR (SID_0294) S:8.01  
--Script		:"What did you do?" 

	--HINT
	--death scream/hiss...
	cyberman::SID_1059: Argh!
end


global function Trigger()
	local cyberslave = GetActor("cyberslave1")
	local loc = FindNodeByName("loc_csc_cyberslave")
	cyberslave:Teleport(loc)
end
