global model
global script_node
global first
global first_valve_hint

if(first==nil) then
   if not IsLoadingSavedGame() then
      local doctor = GetActor("doctor")
      local ScrewDriver = script_node:FindInventoryItem()
      doctor:AddInventoryItem(ScrewDriver )
   end
   first = 1
end
