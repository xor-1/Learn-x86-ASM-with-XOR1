INCLUDE Irvine32.inc

.data
n1 DWORD 4
n2 DWORD 2
msg BYTE "Greater!",0
.code
	main PROC

		mov eax, n1
		mov ebx, n2

		cmp eax, ebx
		jb done
		mov edx, OFFSET msg
		call writestring
		done:
		exit
	main ENDP
	end main
