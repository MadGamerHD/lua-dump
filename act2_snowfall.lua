local snowfall = FindNodeByName("snowfall_Prop")
local snow1_prop = FindNodeByName("Snow1_Prop")
local snow2_prop = FindNodeByName("Snow2_Prop")
local snow3_prop = FindNodeByName("Snow3_Prop")
local snow1_outside_locator = FindNodeByName("Snow1_Outside_Locator")
local snow2_outside_locator = FindNodeByName("Snow2_Outside_Locator")
local snow3_outside_locator = FindNodeByName("Snow3_Outside_Locator")

global inside

global function Init()
	-- Fade doesn't get saved out

--	if inside == true then
--		snow1_prop:Fade(1, 0.001, "sine")
--		snow2_prop:Fade(1, 0.001, "sine")
--		snow3_prop:Fade(1, 0.001, "sine")
--	elseif inside == false then
--		snow1_prop:Fade(1, 0.001, "sine")
--		snow2_prop:Fade(1, 0.001, "sine")
--		snow3_prop:Fade(1, 0.001, "sine")
--	end

	if not inside then
		snowfall:AttachToCamera()
		snow1_prop:TeleportToOrigin()
		snow2_prop:TeleportToOrigin()
		snow3_prop:TeleportToOrigin()
	end

end

global function Trigger()

	if inside then

		inside = false

		-- Fade out snow by exit
		snow1_prop:Fade(0, 0.25, "sine")
		snow2_prop:Fade(0, 0.25, "sine")
		snow3_prop:Fade(0, 0.25, "sine")
		Wait(0.25)

		snowfall:AttachToCamera()
		snow1_prop:TeleportToOrigin()
		snow2_prop:TeleportToOrigin()
		snow3_prop:TeleportToOrigin()

		snow1_prop:Fade(1, 0.25, "sine")
		snow2_prop:Fade(1, 0.25, "sine")
		snow3_prop:Fade(1, 0.25, "sine")
		
	end

end

global function Off()

	if not inside then

		inside = true
		snowfall:DetachFromCamera()
		snow1_prop:Fade(0, 0.25, "sine")
		snow2_prop:Fade(0, 0.25, "sine")
		snow3_prop:Fade(0, 0.25, "sine")
		Wait(0.25)
		-- teleport snow to outside exit
		snow1_prop:Teleport(snow1_outside_locator)
		snow2_prop:Teleport(snow2_outside_locator)
		snow3_prop:Teleport(snow3_outside_locator)
		snow1_prop:Fade(1, 0.25, "sine")
		snow2_prop:Fade(1, 0.25, "sine")
		snow3_prop:Fade(1, 0.25, "sine")

	end

end