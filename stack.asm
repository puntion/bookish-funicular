%include "io64.inc"

section .text
global main
main:   
    mov rbp, rsp; for correct debugging
    
    ;스택 메모리, 스택 프레임
    ;레지스터는 다양한 용도로 사용
    ;- a b c d 범용 레지스터
    ;-포인터 레지스터 (포인터 = 위치를 가리키는~)
    ;-- ip (Instruction Pointer) : 다음 수행 명령어의 위치
    ;-- sp (Stack Pointer) : 현재 스택 top 위치 (일종의 커서)
    ;-- bp 9Base Pointer) : 스택 상대주소 계산용
    
    push 1
    push 2
    call MAX
    PRINT_DEC 8, rax
    NEWLINE
    add rsp, 16
    
    xor rax, rax
    ret
MAX:
    push rbp
    mov rbp, rsp
    
    mov rax, [rbp+16]
    mov rbx, [rbp+24]
    cmp rax, rbx
    jg L1
    mov rax, rbx
L1:
    pop rbp
    ret
 
section .data
    msg db 'Hello World', 0x00
   
 
    
section .bss
    ;resb(1) resw(2) resd(4) resq(8)
    num resb 1