%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

start_program:

    ;; verific daca lungimea sirului este 0 
    cmp ecx, 0
    ;; jump direct la finalul programului
    jz  final_program

    ;; extrag primul caracter din sir
    movzx eax, byte [esi]
    ;; adaug caracterului nr cu care se va deplasa 
    add eax, edx
    ;; compar caracterul cu codul ASCII al literelor
    cmp eax, 90
    ;; verific daca a depasit sau nu intervalul
    ;; daca nu o sa il adaug in noul sir
    ;; daca da o voi lua de la capat adica de la A adaugand diferenta depasita
    jle iteratie_urmatoare
    sub eax, 90
    add eax, 65
    dec eax

iteratie_urmatoare:

    ;; adaug in enc_string caracterul
    mov [edi], eax
    ;; incrementez esi pentru a accesa urm caracter
    inc esi
    ;; incrementez contorul pentru a adauga elemente in enc_string
    inc edi
    dec ecx
    ;; fac salt la inceput cat timp mai exista litere
    jnz start_program

final_program:
        
    ;; adaug terminatorul de sir
    mov byte [edi], 0


    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
