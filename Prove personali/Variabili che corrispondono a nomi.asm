section .data
   msg db "Programma di Simone Marro: ",0xA, 0xA
   len equ $- msg
   msg_stu db "Chi ha più soldi: "
   lun_stu equ $- msg_stu
   msg_matta db "Matta"
   lun_matta equ $- msg_matta
   msg_marro db "Marro"
   lun_marro equ $- msg_marro
   msg_toci db "Toci"
   lun_toci equ $- msg_toci

   sac1 dd '35'  
   sac2 dd '76'  
   sac3 dd '27'    
   
   new_line db 0xA  
   len_nl equ $ - new_line

section .bss
  grande resb 2 
  
section .text
global _start

_start:		
   mov   ecx,msg	
   mov   edx, len
   mov   ebx,1
   mov   eax,4
   int   0x80
   
   mov   ecx,msg_stu	
   mov   edx,lun_stu
   mov   ebx,1
   mov   eax,4
   int   0x80
   
    mov   ecx, [sac1] 
    cmp   ecx, [sac2]
    jg    controllo3
    mov   ecx, [sac2]
    jmp   Jmatta

controllo3:
    cmp   ecx, [sac3]
    jg    Jmarro  
    mov   ecx, [sac3] 
    jmp   Jtoci 

Jmarro:
    
    mov   ecx, msg_marro
    mov   edx, lun_marro
    jmp   _print_message

Jmatta:
   
    mov   ecx, msg_matta
    mov   edx, lun_matta
    jmp   _print_message

Jtoci:
   
    mov   ecx, msg_toci
    mov   edx, lun_toci
    jmp   _print_message

_print_message:
    mov   ebx, 1
    mov   eax, 4
    int   80h 

_exit:
    mov   eax, 1  
    mov   ebx, 0  
   mov   ebx, 0
   int   80h