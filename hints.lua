global script_node
global vents_flushed

global function ExitTalk()
	local doctor = GetActor("doctor")

	SayPrep("skip","")
	
	--HINT
	--*NEW
	--Exit Conversation v1
		doctor::SID_2691:I have to leave now.

	--HINT
	--*NEW
	--Exit Conversation v2
		doctor::SID_2692:I have to go. I'll speak to you later.
		
end

global function FlanaganHints()
	local doctor = GetActor("doctor")
	local flanagan = GetActor("flanagan")
	
	--HINT
	--*NEW
	--Shark	
--	doctor::SID_2313:Are there any more of those giant sharks out there?
	--HINT
	--*NEW
--	flanagan::SID_2314:No idea. One's bad enough, though. It's done so much damage. I don't even know who else has survived.

	--HINT
	--*NEW
	--Sickness:
--	doctor::SID_2315:Where did the sickness come from?
	--HINT
	--*NEW
--	flanagan::SID_2316:We're not sure. Everyone just started getting really weak. Like they were wasting away.
	
	--HINT
	--*NEW
	--Jones (hint):
--	doctor::SID_2317:Jones is just a computer, why don't you order it to let you in?
	--HINT
	--*NEW
--	flanagan::SID_2318:Believe me, I've tried. He's not having any of it. Maybe you'll have better luck than me.
end

global function JonesHints()
	local doctor = GetActor("doctor")
	local jones = GetActor("jones")

	--HINT
	--*NEW
	--Restarting generator (hint):
--	doctor::SID_2319:What's the best route to the generator?
	--HINT
	--*NEW
--	jones::SID_2320:The generator is located approximately 120 meters from here. Either set of tunnels will lead you there.
	
	--HINT
	--*NEW
	--Great flash:
--	doctor::SID_2321:Did you see this "great flash" the others were talking about?
	--HINT
	--*NEW
--	jones::SID_2322:My sensors recorded several terabytes of information relating to the event. I have some fascinating seismographs, but nothing that is useful to the current situation, unfortunately.
	
	--HINT
	--*NEW
	--Vortron radiation:
--	doctor::SID_2323:Have you detected any unusual radiation with your sensors?
	--HINT
	--*NEW
--	jones::SID_2324:Yes, but it does not fit any normal radiation frequencies. Conclusion: either this is a data error, or the radiation does not originate from Earth.
	
	--HINT
	--*NEW
	--Alien shark:
	--doctor::SID_2325:When did that giant shark first appear?
	--HINT
	--*NEW
	--jones::SID_2326:All recent, unusual phenomena began together, coinciding with the burst of light two days ago.
	
	--HINT
	--*NEW
	--Access codes (hint - dismissive):
--	doctor::SID_2327:Can you give me the access codes for the agricultural sectors?
	--HINT
	--*NEW
--	jones::SID_2328:I cannot disobey a direct order. Oswald told me not to tell you, under any circumstances.
	
	--HINT
	--*NEW
	--Ingredient locations:
--	doctor::SID_2329:Where can I find sea sprouts, brine oil, and sticky mushrooms?
	--HINT
	--*NEW
--	jones::SID_2330:Any plants would be processed before use. And brine oil is used to service the machinery in the store rooms.
	
	--HINT
	--*NEW
	--Make the cure:
--	doctor::SID_2331:Do you have any equipment I can use to combine these ingredients?
	--HINT
	--*NEW
--	jones::SID_2332:I wasn't given a full inventory of everything in the base, although I asked for it several times. Dana kept adding things at the last minute. It's very inefficient.
	
	--HINT
	--*NEW
	--Triangulator location (hint):
--	doctor::SID_2333:How can we locate the source of the Vortron energy?
	--HINT
	--*NEW
--	jones::SID_2334:Perhaps you can triangulate it by using the scanners on the Bridge.

	SayPrep("skip","")
	
	--HINT
	--*NEW
	--Return to Dana's lab (hint):
	doctor::SID_2335:Has the triangulation worked?
	--HINT
	--*NEW
	jones::SID_2336:We need to go back to Dana's lab to find out.
	
end

global function OswaldHints()
	local doctor = GetActor("doctor")
	local oswald = GetActor("oswald")
	
	--HINT
	--*NEW
	--Alien shark:
	--doctor::SID_2337:How much damage has that giant shark done?
	--HINT
	--*NEW
	--oswald::SID_2338:Too much. I tried to save O'Connell... but he didn't stand a chance. I'm not letting anyone else die today.
	
	--HINT
	--*NEW
	--Great flash:
	--doctor::SID_2339:Did you see this "great flash" as well?
	--HINT
	--*NEW
	--oswald::SID_2340:Of course I did. It was like daylight for a few seconds. Couldn't really miss that.
	
	--HINT
	--*NEW
	--Vortron radiation:
	--doctor::SID_2341:Vortron radiation shouldn't exist on this planet. It could cause all sorts of problems I haven't even thought of yet.
	--HINT
	--*NEW
	--oswald::SID_2342:I don't care. If we get out of the base, we'll leave it behind. Maybe it'll kill a few fish.
	
	--HINT
	--*NEW
	--Access codes (hint - dismissive):
	--doctor::SID_2343:Please, I really need those access codes.
	--HINT
	--*NEW
	--oswald::SID_2344:No way. I'm not letting you have them, and I've ordered Jones not to tell ANYONE. So forget it.
	
	--HINT
	--*NEW
	--Ingredient locations (hint - dismissive):
	--doctor::SID_2345:Where can I find sea sprouts, brine oil, and sticky mushrooms?
	--HINT
	--*NEW
	--oswald::SID_2346:Do I look like a chef? Some of the others reckon they've seen mushrooms growing, but I haven't seen any.

end

global function DanaHints()
	local doctor = GetActor("doctor")
	local dana = GetActor("dana")
	
	--HINT
	--*NEW
	--Alien shark:
	--doctor::SID_2347:How much more damage has that giant shark done?
	--HINT
	--*NEW
	--dana::SID_2348:Not sure. We know it took out the comms, and several glass tubes. We're still getting damage reports, it's weakened the structural integrity all over the base.
	
	--HINT
	--*NEW
	--Great flash:
	--doctor::SID_2349:What did the "great flash" look like, exactly?
	--HINT
	--*NEW
	--dana::SID_2350:A bit like a camera flash, but lots of them at the same time. Lasted about thirty seconds.
	
	--HINT
	--*NEW
	--Vortron radiation:
	--doctor::SID_2351:You did really well trying to deal with the Vortron radiation.
	--HINT
	--*NEW
	--dana::SID_2352:Not well enough. I've never seen anything even remotely like it.
	
	--HINT
	--*NEW
	--Ingredient locations (hint):
	--doctor::SID_2353:If I can find some sticky mushrooms, I can make a cure for the radiation sickness.
	--HINT
	--*NEW
	--dana::SID_2354:There were some in the tubes, but we got rid of them. It's nice and dark in the store rooms though, there might be some in there.
	
	--HINT
	--*NEW
	--Triangulator location (hint):
	--doctor::SID_2355:Where would be a good place to triangulate the source of the radiation?
	--HINT
	--*NEW
	--dana::SID_2356:You could use the scanners up on the Bridge.
end


global function InteractAmy()
	local amy = GetActor("amy")
	local hint = QueryObjective(0)
	
	print("Amy hint is", hint)

	SayPrep("skip","")
	
	--Objective 2.1 - Journey to the generator
	if(hint == "hint_211a") then
		--HINT
		--First hint
		amy::SID_2362:We'd better stay out of the shadows so those Vashta things don't get us.
	elseif(hint == "hint_211b") then
		--HINT
		--Second hint
		amy::SID_2363:Can't you boost the lights a bit with your Sonic? Just a thought.
	elseif(hint == "hint_221a") then
		--Objective 2.2 - Kill the divers in the generator room
		--HINT
		--*NEW
		--First hint
		amy::SID_2364:If light gets rid of the Vashta, would it work on those divers?
	elseif(hint == "hint_221b") then
		--HINT
		--Second hint
		amy::SID_2365:Get them to walk into the light, I bet that'll sort them out.
	 elseif(hint == "hint_223") then
		--Objective 2.3 - Rewire the generator
		--HINT
		amy::SID_2366:The Generator looks a bit knackered. Probably needs sorting out.
	elseif(hint == "hint_251") then
		--Objective 2.5 - Discover the type of radiation, using Jones' terminal
		--HINT
		amy::SID_2369:Jones might know more about that chip thingy. If she's so clever, and all.
	elseif(hint == "hint_252") then
		--Objective 2.5 - After showing ESC on jones goto lifepods
		--HINT	
		amy::SID_2704:Shouldn't we get back to the others?
	elseif(hint == "hint_261a") then
		--Objective 2.6 - Convince Dana to give up the codes
		--HINT
		--First hint
		amy::SID_2370:There must be someone who'll listen, and give us those access codes.
	elseif(hint == "hint_261b") then
		--HINT
		--Second hint
		amy::SID_2371:Maybe Dana will help if we can convince her about the radiation cure.
	elseif(hint == "hint_262a") then
		--Objective 2.6a - Search for the medicinal ingredients
		--HINT
		--First hint
		amy::SID_2372:Those ingredients must be around here somewhere.
	elseif(hint == "hint_262b") then
		--HINT
		--Second hint
		amy::SID_2373:I bet the ingredients are in the store rooms, just off these corridors.
	elseif(hint == "hint_271a") then
		--Objective 2.7 - Create the cure
		--HINT
		--First hint
		amy::SID_2374:Now you've got the ingredients, you can make that cure.
	elseif(hint == "hint_271b") then
		--HINT
		--Second hint
		amy::SID_2375:Why don't we take the ingredients to Dana's Lab, so you can make that cure?
	elseif(hint == "hint_281") then
		--Objective 2.8 - Use the terminals in the Assembly Room to discover the source of the radiation
		--HINT
		amy::SID_2376:I'm sure Dana said the Bridge area was the best place to use those scanners.
	elseif(hint == "hint_283") then
		--Objective 2.8.1 - Return to the Dana's lab
		--HINT
		amy::SID_2415:Let's head back to Dana's Lab and see what that scanner shows.
	end
end

global function InteractDoctor()
	local doctor = GetActor("doctor")
	local hint = QueryObjective(0)
	local vent_script = FindNodeByName("IntermittentLightController")

	SayPrep("skip","")
	
	if vent_script.script.vents_flushed then
		vent_script.script.MeetBackWithDoctor()
		--leads to mini game then cs7
	elseif(hint == "hint_231a") then
		--Objective 2.4 - Flush the vents
		--HINT
		--*NEW
		--First hint
		doctor::SID_2367:Sounds like there's a blockage in the system somewhere.
	elseif(hint == "hint_231b") then
		--HINT
		--*NEW
		--Second hint
		doctor::SID_2368:Try the processing room along the corridor, see if you can find it.
	end
end










