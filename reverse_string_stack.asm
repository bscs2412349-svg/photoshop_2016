.model small
.stack 100h
.data
   
   msg db 'Hello World'
   
.code 
main proc
 
    mov ax,@data
    mov ds,ax
    
    lea si,msg
    
    mov cx,11
    pushLoop:
    
    mov bx,[si]
    push bx
    inc si
    
    loop pushLoop
    
    mov cx,11
    popLoop:
    
    pop dx
    mov ah,2
    int 21h  
    
    loop popLoop
    
    mov ah, 4ch
    int 21h
                     
    main endp
end main                                                               