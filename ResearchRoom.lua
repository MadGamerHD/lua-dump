global function Trigger()
	local docScript = FindNodeByName("DoctorScript_0")
	local doctor = GetActor("doctor")
--	local crystal = FindNodeByName("CrystalObj")
	
--	if (doctor:IsInventoryItem(crystal)) then
--		docScript.script.Sealed()
--	else
		docScript.script.SealedAndAnother()
--	end
end