%include "io64.inc"

section .text
global main
main:   
    mov rbp, rsp; for correct debugging
    
    ;write your code here
    PRINT_STRING msg
    NEWLINE
        
    GET_DEC 1, al
    GET_DEC 1, num
    
    PRINT_DEC 1, al
    NEWLINE
    PRINT_DEC 1, num
     
    xor rax, rax
    ret
    
section .data
    msg db 'Hello World', 0x00 ;0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64, 0x0
    a db 0x11, 0x11, 0x11, 0x11
    b dd 0x12345678
    ;리틀 엔디언 : 캐스팅에 유리
    ;빅 엔디언 : 숫자비교에 유리

section .bss
    num resb 1