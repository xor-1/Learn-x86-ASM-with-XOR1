include irvine32.inc

.data
; Warehouse data (8 product quantities)
products        DWORD 12, 4, 25, 7, 18, 2, 40, 22

lowCount        DWORD 0
sufficientCount DWORD 0

; Output messages
msgTitle    BYTE "Warehouse Stock Report", 0
msgLow      BYTE "Low-stock items count: ", 0
msgSuff     BYTE "Sufficient-stock items count: ", 0
msgList     BYTE "Low-stock quantities (restock):", 0

.code
main PROC

    ; Print title
    mov edx, OFFSET msgTitle
    call WriteString
    call Crlf
    call Crlf

    ; PHASE 1: Scan array, count, push low-stock items
    mov ecx, 8                      ; Number of products
    mov esi, OFFSET products        ; ESI points to products array

ScanLoop:
    mov eax, [esi]                 ; Load quantity into EAX

    ; Check if quantity < 10
    cmp eax, 10
    jl LowStock

SufficientStock:
    inc sufficientCount            ; Count sufficient-stock items
    jmp ContinueScan

LowStock:
    inc lowCount                   ; Count low-stock items
    push eax                       ; Push low-stock quantity onto stack

ContinueScan:
    add esi, 4                     ; Move to next product
    loop ScanLoop

    ; OUTPUT COUNTS
    mov edx, OFFSET msgLow
    call WriteString
    mov eax, lowCount
    call WriteInt
    call Crlf

    mov edx, OFFSET msgSuff
    call WriteString
    mov eax, sufficientCount
    call WriteInt
    call Crlf
    call Crlf

    ; PHASE 2: Pop and display low-stock quantities
    mov edx, OFFSET msgList
    call WriteString
    call Crlf

    mov ecx, lowCount              ; Number of low-stock items

PopLoop:
    pop eax                        ; Get last low-stock item
    call WriteInt                  ; Display quantity
    call Crlf
    loop PopLoop

    exit
main ENDP
end main