# Description and use

* Imports PDFs and .bib files from a pre-designated folder.  I use this because I've set up my automatic import scripts (elsewhere on this Github archive) to only run if BibDesk is running when they first trigger. Given how Hazel (which I use to trigger auto-import) works, import will not automatically trigger when I next launch BibDesk. Running this script takes care of imports.

# Requirements #

* You must replace both appearances of "Path:To:Folder to import from" with the desired path.  (Note that, unlike in some of my other scripts, I used Apple's colon-infused path notation here instead of treating things as POSIX files.  No idea why.  Shouldn't be a problem unless you got on a roll and didn't notice the difference.)

# Cautions #

* This script assumes you've set up preferences to auto-generate citekeys and autofile documents.  I don't know what will happen if you've not done so.


