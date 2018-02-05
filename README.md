# UnderWaterShark
Game of avoiding sharks trying to eat you. Written in BASIC.
This is a game for batari basic that can be run on an emulator. 
You will need the Batari Basic toolkit, which is here http://atariage.com/forums/topic/123849-visual-bb-10-a-new-ide-for-batari-basic/. 
Compiling is done from the command line in Windows, Terminal for Mac. 
There is also a reference for the toolkit at http://www.randomterrain.com/atari-2600-memories-batari-basic-commands.html.

You will also need the Stella Atari 2600 emulator to test your game. You can get it at http://stella.sourceforge.net/.

To compile for Mac, open a terminal window, navigate into the bataribasic directory, and try:
./2600bas.sh sample.bas

This will make a sample.bas.asm and sample.bas.bin file. The bin file is your binary to run in the Stella emulator.

For Windows, the command is similar:
2600basic.bat sample.bas

***GAMEPLAY***
Move the fish around to avoid black fish. Eat the other fish. Black fish will move towards you from the right side. After collecting 20 fish, game will speed up considerably. 
Move using arrow keys. Eat with spacebar. 
