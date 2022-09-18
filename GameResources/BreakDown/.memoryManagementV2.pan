//i think i overengineered this
//it needs to have it so that if the user clicks on the empty slot or the upgrade cost, it deducts that ammount,
//replaces the card, and gives new references for everything
//it might be wiser to just make the matrix 2x2 and ask for the info("matrixrow")
fileglobal totalMemoryArray,memoryArray,upgradeDict,upgradeRamArray,memSlot1,memSlot2,memSlot3,memSlot4,currentMem1,currentMem2,currentMem3,currentMem4
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

//what level the memory currently is
currentMem1=2
currentMem2=1
currentMem3=1
currentMem4=1


define memSlot1,array(memoryArray,currentMem1,",")
define memSlot2,array(memoryArray,currentMem2,",")
define memSlot3,array(memoryArray,currentMem3,",")
define memSlot4,array(memoryArray,currentMem4,",")

//setting to the above for testing
memSlot1=array(memoryArray,currentMem1,",")
memSlot2=array(memoryArray,currentMem2,",")
memSlot3=array(memoryArray,currentMem3,",")
memSlot4=array(memoryArray,currentMem4,",")


//build an array of memory slot titles based on the total memory available
totalMemoryArray=memSlot1+","+memSlot2+","+memSlot3+","+memSlot4

//set the upgrade amounts based on what's in those slots
upgradeRamArray=str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,1,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,2,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,3,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,4,",")))

showvariables totalMemoryArray,upgradeRamArray

«MemoryArray»=totalMemoryArray