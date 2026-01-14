.model small
.stack 100h
.data

msg db "Enter a digit: $" 
count db 01
num db ?

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov cx,10
    
    lea si,msg 
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h        
    sub al,48
    
    mov num, al
    call newline
    call newline
    loop1:
    
    mov al,num
    
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,'*'
    mov ah,2
    int 21h
    
    mov al,count
    
    aam
    mov bl,al
    mov bh,ah
    
    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,'='
    mov ah,2
    int 21h
    
    mov al,num
    
    mul count
    
    aam
    
    mov bl, al
    mov bh, ah
    
    mov dl, bh
    add dl,48
    mov ah,2
    int 21h
    
    mov dl, bl
    add dl,48
    mov ah,2
    int 21h
    
    call newline
       
    inc count
 
    loop loop1  
        
    mov ah,4ch
    int 21h

    main endp

newline proc
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    ret
       newline endp

end main