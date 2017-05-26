use BibDesk : application "BibDesk"
use scripting additions

tell BibDesk
	activate
	set theDoc to first document
	set originalPub to (selection of theDoc)
	set originalPub to first item of originalPub
	set theAuthors to last name of originalPub's authors
	set searchStr to (join theAuthors using " ")
	set searchStr to searchStr & " " & title of originalPub
	set searchStrEncoded to my urlEncode(searchStr)
	set crossrefUrl to "http://search.crossref.org/dois?q=" & searchStrEncoded
	set theJsonResponse to (do shell script "curl --request GET " & quote & crossrefUrl & quote)
	tell application "JSON Helper" to set theJSON to read JSON from theJsonResponse
	
	set foundSomething to 0
	repeat with i from 1 to 3
		set theCitation to fullCitation of item i of theJSON
		set theDOI to doi of item i of theJSON
		set theDOI to (change "http://dx.doi.org/" in theDOI into "")
		display dialog searchStr & return & return & theCitation buttons {"Ok", "Skip"} default button 1
		if the button returned of the result is "OK" then
			set the value of originalPub's field "doi" to theDOI
			return
		end if
	end repeat
end tell


-- Almost sure I copied the part below from someone, but can't find the original source.
-- If you happen to know, I'd love to find out so I can credit them appropriately.

on urlEncode(str)
	local str
	try
		return (do shell script "/bin/echo " & quoted form of str & ¬
			" | perl -MURI::Escape -lne 'print uri_escape($_)'")
	on error eMsg number eNum
		error "Can't urlEncode: " & eMsg number eNum
	end try
end urlEncode