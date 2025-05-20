global function Trigger()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amy_script = FindNodeByName("amy_startup_0")				
	local dalek_script = FindNodeByName("DalekSensors_0")
	local theme = FindNodeByName("dalek_city_theme_def")

	doctor:DisableStealth()
	
	if (amy_script.script.AmyState == 0) then
		amy:DisableStealth()
	end
	
	dalek_script.script.DisableSensors()
	PlayMusic(theme)
end