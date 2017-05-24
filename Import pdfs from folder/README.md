# DESCRIPTION AND USE #

* Leverages Hazel (https://www.noodlesoft.com) to import PDFs files from a watched folder into a pre-specified BibDesk file
* Could probably be modified to work with Folder Actions
* Relies on having auto file set up in BibDesk as well as a rule to auto generate a cite key.


* In Hazel, I have this action set to trigger on files

 ![Hazel rules](HazelRules.png?raw=true) 

The embedded script in the conditions is a one-liner:

```Applescript
if application "BibDesk" is running then return true
```

I include that condition because my ``Import to BibDesk'' folder is actually synced from Dropbox and I don't want to trigger BibDesk to open if I saved something to that folder while I am away from the computer.  That would create too great a chance of corrupting the bib file. Hazel's triggering behavior isn't totally clear to me; you may need to manually trigger the rules to run. 

The second embedded script is the included `Import PDFs from folder.applescript.` Either included it as an embedded script in Hazel or save it elsewhere and have Hazel run it as an action.
