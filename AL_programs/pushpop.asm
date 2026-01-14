.model small
.stack 100h
.data
.code
main proc
    mov ax,8
    mov bx,1
    mov cx,5
    
    push ax
    push bx
    push cx
    
    pop ax
    mov dx,ax
    add dx,48
    mov ah,2
    int 21h   
    
     pop bx
    mov ax,bx
    mov dx,ax
    add dx,48
    mov ah,2
    int 21h
     
     pop cx  
     mov ax,cx
    mov dx,ax
    add dx,48
    mov ah,2
    int 21h
    
    main endp
end main



