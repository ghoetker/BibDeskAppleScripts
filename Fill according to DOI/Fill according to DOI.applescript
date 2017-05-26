use BibDesk : application "BibDesk"
use scripting additions

tell BibDesk
	set theDoc to get first document
	set originalPub to selection of theDoc
	set originalPub to item 1 of originalPub
	set theDoi to value of originalPub's field "DOI"
	if theDoi = "" then
		display notification "There is no DOI there."
		return
	end if
	
	set tempPub to (import theDoc from theDoi)
	
	if length of tempPub = 1 then
		set tempPub to item 1 of tempPub
	else
		display notification "Umm, I didn't find anything at that DOI. Bummer."
		return
	end if
	
	set theNewFields to every field of tempPub
	repeat with theField in every field of tempPub
		set fieldName to name of theField
		set value of field fieldName of originalPub to (get value of field fieldName of tempPub)
	end repeat
	delete tempPub
	
	set originalPub's cite key to originalPub's generated cite key
	if linked file of originalPub is not {} then auto file originalPub
	
	select originalPub -- So it appears nicely at the top of the window
end tell




