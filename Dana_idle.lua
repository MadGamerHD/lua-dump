global play_idles

play_idles = false


global function Idle()
	
	if(play_idles) then
		Wait(1)
		local dana = GetActor("dana")
		
		local shuffle = Random(8)

		if (shuffle > 5) then
			local anim = FindNodeByShortName("EM_ANIMATOR_Tanaka_Anim_TAN_Idle_03")
			dana:PlayAnimBlendOut(anim,1,1,1)
		else
			local anim = FindNodeByShortName("EM_ANIMATOR_Tanaka_Anim_TAN_Idle_02")
			dana:PlayAnimBlendOut(anim,1,1,1)
		end
		

	end		
	local idle_time = Random(3) + 8
	Wait(idle_time)

end


global function Trigger()
	play_idles = true
end