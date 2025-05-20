global Laser1 
global Laser2 
global Mirror1 
global Mirror2 
global Red_button 
global Console
global Chair 
global Laser1State
global Laser2State
global Mirror1State
global Mirror2State

Laser1 = FindNodeByName("int_laser1")
Laser2 = FindNodeByName("int_laser2")
Mirror1 = FindNodeByName("int_mirror1")
Mirror2 = FindNodeByName("int_mirror0")
Red_button = FindNodeByName("int_red_button")
Console = FindNodeByName("int_button_console")
Chair = FindNodeByName("int_FACT_cyber_conversion")

global function TurnOnAllControls()
	Laser1:Trigger() 
	Laser2:Trigger() 
	Mirror1:Trigger() 
	Mirror2:Trigger() 
	Red_button:Trigger() 
	Console:StopTrigger() 
	Chair:StopTrigger() 
end	                  

global function TurnOffAllControls()
	Laser1:StopTrigger() 
	Laser2:StopTrigger() 
	Mirror1:StopTrigger() 
	Mirror2:StopTrigger() 
	Red_button:StopTrigger() 
	Console:Trigger() 
	Chair:Trigger() 
end

global function TurnOffAllControlsLast()
	Laser1:StopTrigger() 
	Laser2:StopTrigger() 
	Mirror1:StopTrigger() 
	Mirror2:StopTrigger() 
	Red_button:StopTrigger() 
	Console = FindNodeByName("int_button_console_examine")
	Console:Trigger() 
	Chair:Trigger() 
end

global function ResetObjects()
	Laser1State = 0
	Laser2State = 0
	Mirror1State = 0
	Mirror2State = 0
end
