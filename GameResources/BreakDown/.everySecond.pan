


global ExecuteEverySecond
ExecuteEverySecond={
if loopCount>0 and currentBytes<TotalMemory
    currentBytes=currentBytes+currentIncrement
showvariables currentBytes

progressbar "Progress","Bar",val(currentBytes),currentGoal,0
endif

if currentBytes=TotalMemory
message "Time to upgrade!"
stop
endif
}
