use Finder : application "Finder"
use BibDesk : application "BibDesk"
use scripting additions

tell BibDesk to set theDoc to get first document

tell application "Finder" to set myPDFs to every file of folder "Path:To:Folder to import from" whose name extension is "pdf"

tell application "Finder" to set myBibs to every file of folder "Path:To:Folder to import from" whose name extension is "bib"

repeat with eachFile in myPDFs
	set eachFileAlias to eachFile as alias
	tell application "BibDesk"
		tell theDoc
			set justImported to first item of (import with eachFileAlias)
		end tell
		-- Now autofile, after checking there is enough information
		if value of field "author" of justImported is "" then set value of field "author" of justImported to "00Fixme"
		if value of field "title" of justImported is "" then set value of field "title" of justImported to "00Fixme"
		if value of field "year" of justImported is "" then set value of field "year" of justImported to "9999"
		set justImported's cite key to justImported's generated cite key
		auto file justImported
	end tell
end repeat

repeat with eachFile in myBibs
	set eachFileAlias to eachFile as alias
	tell application "BibDesk"
		tell theDoc
			set newRec to first item of (import from eachFileAlias)
			set newRec's cite key to newRec's generated cite key
		end tell
	end tell
end repeat