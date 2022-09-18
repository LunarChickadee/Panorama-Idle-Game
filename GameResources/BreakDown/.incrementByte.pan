if currentBytes≥TotalMemory
message "time to upgrade!"
stop
endif
currentBytes=currentBytes+1
showvariables currentBytes

;case currentBytes<8
byteSize="Bits"
;case currentBytes>7
;byteSize="Bytes"
;endcase

