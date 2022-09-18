if Inventory=""
initializedictionary gameDict,"Loops","0","nestedifs","0"
endif
showvariables gameDict
/*
find exportline() contains "Idle Game"
field Inventory 
copycell
pastecell
endif
*/
Field Inventory
call .updateInventory
global inventoryArray
inventoryArray=«Inventory»