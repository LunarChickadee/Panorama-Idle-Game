//i think i overengineered this
//it needs to have it so that if the user clicks on the empty slot or the upgrade cost, it deducts that ammount,
//replaces the card, and gives new references for everything
//it might be wiser to just make the matrix 2x2 and ask for the info("matrixrow")
fileglobal totalMemoryArray,memoryDict,upgradeDict,upgradeRamArray
memoryDict=""
upgradeDict=""
upgradeRamArray=""
setdictionaryvalue memoryDict,"8","8 Bits,Empty Slot,Empty Slot,Empty Slot"

setdictionaryvalue upgradeDict,"Empty Slot","8 bits"
setdictionaryvalue upgradeDict,"8 Bits","32 bits"

totalMemoryArray=str(getdictionaryvalue(memoryDict,str(TotalMemory)))
upgradeRamArray=str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,1,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,2,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,3,",")))+","+
str(getdictionaryvalue(upgradeDict,array(totalMemoryArray,4,",")))

showvariables totalMemoryArray,upgradeRamArray

