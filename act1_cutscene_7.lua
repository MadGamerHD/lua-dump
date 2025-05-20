--7
--played on interaction with ladder
--ends above ground back to TARDIS

global function Start()
	local doctor = GetActor("doctor")
	local music1 = FindNodeByName("cs_7_music")
	local music2 = FindNodeByName("cs_7a_music")
	
	SayPrep("skip", "")
	ShowLetterBox()
	doctor:SetBehaviour("wait")

	PlayMusic(music1)
	Wait(17.3)
	PlayMusic(music2)
end

global function Temp()
end
