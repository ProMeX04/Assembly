.model small 
.stack 100h
.data
    stringA db 256 dup('$')
    stringB db 256 dup('$')
    strEndl db 13, 10, '$' 
    strFound db 'Found at: $'
    strNotFound db 'Not Found!$'


.code
init:
    mov ax, @data
    mov ds, ax
    xor cx, cx
    ret

getStr:
    mov ah, 10
    int 21h
    ret

printStr:
    mov ah, 9
    int 21h
    ret

findStr:
    mov cl, [stringA + 1]
    lea si, stringA + 2
    lea di, stringB + 2
    lea bx, stringB + 2
    add bl, [stringB + 1]

    loopInStr: 
        mov al, [si]
        mov ah, [di]  
          
        inc di
        inc si
        
        cmp ah, al
        je continue

        if_not_equal:
            lea di, stringB + 2
            mov ah, [di]
            cmp ah, al
            jne continue     
            inc di
            
        continue:     
            cmp di, bx 
            je found   
            loop loopInStr   
    notFound:
        lea dx, strNotFound
        call printStr
    ret
    found:
        lea dx, strFound
        call printStr

        mov ah, 2
        lea dx, si
        sub dl, [stringB + 1] 
        add dl, 47
        int 21h
    ret     

main proc
    call init
    lea dx, stringA
    call getStr

    lea dx, strEndl
    call printStr
    lea dx, stringB
    call getStr   

    lea dx, strEndl
    call printStr
    
    call findStr
    int 20h
main endp
end main