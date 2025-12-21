include irvine32.inc

.data
; Data storage
numbers     DWORD 10 DUP(?)     ; Input numbers
posArray    DWORD 10 DUP(?)     ; Stores positive numbers popped from stack

posCount    DWORD 0
negCount    DWORD 0
zeroCount   DWORD 0

; Output messages
msgEnter    BYTE "Enter 10 signed numbers:", 0
msgPos      BYTE "Positive count: ", 0
msgNeg      BYTE "Negative count: ", 0
msgZero     BYTE "Zero count: ", 0
msgList     BYTE "Positive numbers (from stack):", 0

.code
main PROC

    ; Prompt user
    mov edx, OFFSET msgEnter
    call WriteString
    call Crlf

    ; PHASE 1: Read numbers, classify, push positives
    mov ecx, 10                     ; Loop counter
    mov esi, OFFSET numbers         ; ESI = numbers array

ReadLoop:
    call ReadInt                    ; EAX = signed input
    mov [esi], eax                 ; Store input in array

    ; Classification
    cmp eax, 0
    jg IsPositive                  ; > 0
    jl IsNegative                  ; < 0

IsZero:
    inc zeroCount
    jmp ContinueRead

IsPositive:
    inc posCount
    push eax                       ; Push only positives
    jmp ContinueRead

IsNegative:
    inc negCount

ContinueRead:
    add esi, 4
    loop ReadLoop

    ; OUTPUT COUNTS
    mov edx, OFFSET msgPos
    call WriteString
    mov eax, posCount
    call WriteInt
    call Crlf

    mov edx, OFFSET msgNeg
    call WriteString
    mov eax, negCount
    call WriteInt
    call Crlf

    mov edx, OFFSET msgZero
    call WriteString
    mov eax, zeroCount
    call WriteInt
    call Crlf
    call Crlf

    ; PHASE 2: Pop positives into separate array
    mov ecx, posCount              ; Number of positives
    mov edi, OFFSET posArray       ; Destination array

PopLoop:
    pop eax
    mov [edi], eax                ; Store popped value
    add edi, 4
    loop PopLoop

    ; OUTPUT POSITIVE NUMBERS
    mov edx, OFFSET msgList
    call WriteString
    call Crlf

    mov ecx, posCount
    mov esi, OFFSET posArray

PrintLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop PrintLoop

    exit
main ENDP
end main
