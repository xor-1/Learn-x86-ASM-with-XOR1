; Practice Task: The Mini-Calculator
; Write a program that performs the following steps:
; Prompt for Input: Display a message asking the user to enter two single-digit numbers.
; Read Input: Capture both digits from the keyboard and store them in registers (e.g., EAX and EBX).
; Perform Arithmetic: Calculate the sum, difference, and product of these two numbers.
; Display Results: Print the results of each operation back to the console.

include irvine.inc

.data

a DWORD ?
b DWORD ?
result1 DWORD 
msg1 BYTE "ENTER NUMBER: ",0
msg2 BYTE "RESULT: ",0

.code
	mov edx, offset msg1
	call writestring
	call readint
	mov a,eax

	call crlf

	call readint
	mov b,eax

	; Performing Multiplication
	mul ebx
	mov result1, eax

	; Performing addition
	callw




main PROC




exit
main endP
end main