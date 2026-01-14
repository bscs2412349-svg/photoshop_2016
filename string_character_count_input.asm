.model small
.stack 100h
.data 

msg1 db 'Enter a Statement: $'
msg2 db 10,13,'Total Characters: $' 
total db 0

.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,msg1
    mov ah,9
    int 21h

    counter:
    mov ah,1
    int 21h

    cmp al,13
    je exit

    cmp al,' '
    je counter
    jmp incCount 
    
    incCount:
    inc total
    jmp counter 
    
    exit:
    lea dx,msg2
    mov ah,9
    int 21h  

    mov al,total
    aam
    mov dh,al
    add ah,48
    mov dl,ah
    mov ah,2
    int 21h  
    
    mov al,dh
    add al,48
    mov dl, al
    mov ah,2
    int 21h 
    
    mov ah,4ch
    int 21h

main endp
end main