; PROGRAM: Expression Solver
; EXPRESSION: Z = 2(X * Y) + (6W - V)
; VALUES: X=10, Y=7, W=15, V=4

include irvine32.inc

.data
    X DWORD 10
    Y DWORD 7
    W DWORD 15
    V DWORD 4

.code
main PROC
    ; 1. INITIAL REGISTER ASSIGNMENT
    mov eax, X      ; EAX = 10
    mov ebx, Y      ; EBX = 7
    mov ecx, W      ; ECX = 15
    mov edx, V      ; EDX = 4
    
    
    ; 2. SAFETY STEP
    
    ; Because MUL stores the high-bits of the result in EDX,
    ; the value of V (4) will be wiped out immediately.
    ; We must save V to a "Safe" register (ESI) first.
    mov esi, edx    ; ESI = 4 (Safe copy of V)

    ; 3. LEFT SIDE: 2(X * Y)
    ; Current: EAX=10, EBX=7
    mul ebx         ; EAX = 10 * 7 = 70 (EDX becomes 0)
    
    mov ebx, 2      ; Prepare to multiply by 2
    mul ebx         ; EAX = 70 * 2 = 140
    
    mov edi, eax    ; Save '140' into EDI (Safe Storage for Left Side)

    ; 4. RIGHT SIDE: (6W - V)
    ; We need to calculate 6 * W. 
    ; ECX currently holds W (15).
    mov eax, 6      ; Move 6 into accumulator for MUL
    mul ecx         ; EAX = 6 * 15 = 90
    
    ; Now Subtract V (which we saved in ESI)
    sub eax, esi    ; EAX = 90 - 4 = 86

    ; 5. FINAL SUM
     ; Add Left Side (EDI) to Right Side (EAX)
    add eax, edi    ; EAX = 86 + 140 = 226

    call writeint   ; Should print +226
    call crlf

    exit
main endP
end main