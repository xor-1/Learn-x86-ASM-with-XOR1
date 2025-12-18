; NOTE: YOU HAVE TO COMMENT AND UNCOMMENT THE LINES APPROPRIATELY TO RUN THE PROGRAM CORRECTLY!

; A simple program to demonstrate and understand the basic operations in x86 ASM!

Include irvine32.inc

.data
.code

main PROC

; mov destination, source

; call writeint function is used to show the dump for eax on the terminal - for all registers dump "call dump regs" is used
; Performing addition in diffenet orders
;mov eax, 2
;mov ebx, 6
;add eax, ebx
;mov eax, 3
; seems the value of eax is 11 but trust me its 3 beczz it "OVER WRITES" it
;call writeint

; Performing subtraction
;mov eax, 5
;mov ebx, 3
;sub eax, ebx
;call writeint

; Performing Multiplication:
;mov eax, 5
;mov ebx, 4
;mul ebx ; "mul" always multiplies the registers value with the value of eax
;call writeint
;mov ecx, 2
;mul ecx
;call writeint

; performing division
; always remember to make edx = 0 before division to save good results
;mov edx, 0
;mov eax, 42
;mov ebx, 7
;div ebx
;call writeint

;NEXT:
;DMAS RULE IMPLEMENTATION IN DMAS.asm

exit
main endP
end main