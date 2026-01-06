INCLUDE Irvine32.inc

.data
	arr1 DWORD 6 DUP(?)
	msg BYTE "Enter a Number: ",0
	msg2 BYTE " ",0

.code
	main PROC
		mov EDX, OFFSET msg
		mov ECX, 6
		mov ESI, OFFSET arr1
		mov EAX, [ESI]

		input_arr:
			call writestring
			call readint
			call crlf
			mov [ESI], EAX
			add esi, 4
		loop input_arr

		mov ECX, 6
		mov ESI, OFFSET arr1

		mov EDX, OFFSET msg2
		print_loop:
			mov EAX, [ESI]
			call writeint
			call writestring
			add ESI, 4
		loop print_loop
	exit
	main ENDP
	end MAIN