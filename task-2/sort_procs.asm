%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    dec eax
    
start_program:
    
    xor esi, esi

verificare_ordine:

    mov ebx, proc_size
    imul ebx, esi

    ;; accesez primul element din structura 
    lea ecx, [edx+ebx]
    ;; accesez al doilea element din structura
    lea ebx, [ecx+proc_size]

    ;; pun pe stiva ecx si ebx
    push ecx
    push ebx

    ;; copiez valoarea de la adresa structurii prio a elemntului curent 
    ;; copiez si valoarea de la elementul urmator
    ;; daca e la fel fac comparatie pentru time
    mov cl, [ecx + proc.prio]
    mov bl, [ebx + proc.prio]
    cmp cl, bl
    ;; daca sunt descrecator fac sortare
    jg sortare_struct
    jl urmatoarea_iteratie
    
    ;; iau din stiva prima valoare si o pun in ebx
    ;; iau din stiva a 2 a valoare si o pun in ecx
    ;; compar si vad daca prima e mai mare decat a 2 a fac sortare
    ;; daca sunt egale merg mai departe
    ;; daca nu merg la urmatoarea iteratie 
    mov ebx, [esp]
    mov ecx, [esp + 4]
    mov cx, [ecx + proc.time]
    mov bx, [ebx + proc.time]
    cmp cx, bx
    jg sortare_struct
    jl urmatoarea_iteratie

    ;; punem in ebx primu element din stiva si in ecx al 2 lea
    mov ebx, [esp]
    mov ecx, [esp+4]
    ;; extrag valoarea pidului si apoi compar 
    ;; daca este la fel atunci merg mai departe daca este mai mare
    ;; fac sortarea
    mov cx, [ecx + proc.pid]
    mov bx, [ebx + proc.pid]
    cmp cx, bx
    jg sortare_struct
    jl urmatoarea_iteratie

sortare_struct:

    ;; pun pe stiva registrul eax deoarece am nevoie de el 
    push eax
    ;; fac sortarea dupa pid adica interschimb 
    ;; extrag din stiva al 2 lea si al treilea element
    ;; pun in ax valoarea pidului si fac interschimbarea 
    mov ebx, [esp+4]
    mov ecx, [esp+8]
    mov ax, [ecx + proc.pid]
    push eax 
    mov ax, [ebx+proc.pid]
    mov [ecx+proc.pid], ax
    pop eax
    mov [ebx+proc.pid], ax
        

    ;; fac swap ul dupa prioritate
    ;; folosind registrul al deoarece este un char
    mov al, [ecx + proc.prio]
    push eax 
    mov al, [ebx+proc.prio]
    mov [ecx+proc.prio], al
    pop eax
    mov [ebx+proc.prio], al

    ;; fac swapul dupa time care este de tip short si folosesc
    ;; registrul ax 
    ;; extrag valoarea de la adresa ecx + proc.time sau ebx + proc.time
    ;; care ne da fix valoarea time ului si apoi fac swapul
    mov ax, [ecx + proc.time]
    push eax 
    mov ax, [ebx+proc.time]
    mov [ecx+proc.time], ax
    pop eax
    mov [ebx+proc.time], ax


    pop eax

urmatoarea_iteratie:

    ;;incrementez valoarea 
    inc esi
    ;; scot ebx si ecx din stiva pentru a ma ajuta la urmatoarea iteratie
    pop ebx
    pop ecx
    ;; verific daca nu am ajuns la limita elementelor
    cmp esi, eax
    jl verificare_ordine

    ;; daca s a ajuns la 0 ies din program
    dec eax
    jnz start_program

    

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY