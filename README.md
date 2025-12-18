# MASM x86 Fundamentals — Registers, Segments, Irvine32

> Purpose: Clear, no-BS notes for understanding **x86 registers, segments, offsets**, and **Irvine32 basics**. These notes are meant for *learning now* and *revisiting later* without confusion.

---

## 1. Mental Model (Read This First)

- The CPU understands **registers, memory addresses, and instructions**.
- It does **not** understand variables, arrays, or functions.
- Every memory access resolves to an **address**.

In classic x86 (8086 model):

```
Physical Address = Segment × 16 + Offset
```

Segments exist because registers were **16-bit**, but memory addressing required **20-bit** addresses.

---

## 2. Register Categories (What They *Actually* Mean)

### 2.1 Data Registers

| Register | Primary Role | Why It Exists |
|--------|-------------|---------------|
| AX / EAX | Accumulator | Implicitly used by arithmetic, MUL/DIV, I/O |
| BX / EBX | Base | Designed for memory addressing |
| CX / ECX | Counter | Used by `loop`, shifts, `rep` instructions |
| DX / EDX | Data Extension | High part of MUL/DIV, I/O ports |

**Key rule:** These are not generic variables. Some instructions *require* specific registers.

---

### 2.2 Segment Registers (Memory Base Selectors)

| Segment | Purpose | Default Usage |
|-------|--------|---------------|
| CS | Code Segment | Instruction fetch (`CS:IP`) |
| DS | Data Segment | Most data access |
| SS | Stack Segment | Stack operations (`SS:SP/ESP`) |
| ES | Extra Segment | String destination |

**Important truths:**
- Segment registers do **not** store data.
- They store the **base address** of a 64 KB window.
- The CPU always combines **segment + offset**.

---

### 2.3 Index & Pointer Registers

| Register | Role |
|--------|------|
| SI / ESI | Source index (arrays, strings) |
| DI / EDI | Destination index |
| BP / EBP | Base pointer (stack frame) |
| SP / ESP | Stack pointer |

Valid memory forms (hardware-defined):

```
[bx] → DS:BX
[si] → DS:SI
[di] → DS:DI
[bp] → SS:BP   ; stack-based
```

This is **not syntax choice** — this is **CPU design**.

---

## 3. Offset (The Most Misunderstood Concept)

- **Offset is NOT a register**.
- It is a **number** representing distance from a segment base.

Example:
```asm
myVar db 5
```

MASM assigns:
- `DS` → base of data segment
- `offset myVar` → numeric displacement (e.g., `0003h`)

Actual address used by CPU:
```
DS × 16 + offset(myVar)
```

`offset myVar` is **not a memory access**. It’s just a number.

---

## 4. Segment : Offset in Action

Example:
```
DS = 2000h
SI = 0010h
```

CPU computes:
```
Physical = 2000h × 10h + 0010h = 20010h
```

Every memory access follows this rule (real-mode model).

---

## 5. Irvine32 Library (What It Does and Hides)

Irvine32 simplifies learning by:
- Hiding segment setup
- Using a flat memory model
- Providing I/O helpers

### Common Procedures

| Procedure | Purpose | Requirements |
|---------|--------|--------------|
| WriteInt | Print signed integer | Value must be in EAX |
| DumpRegs | Show CPU state | No arguments |

**Warning:**
- Procedures modify registers.
- Never assume registers are preserved unless documented.

---

## 6. Arithmetic Instructions (What Actually Changes)

Example:
```asm
add eax, 5
```

Effects:
- `EAX` overwritten
- Flags modified:
  - ZF (Zero)
  - SF (Sign)
  - CF (Carry)
  - OF (Overflow)

**Rule:** Arithmetic always destroys flags.

---

## 7. DumpRegs (Correct Usage)

`DumpRegs` is not printing — it is **inspection**.

Use it to:
- Verify register values
- Observe flag changes
- Debug instruction effects

If you can’t explain the output, you don’t understand the code.

---

## 8. Procedure Calls (What CALL Actually Does)

Instruction:
```asm
call WriteInt
```

CPU steps:
1. Push return address onto stack
2. Jump to procedure
3. Execute procedure
4. `ret` pops address
5. Execution resumes

Stack involvement is **mandatory**.

---

## 9. Common Beginner Mistakes (Avoid These)

❌ Treating registers as variables
❌ Forgetting segment defaults
❌ Assuming registers survive procedure calls
❌ Ignoring flags
❌ Mixing real-mode and flat-model concepts without awareness

---

## 10. Rules to Memorize

- Segment registers select **where**, offsets select **what**.
- `[bp]` uses `SS`, not `DS`.
- `offset` gives a number, not data.
- Procedures can destroy registers.
- CPU does exactly what you tell it — nothing more.

---

## 11. Self-Test Questions

1. Which register must hold the value before calling `WriteInt`?
2. Why does `[bp]` default to `SS`?
3. Is `offset myVar` a memory access?
4. Which flags change after `ADD`?

If you can answer all four cleanly, you’re progressing correctly.

---

**End of Notes**

