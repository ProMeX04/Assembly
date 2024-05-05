.model small         
.data
    inputString db 256 dup("$")
    endString db '#' 
    findStr db "ktmt"
    result db '0'       
    msg db 13,10,"Result: $" 
.code   
init:  
    mov ax, @data
    mov ds, ax
    ret
        
findStrX:
    lea bx, result  
    mov cx, si
    lea si, inputString
    lea di, findStr

    loopInStr: 
        mov al, [si]
        mov ah, [di]  
          
        inc di
        inc si
        
        cmp ah, al
        je continue
        not_equal:
            lea di, findStr
            mov ah, [di]
            cmp ah, al
            jne continue     
            inc di
            
        continue:     
            cmp di, bx 
            je found   
            loop loopInStr    
    ret
    found:
       mov [result], '1'
    ret     
          
getStr:  
    lea si, inputString 
    whileGet:  
        mov ah, 1
        int 21h
                
        mov [inputString + si], al
        inc si    
        cmp al, [endString]
        jne whileGet 
    ret      

printResult:   
    mov ah, 9
    lea dx, msg
    int 21h
    mov dl, [result]
    mov ah,2          
    int 21h      
    ret    
    
main proc   
    call init    
    call getStr
    call findStrX 
    call printResult
    int 20h         
    
main endp
end main