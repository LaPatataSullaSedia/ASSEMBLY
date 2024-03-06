
section .data
msg db "suttrazione: " 
io db "programma di Simone Marro----> "
len equ $ - msg  
lun equ $ - io

section .bss
dux resb 1

section .text
global _start

_start:
mov	eax, '5'
sub	eax, '0'
mov	ebx, '4'
sub	ebx, '0'

sub	eax, ebx
add	eax, '0'
mov	[dux], eax

mov	ecx, msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

mov	ecx, dux
mov	edx, 1
mov	ebx, 1
mov	eax, 2
int	80h

mov esi, io
mov	edx, lun
mov	ebx, 1
mov	eax, 4
int	80h


mov	eax, 1
mov	ebx, 0
int	80h