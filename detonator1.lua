global function Interact()
	print ("examine detonator script","\n")
	local doctor = GetActor("doctor")

	SayPrep("skip", "")

	--VO
	--Examine detonator 
		doctor::SID_0550:Its charge has blown. It's useless now.
end
