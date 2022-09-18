global currentBytes, gameDict, byteSize,playerName,totalBytes,
newPlayer,nameChoice,loopCount,autoON,currentIncrement,currentGoal,
inventoryArray,totalMemoryArray,memoryArray,upgradeDict,
upgradeRamArray,memSlot1,memSlot2,memSlot3,memSlot4,currentMem1,currentMem2,currentMem3,currentMem4
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

//initalizes the memory amounts and upgrade amounts

upgradeDict=""
upgradeRamArray=""

//options the memory can be
memoryArray="Empty Slot,8 Bits,16 Bits,32 Bits,64 Bits"

//what the upgrade cost should be based on the memory slot
setdictionaryvalue upgradeDict,"Empty Slot","8 Bits"
setdictionaryvalue upgradeDict,"8 Bits","32 Bits"
setdictionaryvalue upgradeDict,"16 Bits","64 Bits"
setdictionaryvalue upgradeDict,"32 Bits","64 Bits"
setdictionaryvalue upgradeDict,"32 Bits","64 Bits"

if «MemoryArray»=""
//what level the memory currently is
    currentMem1=2
    currentMem2=1
    currentMem3=1
    currentMem4=1

//setting the array values to the defaults
    memSlot1=array(memoryArray,currentMem1,",")
    memSlot2=array(memoryArray,currentMem2,",")
    memSlot3=array(memoryArray,currentMem3,",")
    memSlot4=array(memoryArray,currentMem4,",")
else

//what level the memory currently is in MemoryArray field
    currentMem1=arraysearch(memoryArray,array(«MemoryArray»,1,","),1,",")
    currentMem2=arraysearch(memoryArray,array(«MemoryArray»,2,","),1,",")
    currentMem3=arraysearch(memoryArray,array(«MemoryArray»,3,","),1,",")    
    currentMem4=arraysearch(memoryArray,array(«MemoryArray»,4,","),1,",") 

//setting the array values 
    memSlot1=array(memoryArray,currentMem1,",")
    memSlot2=array(memoryArray,currentMem2,",")
    memSlot3=array(memoryArray,currentMem3,",")
    memSlot4=array(memoryArray,currentMem4,",")
endif


//build an array of memory slot titles based on the total memory available
totalMemoryArray=memSlot1+","+memSlot2+","+memSlot3+","+memSlot4

//set the upgrade amounts based on what's in those slots
upgradeRamArray=str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,1,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,2,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,3,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,4,",")))

showvariables totalMemoryArray,upgradeRamArray

«MemoryArray»=totalMemoryArray




