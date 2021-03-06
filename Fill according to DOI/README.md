# DESCRIPTION AND USE #

Filling in the rest of a bibliographic entry given a DOI.

* Select a record containing a DOI
* Run this script.
* To the degree possible, the fields in the original record will be filled according to the DOI

I will often fill in part of the Author and Title fields (perhaps copying from a PDF I've imported) and then run my "Find DOI" script. Assuming it finds a DOI, I will then run this script.  Viola -- a full entry with minimal typing.

# LIMITATIONS #

This script uses BibDesk's own importing functionality (I think it is essentially what you would get if you had the DOI in your clipboard and selected the Publication/New Publication from Clipboard menu item).  This may fail if the entry being returned is malformed (from BibDesk's perspective).


# CAUTIONS #

* This script will destructively overwrite all fields in the original record.  For my purposes, this is good behavior. If it isn't for you, you'll need to edit the code.
* The code assumes you have set preferences to allow the autogeneration of cite keys and the auto filing of publications.  I have no idea what will happen if you have not.  If you don't find the behavior desired, change as desired.


