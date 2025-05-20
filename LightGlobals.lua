global script_node
global current_light_0
global current_light_1
global current_control_panel
global current_kill_trigger
global show_instructions

local audio_off_played

if not IsLoadingSavedGame() then
	show_instructions = true
end

global light_game_difficulty

if not IsLoadingSavedGame() or light_game_difficulty == nil then
	light_game_difficulty = 0
end

local time_until_light_decays = 6

local function DeactivateLight()

	if(current_light_0 ~= nil) then
		current_light_0:SetAttr("IntensityMultiplier", 8)
		current_light_1:SetAttr("IntensityMultiplier", 8)
		
		-- Let the lights local script know that the light has gone out
		local lightScript = current_light_0:FindNodeByTag("LightControlScript")
		lightScript.script.LightsOut()
		
		current_light_0:StopTrigger()
		current_light_1:StopTrigger()
	end
end

global function SetNewActiveLight(new_light_0, new_light_1)

	DeactivateLight()
	current_light_0 = new_light_0
	current_light_1 = new_light_1
	current_light_0:Trigger()
	current_light_1:Trigger()
	time_until_light_decays = 6
	
	-- enforce an intensity[
	current_light_0:SetAttr("IntensityMultiplier", 8)
	current_light_1:SetAttr("IntensityMultiplier", 8)
	
	--NEW
	local on = current_light_0:FindNodeByTag("power_on")
	on:Trigger()
	audio_off_played = false

	--current_kill_trigger = new_light:FindNodeByTag("VashtaKillTrigger")
	--current_kill_trigger:StopTrigger()
end

global function Idle()

	if(current_light_0 ~= nil) then
		time_until_light_decays = time_until_light_decays - GetTimeStep()
		
		if(time_until_light_decays <= 0) then
			DeactivateLight()
			
			local interact = current_light_0:FindNodeByTag("LightControlInteract")
			print("int on")
			interact:Trigger()
			
			current_light_0 = nil	
		else
			--flicker the light somewhat
			if(time_until_light_decays < 3) then
				local inv_amount_of_flicker = 6 - time_until_light_decays
				local random_flicker = Random(2 + inv_amount_of_flicker)
				current_light_0:SetAttr("IntensityMultiplier", 8 - random_flicker)
				current_light_1:SetAttr("IntensityMultiplier", 8 - random_flicker)
				--NEW
				if not audio_off_played then
					local off = current_light_0:FindNodeByTag("power_off")
					
					off:Trigger()	
					audio_off_played = true
				end
			end
		end
	end
end

global function KillPlayer()
	local doctor = FindNodeByName("TheDoctor_Actor_0")
	doctor:Die("Vashta")
end