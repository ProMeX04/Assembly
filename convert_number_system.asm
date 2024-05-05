;convert dec to bin
.stack 100h
.data
    number dw 65535
    toNumber dw 2  
    
    hello db "Result: $" 
.code
print:   
    xor dx, dx
    pop dx
    mov ah, 2 
    cmp dx, 9
    jle continue
    add dx, 39
    continue:  
        add dx, 48    
    int 21h
    loop print
    int 20h
main proc          
    mov ax, @data
    mov ds, ax
    printResult:
        mov ah, 9
        lea dx, hello
        int 21h
    mov ax, [number]
    xor cx, cx 
        
    convert:
        xor dx, dx
        div [toNumber]
        push dx
        inc cx    
        cmp ax, 0
        jne convert   
    jmp print

main endp
end main 