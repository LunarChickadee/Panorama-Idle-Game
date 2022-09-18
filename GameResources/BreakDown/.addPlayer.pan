gameDict=""
currentBytes=0
byteSize=""
gettext "What's your name?",newPlayer
yesno "Your name is "+newPlayer+"?"
if clipboard()="No"
rtn
endif

addrecord
field «Player»
«Player»=newPlayer
Bytes=0
CurrentSize=1
LifetimeBytes=0
TotalMemory=8

call .inventoryLoops

openform "Game"
showvariables currentBytes, gameDict, byteSize,playerName,totalBytes,
newPlayer,nameChoice,loopCount,autoON,currentIncrement,currentGoal
permanent nameList
//set this as an array or dict value and have the player "install" ram?


