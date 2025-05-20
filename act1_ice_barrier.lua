global model
global path_clear

path_clear = false

global function Init()
	if(path_clear) then

		model:StopTrigger()

	end
end