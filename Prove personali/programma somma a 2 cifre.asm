section .data
msg db "Progetto di Simone Marro" 
len equ $ - msg  
io db "Somma a 2 cifre: "
lun equ $ - io

n1 dd 9
n2 dd 6

new_line db 0xA
len_nl equ $ - new_line

section .bss
riz resb 40
lun_riz resd 1

section .text
global _start
_start:

mov eax, [n1]
mov ebx, [n2]
add eax, ebx

mov edi, riz             
call faistringa             
sub edi, riz             
mov [lun_riz], edi


mov	ecx, msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, len_nl
int 80h
   
mov ecx, io
mov	edx, lun
mov	ebx, 1
mov	eax, 4
int	80h

mov eax, 4
mov ebx, 1
mov ecx, riz
mov edx, [lun_riz]
int 0x80

mov	eax, 1
mov	ebx, 0
int	80h

faistringa:  
    xor ecx, ecx
    mov ebx, 10
    .LL1:                   
    xor edx, edx            
    div ebx                 
    push dx                 
    inc ecx                 
    test eax, eax           
    jnz .LL1                
    .LL2:                  
    pop dx                  
    or dl, '0'              
    mov [edi], dl          
    inc edi                 
    loop .LL2         

    mov byte [edi], 0       
    ret                     