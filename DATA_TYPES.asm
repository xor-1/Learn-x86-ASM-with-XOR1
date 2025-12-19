; DATATYPES in ASM
; BYTE - 8 bit
; WORD - 16 bit
; DWORD - 32 bit (mostly used as we have 32 bit registers)
; QWORD - 64 bit

include irvine32.inc

.data

data1 DWORD 50
data2 DWORD 25
data3 DWORD 25

; WE mostly use BYTE for strings.

msg BYTE "YES! I have got ",0		; NEVER FORGET TO ADD " ,0" IN THE END OF STRING AS I INDICATES THE END OF STRING!	
msgg BYTE " marks in exam.",0

.code

main PROC

; MOVING VARIABLE VALUES INTO THE REGISTERS (ADDING)
mov eax,data1
add eax,data2
add eax,data3

; WE USE EDX FOR DIV REM HOLDER AND OUTPUT OPERATIONS AS FUNCTION "CALL WRITESTRING" FETCHES VALUES FROM EDX AND DISPLAYS ON TERMINAL
mov edx,offset msg
call writestring
call writeint
mov edx, offset msgg
call writestring

; IN THIS TUTORIAL I HAVE BASICALLY DID THE STRING CONCATENATION WITH INT DATA TO BETTER UNDERSTAND THE WORKING OF OPERATIONS

exit
main endP
end main