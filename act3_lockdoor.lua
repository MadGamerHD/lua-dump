local doctor = GetActor("doctor")
local amy = GetActor("amy")

global function DoctorIsPlayer()
	if (FindPlayer():GetName()==amy:GetName()) then
		return false
	else
		return true
	end
end

global function Trigger()
	local line_number = math.random(1, 3) 
	
	if(DoctorIsPlayer()) then
		local doctor = GetActor("doctor")
		if(line_number==1) then
			--VO 
			--Move near blocked door
			doctor::SID_1165:This way is blocked. 
		elseif(line_number==2) then
			--VO 
			--Move near blocked door
			doctor::SID_1166:This isn't the right way.
		else
			--VO 
			--Move near blocked door
			doctor::SID_1167:Even the Sonic won't open this. 
		end
	else
		local amy = GetActor("amy")	
		if(line_number==1) then
			--VO 
			--Move near blocked door
			amy::SID_1168:These doors are sealed shut.
		elseif(line_number==2) then
			--VO 
			--Move near blocked door
			amy::SID_1169:I'll never open these doors. 
		else
			--VO 
			--Move near blocked door
			amy::SID_1170:This way doesn't seem right.
		end
	end
end	
