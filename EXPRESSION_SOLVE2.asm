; Z = 3(A x (B + C)) + ((D x E) - (F x G + H))
; A = 2
; B = 4
; C = 3
; D = 5
; E = 6
; F = 2
; G = 3
; H = 4

include irvine32.inc

.data
A DWORD 2
B DWORD 4
CC DWORD 3
D DWORD 5
E DWORD 6
F DWORD 2
G DWORD 3
H DWORD 4

.code
main PROC
	mov eax, B
	mov ebx, CC
	add eax, ebx

	mov ebx, A
	mul ebx

	mov ebx, 3
	mul ebx

	mov ecx, eax

	mov eax, D
	mov ebx, E
	mul ebx
	mov esi, eax

	mov eax, G
	mov ebx, F
	mul ebx
	add eax, H

	mov ebx, eax
	mov eax, esi
	sub eax, ebx

	add eax, ecx
	call writeint
	
	exit
main endP
end main