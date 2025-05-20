global switched

local Tardis1BurnFile
local Tardis2BurnFile
local Drawing1BurnFile
local Drawing2BurnFile

Tardis1BurnFile = FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01")
Tardis2BurnFile = FindNodeByShortName("AfterBurn_EM_AREA_Common_TARDIS_INTERIOR_Area01_Alt")
Drawing1BurnFile = FindNodeByShortName("AfterBurn_EM_AREA_Common_DRAWING_ROOM_Area01")
Drawing2BurnFile = FindNodeByShortName("AfterBurn_EM_AREA_Common_DRAWING_ROOM_Area01_Alt")

local function doSwitch()
	FindNodeByTag("TARDIS2"):Show()
	FindNodeByTag("Drawing2"):Show()
	FindNodeByTag("TARDIS1"):Hide()
	FindNodeByTag("Drawing1"):Hide()
	
	FindNodeByName("ConsoleAmbiance"):Sleep()
	FindNodeByName("TARDIS_Ambiance"):Sleep()
	FindNodeByName("ConsoleDerilictAmbiance"):Wake()
	FindNodeByName("TARDIS_Ambiance_Dormant"):Wake()
	
	FindNodeByName("DrawingRoomDerelict"):Wake()
	FindNodeByName("FireplaceSounds"):Sleep()
	FindNodeByName("DrawingRoomAmbiance"):Sleep()
	
	Tardis2BurnFile:EnablePlsVolumes()
	Drawing2BurnFile:EnablePlsVolumes()
	Tardis1BurnFile:DisablePlsVolumes()
	Drawing1BurnFile:DisablePlsVolumes()
end

global function switchAB()
	switched = true
	doSwitch()
end

global function Init()
	if switched then
		doSwitch()
	else
		FindNodeByTag("TARDIS1"):Show()
		FindNodeByTag("Drawing1"):Show()
		FindNodeByTag("TARDIS2"):Hide()
		FindNodeByTag("Drawing2"):Hide()

		Tardis1BurnFile:EnablePlsVolumes()
		Drawing1BurnFile:EnablePlsVolumes()
		Tardis2BurnFile:DisablePlsVolumes()
		Drawing2BurnFile:DisablePlsVolumes()
	end
end