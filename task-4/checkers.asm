
section .data

section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    mov esi, eax
    ;; inmultesc linia cu 8 si apoi adun coloana pentru a mi da pozitia
    imul esi,8
    mov edi,ebx
    add edi,esi
    ;; folosesc lea pentru a afla adresa 
    lea edx, [ecx + edi]

    ;; verific daca elementul este ultima linie sau pe prima coloana
    ;; in caz ca este pe una din cele 2 nu pot avea element pe coltul
    ;; din stanga sus
    ;; daca se afla pe ultima linie merg mai departe catre coltu din stanga jos
    cmp eax, 7
    je compar_jos_stanga
    ;; daca se afla pe prima coloana fac la fel
    ;; daca nu inseamna ca pot sa adaug element pe diagonala din stanga sus
    cmp ebx, 0
    jz compar_jos_stanga
    jnz adaugare_stanga_sus

adaugare_stanga_sus:

    ;; aduc edx pe valoarea pe care vreau sa inserez elementul 1
    add edx, 7
    mov [edx], byte 1
    ;; aduc edx pe valoarea initiala pentru a putea merge mai departe
    sub edx, 7
    ;; merg mai departe catre urmatoarea verificare
    jmp compar_jos_stanga

compar_jos_stanga:

    ;; daca se afla pe prima linie nu pot insera pe diagonala din stanga jos
    cmp eax, 0
    jz compar_dreapta_jos
    ;; la fel si aici daca e pe prima coloana nu pot
    cmp ebx, 0
    ;; daca sunt false conditiile anterioare inseamna ca pot pune element
    jz compar_dreapta_jos
    jnz adaugare_stanga_jos

adaugare_stanga_jos:
    
    ;; aduc elementul pe pozitia pe care vreau sa inserez 
    ;; adica scad 8 pozitii sa fie cel de sub egal si inca una sa fie diagonal
    sub edx, 9
    mov [edx], byte 1
    ;; il aduc la pozitia initiala
    add edx, 9
    ;; merg cu urmatoarea verificare
    jmp compar_dreapta_jos

compar_dreapta_jos:

    ;; daca este pe prima linie si ultima coloana nu pot sa inserez 
    ;; pe coltu din dreapta jos diagonal 
    cmp eax, 0
    jz compar_dreapta_sus
    cmp ebx, 7 
    jz compar_dreapta_sus
    ;; daca nu se afla pe prima linie
    ;; sau ultima coloana inserez diagonal dreapta jos
    jnz adaugare_dreapta_jos

adaugare_dreapta_jos:

    ;; scad 7 pozitii pentru a ajunge pe pozitia unde vreau sa inserez
    sub edx, 7
    mov [edx], byte 1
    add edx, 7
    ;; merg la urmatoarea verificare
    jmp compar_dreapta_sus

compar_dreapta_sus:

    ;; daca nu este ultima coloana si nici pe ultima linie il adaug elemntul
    ;; diagonal dreapta sus
    cmp eax, 7
    jz compar_stanga_sus
    cmp ebx, 7
    jz compar_stanga_sus
    jnz adaugare_dreapta_sus

adaugare_dreapta_sus:

    ;; adun 9 pozitii pentru a l aduce la pozitia de inserat 
    ;; apoi scad acele 9 pozitii pentru a reveni la cea initiala dupa inserare
    add edx, 9
    mov [edx], byte 1
    sub edx, 9
    jmp compar_stanga_sus

;; compararea am facut o la inceput deci acum iesim din program
compar_stanga_sus:

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY