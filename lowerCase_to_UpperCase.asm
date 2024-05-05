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

    mov dl, 13
    int 21h

    mov dl, char
    sub dl, 32
    int 21h

    mov ah, 4ch
    int 21h
main endp
end

