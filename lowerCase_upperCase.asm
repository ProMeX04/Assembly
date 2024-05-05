.data
    inStr db 100 dup('$')
.code   
endl:
    mov ah, 2
    mov dx, 13
    int 21h
    
    mov dx, 10
    int 21h  
    ret

to_lower:    
    lea si, inStr + 2 
    mov cl, [inStr + 1]
    loop_print:
        mov dl, [si]
        cmp dl, 'A'
        jl print
        cmp dl, 'Z'
        jg print
        add dl, 32       
        print:
            mov ah, 2
            int 21h
        inc si
        loop loop_print
    ret
        
to_upper:
    lea si, inStr + 2
    mov cl, [inStr + 1]
    loop_print1:
        mov dl, [si]
        cmp dl, 'a'
        jl print1
        cmp dl, 'z'
        jg print1
        sub dl, 32
        print1:
            mov ah, 2
            int 21h
        inc si
        loop loop_print1
    ret
main proc
    mov ax, @data
    mov ds, ax
    
getInput:        
    lea dx, inStr
    mov ah, 10
    int 21h     
callprint:
    call endl
    call to_lower
    call endl
    call to_upper
      
main endp
end main