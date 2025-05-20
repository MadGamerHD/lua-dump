global function Trigger()
	
	print("start_taxi")
	local int = FindNodeByName("car_push_interactable")

	int:Trigger()
end