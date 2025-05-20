global model
global first
global beginning

beginning = 1
first = 1

global function Interact()
	local amy = GetActor("amy")
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0)                 
	--The 0 refers to the first active objective in the case of multiple objectives.
	
	SayPrep("skip", "")
	
	if amy:IsDetected() then
	--HINT
	--Talk Amy - detected in stealth mode.
	--*NOTE: If detected and escaping Daleks no hint given.
	--	amy::SID_2015:Run!
	else	
		amy:SetFocus(doctor)
		if(hint == "hint_111a" ) then
			--HINT
			--Amy's helpful hints Act1 - Explore plateau (a)
			amy::SID_0986: My legs are turning blue. Hurry up and find out what happened here so I can go and get warm.
		elseif (hint == "hint_111b") then
			--HINT
			--Amy's helpful hints Act1 - Explore plateau (b)
			--EDIT
			amy::SID_0021:If you don't hurry, I'm going to get frostbite
			if(first == 1) then
				first = 2
				--NEW
				amy::SID_1787:It's colder than Scotland in February.
			end
		elseif (hint == "hint_111c") then
			--HINT
			--Amy's helpful hints Act1 - general talk
			amy::SID_1526: Why not explore the area - there must be something to find.
		elseif (hint == "hint_112a") then
			--HINT
			--Amy's helpful hints Act1 - Find a way down to the driver (a)
			amy::SID_0987: There must be a way down to whoever's down there.
		elseif (hint == "hint_112b") then	
			--HINT
			--Amy's helpful hints Act1 - Find a way down to the driver (b)
			amy::SID_0988: I'll stay here while you climb down there.		
		elseif (hint == "hint_161a") then	
			--HINT
			--Amy's helpful hints Act1 - find SatNav (a)
			amy::SID_0381:Have you figured out where Chisholm came from yet?
		elseif (hint == "hint_161b") then	
			--HINT
			--Amy's helpful hints Act1 - find SatNav (b)
			amy::SID_0383: Look around where the Skidoo crashed. Maybe there's a clue there somewhere.
		elseif (hint == "hint_162a") then
			--HINT
			--Amy's helpful hints Act1 - Use satnav with TARDIS
			amy::SID_0989:Can the TARDIS use the Sat Nav?
		elseif (hint == "hint_162b") then
			--HINT
			--Amy's helpful hints Act1 - general talk
			amy::SID_0990: If we use the Sat Nav with the TARDIS I bet we can find out where Chisholm came from.
		else
			--HINT
			--Amy's helpful hints Act1 - general talk
			amy::SID_0991: Didn't you want to explore the area?
		end
		amy:ClearFocus()
	end
end


global function Trigger()
	local amy = GetActor("amy")
	if (1 == 1) then
			local SatNav = FindNodeByName("SatNav")

		amy:AddInventoryItem(SatNav)
	else
	
	SayPrep("skip", "async")
	--VO
	--if player tries to get Amy to climb down the chasm
	amy::SID_0022:I'm not going down there. I'd never get back up in these shoes.
	amy:Teleport(FindNodeByName("loc_doctor_investigate"))
	end
end


