.model small
.stack 100h
.data 

arr db 20 dup('$')             

.code
main proc
    mov ax,@data
    mov ds,ax  
       
    mov bx, offset arr
    inputLoop:  
    
    mov ah,1
    int 21h 
    
    cmp al,13 
    je exit  
    
    mov [bx],al
    inc bx 
    
    jmp inputLoop
    
    exit:
    mov ah,4ch
    int 21h   
    
    main endp
end main