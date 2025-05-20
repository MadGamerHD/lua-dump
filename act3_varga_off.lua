global function Trigger()
	local varga_prop = FindNodeByName("varga_prop")
	
	--set varga idle until Amy passes...
	varga_prop:StopTrigger()
end