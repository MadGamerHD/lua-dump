global function Interact()
	local doctor = GetActor("doctor")

	print ("examine used fusebox","\n")
	SayPrep("skip", "")

	--VO
	--Examine fusebox once the mini-game solved.
		doctor::SID_0554:The track is safe. Let's get out of here.
end