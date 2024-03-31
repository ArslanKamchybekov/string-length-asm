section .data
    string db "Hello, world!", 0  ; string

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, string  ; Load address of string into esi
    xor ecx, ecx     ; Clear ecx register to use as counter

count_length:
    cmp byte [esi + ecx], 0  ; Compare the byte at address esi+ecx with null terminator
    je end_counting          ; If it's null terminator, end counting
    inc ecx                  ; Increment counter
    jmp count_length         ; Continue counting

end_counting:
    ; Exit the program
    mov eax, 1        ; sys_exit
    xor ebx, ebx      ; exit code 0
    int 0x80          ; call kernel