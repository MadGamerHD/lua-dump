global function Interact()
	local doctor = GetActor("doctor")

	--VO
	--Interact with the Rotating gantry control when used.
		doctor::SID_2220:The gantry is aligned. There is no need to move it again.
end

global function Use()
	local doctor = GetActor("doctor")
	
	--VO
	--Use Sonic on working panel.
		doctor::SID_2221:The controls are working so I don't need to use the Sonic.
end
