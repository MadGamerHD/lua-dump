
global function LightGameplay()
	local doctor = GetActor("doctor")
	SayPrep("", "")
	doctor:SetBehaviour("wait")
	doctor::[There will be flickering lights to time your walk with here.]
	doctor:SetBehaviour("pc")
end

global function LightGameplay2()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor::[There will be different light patterns in this section.]
	doctor:SetBehaviour("pc")
end

global function SteamPuzzle()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor::[A burst steam pipe. The Doctor will hold the valve off while Amy goes forth.]
	doctor:SetBehaviour("pc")
end

global function TimedSteamPuzzle()
	local doctor = GetActor("doctor")
--	doctor:SetBehaviour("wait")
--	doctor::[Steam blocks the way, temporarily stopped by using a valve]
--	doctor:SetBehaviour("pc")
end

global function PipeGameplay()
	local doctor = GetActor("doctor")
	--doctor:SetBehaviour("wait")
	--doctor::[A broken piece of pipe swings here. Timing will be important to get across it.]
	--doctor:SetBehaviour("pc")
end

global function PipebreaksGameplay()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor::[The pipe collapses here, leaving Amy stranded]
	doctor:SetBehaviour("pc")
end

global function CreatePathForAmyGameplay()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor::[The Doctor can push some large machinery down here giving Amy a path up.]
	doctor:SetBehaviour("pc")
end

global function ElectricityGameplay()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor::[There will be electrical arcs coming out of the accelerator that require timing to pass.]
	doctor:SetBehaviour("pc")
end

global function WinButton()
	local doctor = GetActor("doctor")
	doctor:SetBehaviour("wait")
	doctor::[Amy and the Doctor can use a switch here to turn off the accelerator.]
	doctor:SetBehaviour("pc")
end
