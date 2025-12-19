; Practice Task: The Mini-Calculator
; Write a program that performs the following steps:
; Prompt for Input: Display a message asking the user to enter two single-digit numbers.
; Read Input: Capture both digits from the keyboard and store them in registers (e.g., EAX and EBX).
; Perform Arithmetic: Calculate the sum, difference, and product of these two numbers.
; Display Results: Print the results of each operation back to the console.

include irvine32.inc

.data

a DWORD ?
b DWORD ?
result1 DWORD ?
result2 DWORD ?
result3 DWORD ?
msg1 BYTE "ENTER NUMBER: ",0
msg2 BYTE "RESULT: ",0

.code

main PROC
	mov edx, offset msg1
	call writestring
	call readint
	mov a,eax

	call crlf
	call writestring
	call readint
	mov b,eax

	; Performing Multiplication
	mov eax, a
	mov ebx, b
	mul ebx
	mov edx, offset msg2
	call writestring
	call writeint
	call crlf

	; performing addition
	mov eax, a
	mov ebx, b
	add eax, ebx
	call writestring
	call writeint
	mov result2, eax
	call crlf

	; performing subtraction
	mov eax, a
	mov ebx,b
	sub eax,ebx
	call writestring
	call writeint
	mov result3, eax

exit
main endP
end main