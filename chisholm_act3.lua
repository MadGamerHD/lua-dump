global count

count = 1

global function Interact()
	local chisholm = GetActor("chisholm")
	
	SayPrep("skip", "")

	if count == 1 then
		--HINT
		--interacting with chisholm act3
			chisholm::SID_2404:Yes?
		count = 2
	else		
		--HINT
		--interacting with chisholm act3
			chisholm::SID_2405:I'm doing fine, thanks.
		count = 1
	end		
end
