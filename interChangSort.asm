;interChangeSort
.data
    array db 7,4,3,4,3,2,4,3,2,9,4,3,2,3
    n dw ($-array)
    nameSort db "interChangeSort: $"
.code
MAIN PROC            
    ; move ds to adress data
    mov ax, @data
    mov ds, ax
    
    ; print name sort
    mov ah, 9h
    lea dx, nameSort
    int 21h
    
    ; init
    lea si, array 
    jmp interChangeSort
MAIN ENDP 
             
             
swap:
    mov [si], bl
    mov [di], al
    mov cx, n
    xchg al, bl
    jmp innerContinue
           
interChangeSort:
    mov al, [si]
    mov di, si
    inc di
    
    inner:
        mov bl, [di]
        cmp al, bl
        jg swap
        
    innerContinue:
        inc di
        cmp cx, di
        jg inner
            
            
    print:
        mov ah, 2h 
        mov dx, [si]
        add dx, 48 
        int 21h   
        mov dx, 32
        int 21h
        
    inc si
    cmp cx, si        
    jg interChangeSort
END MAIN
    
