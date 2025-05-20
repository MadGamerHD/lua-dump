local DecisionManager = FindManagerByName("EmAdventureGame_DecisionManager")
local QuestionLevel = 1
local SubQuestion = 0
local QuestionSet = {}

global script_node
	
global function Init()
	for i=1, 10 do
		QuestionSet[i] = Random(3)
	end
end

global function DialogQuitNoSpeech()
	SayPrep("skip","async")
	StopPOIWait()
	ResetPlayerCamera()
	--POI out
	Wait(3)
	EnableActorCameraCollision()
end

global function DialogQuit()
	local amy = GetActor("amy")

	SayPrep("skip","async")	
	--Amy quits the 10 question section to try to find some answers to the questions.
	
	WaitFrame()
	WaitFrame()
	SetSubtitlesPosition(0.0,0.0)
	
	amy::SID_2389:Maybe I should check out all that junk in the Drawing Room - the answers must be in there.
	
	StopPOIWait()
	ResetPlayerCamera()
	--POI out
	Wait(3)
	EnableActorCameraCollision()
end

local function PositionSubtitles()
	SetSubtitlesPosition(0.0,-0.6)
end

global function Q_1()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2012:1) Which Doctor first wore a Scarf?
	
	DecisionManager:AddOption("", "QUESTION1_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION1_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION1_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_2()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2013:2) What game did the fifth incarnation of the Doctor love?
	
	DecisionManager:AddOption("", "QUESTION2_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION2_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION2_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_3()

	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2166:3) Where are Sonic Blasters made?
	
	DecisionManager:AddOption("", "QUESTION3_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION3_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION3_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_4()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2167:4) Which story did the Cybermen first appear in?
	
	DecisionManager:AddOption("", "QUESTION4_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION4_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION4_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_5()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2168:5) When did the Daleks first appear?
	
	DecisionManager:AddOption("", "QUESTION5_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION5_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION5_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_6()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2169:6) What special ability do the Ood have?
	
	DecisionManager:AddOption("", "QUESTION6_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION6_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION6_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_7()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2170:7) In 'Human Nature', what name did the Doctor use?
	
	DecisionManager:AddOption("", "QUESTION7_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION7_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION7_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_8()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2171:8) Where do the Weeping Angels send people?
	
	DecisionManager:AddOption("", "QUESTION8_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION8_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION8_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_9()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2172:9) What did Queen Elizabeth the Tenth call herself?
	
	DecisionManager:AddOption("", "QUESTION9_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION9_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION9_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_10()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2173:10) What city did the Sisters of the Water try to take over?
	
	DecisionManager:AddOption("", "QUESTION10_1", script_node, "FinalAnswerCorrect")
	DecisionManager:AddOption("", "QUESTION10_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION10_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_11()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2174:1) Which Doctor played the Recorder?
	
	DecisionManager:AddOption("", "QUESTION11_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION11_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION11_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_12()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2175:2) Who tried to save Gallifrey in the Time War?
	
	DecisionManager:AddOption("", "QUESTION12_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION12_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION12_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_13()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2176:3) Who tried to conquer Earth in 'The Christmas Invasion'?
	
	DecisionManager:AddOption("", "QUESTION13_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION13_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION13_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_14()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2177:4) Which Doctor had their final appearance in 'The Tenth Planet'?
	
	DecisionManager:AddOption("", "QUESTION14_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION14_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION14_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_15()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2178:5) Who knitted the Doctor's famous, multicoloured scarf?
	
	DecisionManager:AddOption("", "QUESTION15_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION15_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION15_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_16()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2179:6) What was removed from the Ood to make them slaves?
	
	DecisionManager:AddOption("", "QUESTION16_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION16_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION16_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_17()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2180:7) What did the Doctor use to save his life in 'Four to Doomsday'?
	
	DecisionManager:AddOption("", "QUESTION17_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION17_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION17_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_18()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2181:8) Who was the Doctor hiding from in 'Human Nature'?
	
	DecisionManager:AddOption("", "QUESTION18_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION18_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION18_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_19()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2182:9) What did the Ninth Doctor once replace a weapons factory with?
	
	DecisionManager:AddOption("", "QUESTION19_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION19_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION19_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_20()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2183:10) What story did the Weeping Angels first appear in?
	
	DecisionManager:AddOption("", "QUESTION20_1", script_node, "FinalAnswerCorrect")
	DecisionManager:AddOption("", "QUESTION20_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION20_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_21()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2184:1) What did Queen Elizabeth the Tenth rule over?
	
	DecisionManager:AddOption("", "QUESTION21_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION21_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION21_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_22()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2185:2) In 'Vampires of Venice', what the did the aliens look like?
	
	DecisionManager:AddOption("", "QUESTION22_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION22_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION22_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_23()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2186:3) What was Gallifrey sealed inside, in 'The End of Time'?
	
	DecisionManager:AddOption("", "QUESTION23_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION23_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION23_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_24()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2187:4) Who liked the name Sycorax and used it in their work?
	
	DecisionManager:AddOption("", "QUESTION24_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION24_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION24_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_25()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2188:5) Which Doctor never met the Daleks on screen?
	
	DecisionManager:AddOption("", "QUESTION25_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION25_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION25_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_26()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2189:6) Who forced the Ood into slavery?
	
	DecisionManager:AddOption("", "QUESTION26_1", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION26_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION26_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_27()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2190:7) Who was Joan Redfern's great granddaughter?
	
	DecisionManager:AddOption("", "QUESTION27_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION27_2", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTION27_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_28()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2191:8) What weapon does River Song have in 'Silence in the Library'?
	
	DecisionManager:AddOption("", "QUESTION28_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION28_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION28_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_29()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2192:9) Which Doctor never met the Cybermen on screen?
	
	DecisionManager:AddOption("", "QUESTION29_1", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION29_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION29_3", script_node, "AnswerCorrect")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function Q_30()
	local amy = GetActor("amy")
	--VO 10 questions section
	amy::SID_2193:10) Where did the Sisters of the Water come from?
	
	DecisionManager:AddOption("", "QUESTION30_1", script_node, "FinalAnswerCorrect")
	DecisionManager:AddOption("", "QUESTION30_2", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTION30_3", script_node, "AnswerWrong")
	DecisionManager:AddOption("", "QUESTIONS_QUIT", script_node, "DialogQuit")
	DecisionManager:Start()
	PositionSubtitles()
end

global function AskQuestion()

	SayPrep("stick","async")
	
	--if (SubQuestion == 0) then
	--	SubQuestion = Random(3)
	--end
	
	SubQuestion = QuestionSet[QuestionLevel]
	
	if (QuestionLevel == 1) then
		if (SubQuestion == 1) then
			Q_1()
		elseif (SubQuestion == 2) then
			Q_11()
		else --SubQuestion ==3
			Q_21()
		end
	elseif (QuestionLevel == 2) then
		if (SubQuestion == 1) then
			Q_2()
		elseif (SubQuestion == 2) then
			Q_12()
		else
			Q_22()
		end
	elseif (QuestionLevel == 3) then
		if (SubQuestion == 1) then
			Q_3()
		elseif (SubQuestion == 2) then
			Q_13()
		else
			Q_23()
		end
	elseif (QuestionLevel == 4) then
		if (SubQuestion == 1) then
			Q_4()
		elseif (SubQuestion == 2) then
			Q_14()
		else
			Q_24()
		end
	elseif (QuestionLevel == 5) then
		if (SubQuestion == 1) then
			Q_5()
		elseif (SubQuestion == 2) then
			Q_15()
		else
			Q_25()
		end
	elseif (QuestionLevel == 6) then
		if (SubQuestion == 1) then
			Q_6()
		elseif (SubQuestion == 2) then
			Q_16()
		else
			Q_26()
		end
	elseif (QuestionLevel == 7) then
		if (SubQuestion == 1) then
			Q_7()
		elseif (SubQuestion == 2) then
			Q_17()
		else
			Q_27()
		end
	elseif (QuestionLevel == 8) then
			if (SubQuestion == 1) then
			Q_8()
		elseif (SubQuestion == 2) then
			Q_18()
		else
			Q_28()
		end
	elseif (QuestionLevel == 9) then
			if (SubQuestion == 1) then
			Q_9()
		elseif (SubQuestion == 2) then
			Q_19()
		else
			Q_29()
		end
	elseif (QuestionLevel == 10) then
			if (SubQuestion == 1) then
			Q_10()
		elseif (SubQuestion == 2) then
			Q_20()
		else
			Q_30()
		end
	end
	
	SayPrep("stick","async")
end

global function Interact()
	local amy = GetActor("amy")
	local stand = FindNodeByName("AmyStand")
	local waypoint = FindNodeByName("MonitorLookAt")
	
	DisableActorCameraCollision()
	SetPOIPosAndLookZ(waypoint)
	BeginPOI(2, -1, 3, true, true)

	Wait(2.01)
	SayPrep("skip", "async")
	
	amy:Teleport(stand)
	AskQuestion()
end

global function AnswerCorrect()
	local amy = GetActor("amy")
	local random_reponse

	FindNodeByName("QuestionRight"):Trigger()
	QuestionLevel = QuestionLevel + 1
	SubQuestion = 0

	SayPrep("skip","")
	
	random_reponse = Random(8)
	
	WaitFrame()
	WaitFrame()
	SetSubtitlesPosition(0.0,0.0)
	
	if random_reponse == 1 then
		--VO
		amy::SID_2298:Yay! Correct.
	elseif random_reponse == 2 then
		--VO
		amy::SID_2481:Correct. Nice
	elseif random_reponse == 3 then	
		--VO
		amy::SID_2482:Got that one right.
	elseif random_reponse == 4 then	
		--VO
		amy::SID_2529:Yay! Go me!
	elseif random_reponse == 5 then	
		--VO
		amy::SID_2530:Yep, that's right.
	elseif random_reponse == 6 then	
		--VO
		amy::SID_2531:Yeah, got it.
	elseif random_reponse == 7 then	
		--VO
		amy::SID_2532:Nice one.
	elseif random_reponse == 8 then	
		--VO
		amy::SID_2533:Correct! I'm good at this.		
	end
	
	AskQuestion()
end

global function FinalAnswerCorrect()
	local amy = GetActor("amy")

	amy:SetBehaviour("wait")
	
	--bing
	FindNodeByName("QuestionComplete"):Trigger()

	SayPrep("skip","")
	DialogQuitNoSpeech()
	
	WaitFrame()
	WaitFrame()
	SetSubtitlesPosition(0.0,0.0)
	--VO
	--Placeholder for 10 questions, right answer!
		amy::SID_2194:Wahey! Got them all right! Amy Pond for the win!
	
	--SUCCESS!
	FindNodeByName("success"):Trigger()
	
	Wait(3.5)
	FindNodeByName("Cut_14"):Trigger()
end

global function AnswerWrong()
	local amy = GetActor("amy")
	
	FindNodeByName("QuestionWrong"):Trigger()

	QuestionLevel = 1
	SubQuestion = 0
	
	WaitFrame()
	WaitFrame()
	SetSubtitlesPosition(0.0,0.0)
	
	SayPrep("skip","")
	--VO
	--Placeholder for 10 questions, wrong answer
		amy::SID_2195:NO! I got it wrong! It's making me start again.
	
	Wait(1)
	AskQuestion()
end
