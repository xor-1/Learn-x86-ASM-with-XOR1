INCLUDE Irvine32.inc

.data
a1 DWORD 3,2,5,9,4
msg BYTE "Max: ",0
.code
	main PROC
	mov esi, OFFSET a1
	mov eax, [esi]				; Assumes that the First is the greatest.
	add esi, 4					; Start from the next element.
	mov ecx, 4					; Remaining Elements are four
	max_a1:						; Loop starts
		cmp eax, [esi]
		jge greatest
		mov eax, [esi]
		greatest:
			add esi,4
	loop max_a1					; Loop Ends
	mov edx, OFFSET msg
	call writestring
	call writeint
	call crlf


	exit
main ENDP
end main

			

