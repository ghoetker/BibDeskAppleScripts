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

* Leverages Hazel (https://www.noodlesoft.com) to import bib files from a watched folder into a pre-specified BibDesk file
* Could probably be modified to work with Folder Actions
* Because Hazel triggers on individual files, the script is not set up for importing multiples files at once. One could do so.


-- SETTINGS --

-- Yes, I know these would be cleaner as properties. However, Hazel seems to not tolerate properties in embedded scripts

set bibDeskFile to "/path/to/bibliography.bib"
set setCiteKeyTF to "true" -- if set to "true", the original cite key will be replaced with an auto-generated one. May act unpredictably if an auto cite key pattern hasn't been set in BibDesk.

-- MAIN --

tell application "BibDesk"
	open bibDeskFile
	set theDoc to get first document
	tell theDoc
		set newRec to first item of (import from theFile)
		if setCiteKeyTF is "true" then set newRec's cite key to newRec's generated cite key
	end tell
end tell