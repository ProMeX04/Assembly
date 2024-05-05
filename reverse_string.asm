
.data
    str db 255 dup('$')
.code


getStr:
    lea dx, str
    mov ah, 10
    int 21h
    ret

print_Str:   
    xor cx, cx
    mov cl, [str + 1]
    lea si, str + 2      
    mov ah, 2
    print:
         mov dl, [si] 
         inc si
         int 21h
         loop print 
    ret
reverseStr:
    xor cx, cx
    mov cl, [str + 1]  
    lea si, str + 1
    add si, cx  
    printRe:
        mov dl, [si]
        int 21h
        dec si
        loop printRe
    ret          

endl:
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret         
    
main proc 
    mov ax, @data
    mov es, ax
    
    call getStr    
    call endl
    call print_Str
    call endl
    call reverseStr  
    int 20h
    
main endp      
    
end main 