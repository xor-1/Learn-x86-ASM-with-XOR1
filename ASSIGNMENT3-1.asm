include irvine32.inc
.data
; Data storage
marks       DWORD 5 DUP(?)
revMarks    DWORD 5 DUP(?)
passCount   DWORD 0
failCount   DWORD 0

; Output strings
msgEnter    BYTE "Enter marks:", 0
msgPass     BYTE "Number of passed students: ", 0
msgFail     BYTE "Number of failed students: ", 0
msgReverse  BYTE "Reversed list of marks:", 0

.code
main PROC

    ; Prompt user
    mov edx, OFFSET msgEnter
    call WriteString
    call Crlf

    ; PHASE 1: Read marks, validate, count pass/fail
    mov ecx, 5
    mov esi, OFFSET marks

ReadLoop:
    call ReadInt                ; EAX = input mark

    ; Boundary check (0–100)
    cmp eax, 0
    jl InvalidMark
    cmp eax, 100
    jg InvalidMark
    jmp ValidMark

InvalidMark:
    mov eax, 0                  ; Invalid input = 0

ValidMark:
    mov [esi], eax              ; Store mark

    ; Pass / Fail logic
    cmp eax, 40
    jl CountFail

CountPass:
    inc passCount
    jmp ContinueInput

CountFail:
    inc failCount

ContinueInput:
    add esi, 4
    loop ReadLoop

    ; PHASE 2: Push marks onto stack
    mov ecx, 5
    mov esi, OFFSET marks

PushLoop:
    mov eax, [esi]
    push eax
    add esi, 4
    loop PushLoop

    ; PHASE 3: Pop into reverse array
    mov ecx, 5
    mov edi, OFFSET revMarks

PopLoop:
    pop eax
    mov [edi], eax
    add edi, 4
    loop PopLoop

    ; OUTPUT RESULTS

    ; Print pass count
    mov edx, OFFSET msgPass
    call WriteString
    mov eax, passCount
    call WriteInt
    call Crlf

    ; Print fail count
    mov edx, OFFSET msgFail
    call WriteString
    mov eax, failCount
    call WriteInt
    call Crlf

    ; Print reversed marks header
    mov edx, OFFSET msgReverse
    call WriteString
    call Crlf

    ; Print reversed marks
    mov ecx, 5
    mov esi, OFFSET revMarks

PrintLoop:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop PrintLoop

    exit
main ENDP
end main
