
global script_node
global ItemsExamined
ItemsExamined = 0

global function AddToCount()
	ItemsExamined = ItemsExamined + 1
	print("ItemsExamined ",  ItemsExamined)
end

global function CheckForCompletion()

	FindNodeByName("DrawingRoomLaunchScript").script.CheckForCompletion()
	
end