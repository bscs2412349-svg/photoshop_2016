.model small
.stack 100h
.data
.code
main proc
    mov bl,56
    mov cx,5
    inner:
    mov dl,bl
    mov ah,2
    int 21h
    sub bl,2
    
    
    loop inner
    mov ah,4ch
    int 21h
main endp
end main