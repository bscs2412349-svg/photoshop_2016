.model small
.stack 100h
.data

quotient db ?
remainder  db ?

.code
main proc 
    
    mov ax,25
    mov bl,5
    
    div bl
    
    mov quotient,al
    mov remainder ,ah
    
    mov dl,quotient
    add dl,48
    mov ah,2
    int 21h 
    
    mov dl,'.'
    mov ah,2
    int 21h
            
    mov dl,remainder 
    add dl,48
    mov ah,2
    int 21h 
    
    mov ah, 4ch
    int 21h 
    
    main endp
end main