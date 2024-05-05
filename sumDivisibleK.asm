.stack 100h
.data
    array db 1,2,3,4,5,6,7,8,9,10,11,24,24,123
    end_array db 0
    result db 0
    divisor db 3
    tach db 10

    
.code            
add_number:
    add [result], al
    ret 
    
print_result:
    mov al, [result]
    mov cx, 0
    divide:       
        inc cx              
        mov ah, 0
        div [tach]  
        mov dl, ah
        add dl, 48
        push dx
        cmp al, 0
        jne divide  
       
    print:
        pop dx
        mov ah, 2
        int 21h
        loop print
    ret
    
main proc
    mov ax, @data
    mov ds, ax
    lea si, array
    mov cx, (end_array - array)
    browse:
        mov ah, 0
        mov al, [si]
        div [divisor] 
        cmp ah, 0
        jne continue 
        mul [divisor]
        call add_number
        continue:
            inc si
            loop browse
    call print_result
    int 20h
main endp
end main 
