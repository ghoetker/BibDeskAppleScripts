# DESCRIPTION AND USE 

* Leverages Hazel (https://www.noodlesoft.com) to import bib files from a watched folder into the frontmost BibDesk file
* Could probably be modified to work with Folder Actions
* Because Hazel triggers on individual files, the script is not set up for importing multiples files at once. One could modify it to do so.
* In Hazel, I have this action set to trigger on files

 [Hazel rules](./HazelRules.png) 

The embedded script in the conditions is a one-liner:

```Applescript
if application "BibDesk" is running then return true
```

I include that condition because my ``Import to BibDesk'' folder is actually synced from Dropbox and I don't want to trigger BibDesk to open if I saved something to that folder while I am away from the computer.  That would create too great a chance of corrupting the bib file. Hazel's triggering behavior isn't totally clear to me; you may need to manually trigger the rules to run. 

The second embedded script is the included `Import bib files from folder.applescript.` Either included it as an embedded script in Hazel or save it elsewhere and have Hazel run it as an action.

The "Move" step is totally optional.  I like it because I can manually inspect bib files I'd sent to import in the event of error.