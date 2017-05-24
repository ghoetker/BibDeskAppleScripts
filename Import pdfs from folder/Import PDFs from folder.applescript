(*
MIT License

Copyright (c) 2017 Glenn Hoetker

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*)

***************** DESCRIPTION AND USE *****************

* Leverages Hazel (https://www.noodlesoft.com) to import PDFs files from a watched folder into a pre-specified BibDesk file
* Could probably be modified to work with Folder Actions
* Relies on having auto file set up in BibDesk as well as a rule to auto generate a cite key.


tell application "Finder" to set eachFileAlias to theFile as alias
tell application "BibDesk"
	open "/path/to/yourbibliography.bib"
	set theDoc to get first document
	tell theDoc
		import with eachFileAlias
		
		-- Now autofile, after checking there is enough information. If there is not, put in easy to find artificial data.
		set justImported to last item of (publications of theDoc's last import group) -- Could be done more cleanly
		if value of field "author" of justImported is "" then set value of field "author" of justImported to "00FixMe"
		if value of field "title" of justImported is "" then set value of field "title" of justImported to "00Fixme"
		if value of field "year" of justImported is "" then set value of field "year" of justImported to "9999"
		set justImported's cite key to justImported's generated cite key
		auto file justImported
	end tell
end tell
