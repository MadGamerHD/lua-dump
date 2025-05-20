global function Interact()
	print ("car push","\n")
	SayPrep("skip", "")
	
	local cutscene_3 = FindNodeByName("cutscene_3")
	local carpush = FindNodeByName("car_push_interactable")
	local carcrash = FindNodeByName("car_crash_interactable")
	local carboot = FindNodeByName("car_boot_interactable")
	local stop = FindNodeByName("taxi_stop_trigger")
	local start = FindNodeByName("taxi_start_trigger")

	cutscene_3:Trigger()	
	carpush:StopTrigger()
	carboot:StopTrigger()
	carcrash:Trigger()
	stop:StopTrigger()
	start:StopTrigger()
end 