global currentBytes, gameDict, byteSize,playerName,totalBytes,
newPlayer,nameChoice,loopCount,autoON,currentIncrement,currentGoal,
inventoryArray
permanent nameList

openform "Game"

define playerName,""
define currentBytes,0
define currentSize,1
define byteSize,""
define nameList,"New Player"
define loopCount,0
define autoOn,False()
define currentGoal,0
define nameChoice,""
define currentIncrement,0

newPlayer="Enter Name Here"

//create player list
if info("records")>1
    arraybuild nameList,¶,"",«Player»
    nameList="New Player"+¶+nameList
    ;displaydata nameList
endif

//PlayerSelection
superchoicedialog nameList, nameChoice, {caption="Choose your player. Or select New Player to make one."}

//creates a new player
if nameChoice="New Player"
    call .addPlayer
else
//sets the game where you left off
//you'll want a world timer for idling while the file is closed
find «Player»=nameChoice
if (not info("found"))
    message "Player"+nameChoice+"not found."
endif
endif

//initializes the inventory
if Inventory=""
    initializedictionary gameDict,"Loops","0","ifs","0","if/else","0","nestedifs","0"
    showvariables gameDict
else
    gameDict=InventoryDictionary
    currentBytes=Bytes
    totalBytes=LifetimeBytes
    byteSize=CurrentSize
endif

Field Inventory
call .updateInventory
inventoryArray=«Inventory»

showvariables gameDict, inventoryArray





