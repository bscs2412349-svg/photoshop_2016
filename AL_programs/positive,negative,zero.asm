.model small
.stack 100h
.data
msg1 db 10,13, "Enter Number: $"
msg2 db 10,13, "Number is positive $"
msg3 db 10,13, "Number is Negative $"
msg4 db 10,13, "Number is zero$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    mov dx,offset msg1
    int 21h
    
    mov ah,1
    int 21h 
    mov bl,al
    
    mov cl,30h
    
    cmp bl,cl
    
    jg positive
    jl negative
    je zero
    
    
    zero:
    mov ah,9
    mov dx,offset msg4
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    positive:
    mov ah,9
    mov dx,offset msg2
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    negative:
    mov ah,9
    mov dx,offset msg3
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    
    main endp
end main


