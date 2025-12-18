# MASM Arithmetic Expression — MUL & DIV Practice

## Problem Statement

Evaluate the following arithmetic expression using **x86 assembly (MASM)** with the **Irvine32** library:

```
100 + 20 + 30 × 10 × 20 / 2 + 100 − 50
```

Constraints:
- Use `MUL` and `DIV` instructions
- Respect operator precedence manually
- Track register usage explicitly

---

## Key Concepts Tested

- Implicit register usage of `MUL` and `DIV`
- Correct ordering of arithmetic instructions
- Proper handling of `EDX:EAX` before division
- Register discipline (knowing what each register represents)

---

## Final Correct Assembly Code

```asm
include irvine32.inc
.code

main PROC
    ; Expression:
    ; 100 + 20 + 30 × 10 × 20 / 2 + 100 − 50

    ; Step 1: Compute 20 / 2
    mov eax, 20
    mov ebx, 2
    mov edx, 0        ; Required before DIV
    div ebx           ; EAX = 10
    mov ebx, eax      ; EBX = 10

    ; Step 2: Compute 30 × 10 × (20 / 2)
    mov eax, 30
    mov ecx, 10
    mul ecx           ; EAX = 300
    mul ebx           ; EAX = 3000

    ; Step 3: Add 100 + 20
    mov ebx, 100
    mov ecx, 20
    add ebx, ecx      ; EBX = 120
    add eax, ebx      ; EAX = 3120

    ; Step 4: Add remaining +100
    mov ebx, 100
    add eax, ebx      ; EAX = 3220

    ; Step 5: Subtract 50
    sub eax, 50       ; EAX = 3170

    ; Output result
    call WriteInt
    exit
main ENDP

end main
```

---

## Step-by-Step Evaluation

1. `20 / 2 = 10`
2. `30 × 10 = 300`
3. `300 × 10 = 3000`
4. Additions: `+100 +20 +100 = +220`
5. Subtraction: `−50`

Final result:
```
3000 + 220 − 50 = 3170
```

---

## Important Notes

- `DIV` uses `EDX:EAX` → `EDX` **must** be cleared for 32-bit division
- `MUL` implicitly uses `EAX` and stores the result in `EDX:EAX`
- Instruction order replaces compiler precedence — **you are the compiler**
- Losing track of register meaning leads to silent logic bugs

---

## Learning Outcome

This exercise reinforces:
- Low-level arithmetic reasoning
- Manual precedence handling
- Safe and intentional register usage

If you can trace this program mentally and predict register values at each step, you are learning assembly correctly.

---

**Result:** `3170`

