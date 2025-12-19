; GUESS A NUMBER GAME

include irvine32.inc

.data
	num DWORD 7
	guess DWORD ?

	msg BYTE "Enter a Number: ",0
	msg1 BYTE "YEAH! YOU WON.",0
	msg2 BYTE "DAMN! YOU LOSE.",0

.code
	main PROC

	mov edx, offset msg
	call writestring		; GETTING A GUESS NUMBER FROM THE USER
	call readint
	mov guess, eax
	call crlf

	mov eax,guess
	cmp eax, num			; COMPARING THE NUMBER AND THE GUESS
	je L1					; JUMPING TO L1 IF BOTH ARE EQUAL
	mov edx, offset msg2
	call writestring
	call crlf
	jmp L2					; JUMPING TO L2 IF NOT EQUAL

	L1:
		call crlf
		mov edx, offset msg1
		call writestring

	L2:
		exit

	main endP
	end main