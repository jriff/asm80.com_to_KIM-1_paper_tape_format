# Asm80.com hex fomat to KIM-1 pager tape format

A Ruby script that converts the asm80.com hex format to the KIM-1 paper tape format. 

# Usage
Reads asm80.com output from stdin and dumps the reault to stdout. 

OSX example:

    pbpaste | ./asm80ToPaperTape.rb | pbcopy
This will convert the contents of the OSX clipboard and copy the result to the clipboard. 

Remember to change the shebang line (#!) to your ruby path!

