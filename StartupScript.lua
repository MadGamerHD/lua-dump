--	local dalek_script = FindNodeByName("DalekSensors_0")
--	dalek_script.script.DisableSensors()

local Emp = GetActor("emperor")
Emp:DisablePhysics()
Emp:DisableWalls()
Emp:DisableStickToFloor()
Emp:DisableGravity()