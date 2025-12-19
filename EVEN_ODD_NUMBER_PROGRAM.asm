; CHECKING IF THE NUMBER IS EVEN OR ODD (INPUT BY USER)
; THIS PROGRAM DEMONSTRATES THE USE OF 
include irvine32.inc

.data

	n DWORD ?
	msg BYTE "Enter a Number: ",0
	msg1 BYTE "Number is Even!",0
	msg2 BYTE "Number is Odd!",0

.code

	main PROC
	
	mov edx, offset msg
	call writestring
	call readint
	mov n,eax
	call crlf

	mov edx,0
	mov eax, n
	mov ebx,2
	div ebx
	cmp edx,0
	je L1
	mov edx, offset msg2
	call writestring
	jmp L2

	L1:
		mov edx, offset msg1
		call writestring
		call crlf

	L2:
		exit

	main endP
	end main
