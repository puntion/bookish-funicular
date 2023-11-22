%include "io64.inc"

section .text
global main
main:   
    mov rbp, rsp; for correct debugging
    
    ;함수 (프로시저 procedure  서브루틴 subroutine)
    call PRINT_MSG
    
    mov eax, 10
    mov ebx, 5
    call MAX
    PRINT_DEC 4, ecx
    NEWLINE
        
    xor rax, rax
    ret
   
PRINT_MSG:
    PRINT_STRING msg
    NEWLINE
    ret
    
;ex) 두 값중 더 큰 값을 반환하는 max
;eax와 ebx입력값을 ecx에 반환
MAX:
    cmp eax, ebx
    jg L1
    mov ecx, ebx
    jmp L2
L1: 
    mov ecx, eax
L2:
    ret
    
    ;그런데 인자가 10개라면?
    ;eax, ebx에 이미 중요한 값이 있다면?
    ;[!] .data .bss 사용하면? 
    ;인자를 도대체 몇개를 할당하지?
    
    ;다른 메모리 구조가 필요
    ;- 꿈이 유효한 동안에는 그 꿈을 지시켜야함 (유효범위 개념)
    ;- 꿈이 끝나면 그 꿈을 부셔버려도 됨(정리 개념)
    ;- 꿈에서도 꿈을 꿀 수 있다는 것을 고려(유동적 유효범위 확장)
    
    ;[!] 스택(stack)이라는 메모리 영역을 사용
    ;함수가 사용하는 일종의 메모장
    ;- 매개변수 전달
    ;- 돌아갈 주소 관리

section .data
    msg db 'Hello World', 0x00
    a dd 0
    
 
    
section .bss
    ;resb(1) resw(2) resd(4) resq(8)
    num resb 1