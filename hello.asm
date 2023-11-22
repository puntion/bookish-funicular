%include "io64.inc"

section .text
global main
main:
    ;write your code here
    ;주석
    ;10진수(0 1 2 3 4 5 6 7 8 9)
    
    ;2진수 (0 1)
    ;0b0 0b1 0b11 0b100
    
    ;16진수 (0 1 2 3 4 5 6 7 8 9 A B C D E F)
    ;0x00 0x01
    
    ;0b 1001 0101 = 0x95
    
    ;8bit  = 1byte
    ;16bit = 2byte = 1word
    ;32bit = 4byte = 2word = 1dword
    ;64bit = 8byte = 4word = 2dword = 1qword
    
    ;mov reg1, cst
    ;mov reg1, reg2
    ;PRINT_STRING msg
    
    mov eax, 0x1234
    mov rbx, 0x12345678
    mov cl, 0xff
    
    mov al, 0x00
    mov rax, rdx
    
    ;메모리 <-> 레지스터
    mov rax, a  ;a라는 바구니의 주소값을 rax에 복사
    mov rax, [a] ;a라는 바구니 안에 있는 값을 rax에 복사
    mov al, [a]
    mov [a], byte 0x55
    mov [a], word 0x6666
    mov [a], cl
    
    xor rax, rax
    ret
    
    ;변수의 선언 및 사용
    ;변수는 데이터를 저장하는 바구니
    ;처음에 바구니 사용하겠다 선언(이름과 크기 지정)
    
    ;메모리에는 구분할 수 있또록 주소(번지수)가 있다
section .data
    ;초기화 된 데이터
    ;[변수이름] [크기] [초기값]
    ;[크기] db(1byte) dw(2byte) dd(4byte) dq(8byte)
    ;msg db "Hello World!", 0x00
    a db 0x11  ;[0x11]
    b dw 0x2222
    c dd 0x33333333
    d dq 0x4444444444444444
    
section .bss
    ;초기화 되지 않은 데이터
    ;[변수이름] [크기] [개수]
    ;[크기] resb(1) resw(2) resd(4) resq(8)
    e resb 10