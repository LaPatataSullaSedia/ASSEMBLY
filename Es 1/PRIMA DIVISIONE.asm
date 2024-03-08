
section .data
msg db "Marro la divisione(8 e 4): " 
len equ $ - msg  

section .bss
dux resb 1

section .text
global _start

_start:
mov	al, '8'
sub al, '0'
mov	bl, '4'
sub bl, '0'

div bl;
add al, '0'
mov [dux], al

mov	ecx, msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

mov	ecx, dux
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h


mov	eax, 1
mov	ebx, 0
int	80h