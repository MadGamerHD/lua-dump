local light = FindNodeByName("Cutscene5_Light")
local lightStartingIntensity = -25
local lightIntensity = lightStartingIntensity
local lightOff = false

global function PerformCutscene5()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local music = FindNodeByName("cs5_music")

	PlayMusic(music)
	
	ShowLetterBox()
	
	--turn on divers
	local enemy = FindNodeByName("Divers")
	enemy:Show()
	
	doctor:SetBehaviour("wait")
	amy:SetBehaviour("wait")
end

global function ForceSonicTorchUpdate()
	FindNodeByName("Sonic_Torch"):UpdateFromComponents()
	lightOff = true
end

global function EndCutscene5()
	local doctor = GetActor("doctor")
	local amy = GetActor("amy")
	local amb = FindNodeByName("act2_amb_def")
	local trig1 = FindNodeByName("SafeTrigger_01")
	local trig2 = FindNodeByName("SafeTrigger_02")
	local trig3 = FindNodeByName("SafeTrigger_03")
	local trig4 = FindNodeByName("SafeTrigger_04")
	local trig5 = FindNodeByName("SafeTrigger_05")
	local trig6 = FindNodeByName("SafeTrigger_06")
	local trig7 = FindNodeByName("SafeTrigger_07")
	local trig8 = FindNodeByName("SafeTrigger_08")

	trig1:StopTrigger()
	trig2:StopTrigger()
	trig3:StopTrigger()
	trig4:StopTrigger()
	trig5:StopTrigger()
	trig6:StopTrigger()
	trig7:StopTrigger()
	trig8:StopTrigger()

	PlayMusic(amb)
	
	HideLetterBox()
	
	-- doctor and amy teleport is done within activate the divers

	FindNodeByName("GeneratorGameplayScript").script.ActivateTheDivers()
	
	doctor:SetBehaviour("pc")
	amy:SetTarget(doctor)
	amy:SetBehaviour("follow")
	light:StopTrigger()
	
	--*NEW
	--VO
		doctor::SID_2614:We should be safer up here.
end

global function LightOn()
	light:Trigger()
	light:SetAttr("IntensityMultiplier", lightStartingIntensity)
end

global function Idle()
	if lightOff then
		lightIntensity = lightIntensity - GetTimeStep() * lightStartingIntensity
		
		if lightIntensity >= 0 then
			lightIntensity = 0
			lightOff = false
			light:SetAttr("IntensityMultiplier", lightStartingIntensity)
			light:StopTrigger()
		else
			light:SetAttr("IntensityMultiplier", lightIntensity)
		end
	end
end