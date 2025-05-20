--14.05
--played when lift reachs top floor 
--ends and cut scene continues in council

global script_node

global function Start()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local councilArea = FindNodeByTag("Council")
	
	doctor:GetTransform():SetNodeParent( councilArea )
	amy:GetTransform():SetNodeParent( councilArea )
end

global function End()
	local cutscene_14_1 = FindNodeByName("cutscene_14_1")
	cutscene_14_1:Trigger()
end
