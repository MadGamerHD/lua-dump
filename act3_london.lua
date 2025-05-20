local londoncam = FindNodeByName("CutSceneCamera_0")
local tardiscam = FindNodeByName("CutSceneCamera_1")

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local sylvia = GetActor("sylvia")
	local doc_tardis = FindNodeByName("doc_tardis")
	local amy_tardis = FindNodeByName("amy_tardis")
	local tard_amb = FindNodeByName("tardis_amb")
	local lon_amb = FindNodeByName("london_busy_amb")
	local ruins_amb = FindNodeByName("ruins_amb")
	
	ShowLetterBox()
	SayPrep("skip", "")	
	
	doctor:DisablePhysics()
	amy:DisablePhysics()
	sylvia:DisablePhysics()
	doctor:Teleport(doc_tardis)
	amy:Teleport(amy_tardis)
	doctor:SetBehaviour("wait")
	
	tardiscam:CutTo()
	ruins_amb:StopTrigger()
	tard_amb:Trigger()
	Wait(1)
	--CUT SCENE 21.2
	--CUT TO:
	--INT. TARDIS CONTROL ROOM -- DAY
	--The Doctor is at the TARDIS controls twisting dials. There's the sound of static - and then there's sixties music...
	--And then, on the TARDIS screen a shot of Trafalgar Square. And then, over the music...
		sylvia::SID_0784:Mum. Stop being such a square, will you?
	-->And the camera pans in on the red telephone box.

	londoncam:CutTo()
	tard_amb:StopTrigger()
	lon_amb:Trigger()
	--CUT SCENE 21.3
	--CUT TO:
	--EXT. TELEPHONE BOX -- DAY
	--Sylvia, all clean and nicely dressed, on the phone. Off the sounds of bustling London around her.
		sylvia::SID_0785:It's only ten o'clock. I can look after myself, you know. So what if I am late? It's not the end of the world.

	tardiscam:CutTo()
	lon_amb:StopTrigger()
	tard_amb:Trigger()
	Wait(1)
	--CUT SCENE 21.4
	--CUT TO:
	--INT. TARDIS CONTROL ROOM -- DAY
	--The Doctor turns off the screen. Smiles at Amy.
		doctor::SID_0786:Now. Didn't you say something about meeting Ringo Starr?
	-->And he triggers the TARDIS. The engines roar.

--CREDITS :)
end
