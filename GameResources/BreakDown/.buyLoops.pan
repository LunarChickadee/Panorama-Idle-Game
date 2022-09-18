global loopCount,currentIncrement,Price
//move this to initalize
global currentGoal
currentGoal=1028

Price=8 //get this from a dictionary
loopCount=0
;currentIncrement=0
currentBytes=currentBytes-Price

loopCount=loopCount+1
currentIncrement=loopCount

call .everySecond