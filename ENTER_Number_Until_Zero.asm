INCLUDE Irvine32.inc

.data
msg BYTE "Enter a Number: ",0
msg1 BYTE "Total Numbers: ",0
.code

main PROC
	
	mov ebx, 0
	pl_o:
	mov edx, OFFSET msg
	call writestring
	call readint
	INC ebx

	cmp eax, 0
	je term_i

	jmp pl_o

	term_i:
		mov edx, OFFSET msg1
		call crlf
		mov eax, ebx
		call writestring
		call writeint
		call crlf

	exit

	main ENDP
	END main