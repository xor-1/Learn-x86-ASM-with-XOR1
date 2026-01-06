INCLUDE Irvine32.inc
.data
	oddn DWORD 0
	evenn DWORD 0
	ARRAY_SIZE = 6

	msg BYTE "Even!",0
	msg1 BYTE "Odd!",0
	msg2 BYTE "Enter a Number: ",0

	arr1 DWORD ARRAY_SIZE DUP(?)

.code
	main PROC
		
		mov edx, OFFSet msg2	
		mov ESI, OFFSET arr1
		mov ecx, ARRAY_SIZE

		loop_in:
			call writestring
			call readint
			mov [ESI], EAX
			add ESI, 4
		loop loop_in

		mov ecx, ARRAY_SIZE
		mov ESI, OFFSET arr1
		loop_even_odd:
			mov EAX, [ESI]
			TEST EAX, 1
			jz Evev

			INC oddn
			
			jmp loop_end
			
			Evev:
			INC evenn
			
			loop_end:

			add ESI, 4

		loop loop_even_odd
			
			mov eax, evenn
			mov edx, offset msg
			call writestring
			call writeint
			call crlf

			mov eax, oddn
			mov edx, offset msg1
			call writestring
			call writeint
			call crlf

		exit

main ENDP
END main