global died_already
global first

global function Init()
	if(died_already) then
		local cyberslave = GetActor("cyberslave1")
		cyberslave:SetBehaviour("wait")
		local anim = FindNodeByPartialName("Anim_CYS_Death")
		cyberslave:PlayAnim(anim, 1000, 0)
		cyberslave:DisableSensors()
	end
end