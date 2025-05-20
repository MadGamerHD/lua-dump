global function Trigger()
	
	print("stop_taxi")
	local int = FindNodeByName("car_push_interactable")

	int:StopTrigger()
end