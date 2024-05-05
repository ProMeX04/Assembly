.data
    list dw 5,6,7,8,9,1,2,3,4,5,6
    len dw ($ - list) / 2

.code
printMax:
    mov ah, 2 
    mov dx, bx
    add dx, 48
    int 21h
    ret
main proc
    mov ax, @data
    mov ds, ax

    lea si, list
    mov bx, 0
    mov cx, len  
    
    for:
        mov ax, [si]
        cmp ax, bx
        jl continue
        mov bx, ax
        continue:
            add si, 2
            loop for
    call printMax     

main endp
end main




