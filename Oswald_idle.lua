global play_idles

play_idles = false


global function Idle()
	if(play_idles) then
		Wait(1)
		local oswald = GetActor("oswald")

		local anim = FindNodeByShortName("EM_ANIMATOR_Fox_Anim_Fox_Idle02")
		oswald:PlayAnimBlendOut(anim,1,1,1)
		

	end		
	local idle_time = Random(3) + 8
	Wait(idle_time)

end


global function Trigger()
	play_idles = true
end