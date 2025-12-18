include irvine32.inc
.code

main PROC
	; 100+20+30x10x20/2+100-50

	mov eax,20
	mov ebx,2
	mov edx,0
	div ebx
	; call writeint ; eax = 10
	mov ebx, eax	; ebx = 10
	mov eax,30		
	mov ecx,10
	mul ecx
	mul ebx
	mov ebx,100
	mov ecx,20
	add ebx,ecx
	add eax,ebx
	mov ebx,100
	add eax,ebx
	sub eax,50
	call writeint
	exit
	main endP
	end main