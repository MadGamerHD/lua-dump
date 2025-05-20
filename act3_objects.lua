global GeneratorState
global DebrisState
global ConsoleState
global Connected

if (not IsLoadingSavedGame()) then
	GeneratorState = 1
	DebrisState = 1
	ConsoleState = 1
	Connected = false
end