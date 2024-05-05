.model small
.stack 100h
.data
    char db ?
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1h
    int 21h
    mov char, al
    
    mov ah, 2h
    mov dl, 10
    int 21h 
    
    mov ah, 2h
    mov dl, 13
    int 21h
    
    mov ah, 2h
    mov dl, char
    int 21h
   
    mov ah, 4Ch
    int 21h
    
main endp
end