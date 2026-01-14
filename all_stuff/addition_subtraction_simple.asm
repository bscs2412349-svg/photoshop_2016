.model small
.stack 100h
.data 
value1 db ?
value2 db ?
value3 db ?
value4 db ?  
result1 db ?
result2 db ?
input1 db "value 01: $"
input2 db 10, 13,"value 02: $"
input3 db 10, 13,"value 03: $"
input4 db 10, 13,"value 04: $" 
 
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,offset input1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov value1,al
  
    
    mov dx,offset input2
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov value2,al 
    
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    mov dl,"("
    mov ah,2
    int 21h
    mov dl,value1
    add dl,48
    mov ah,2
    int 21h
    mov dl,"+"
    mov ah,2
    int 21h
    mov dl,value2 
    add dl,48
    mov ah,2
    int 21h
    mov dl,")"
    mov ah,2
    int 21h
    mov dl,"="
    mov ah,2
    int 21h
    
    mov al,value1
    add al,value2
    mov result1,al
    mov dl,result1
    add dl,48
    mov  ah,2
    int 21h
    
    
    mov dx,offset input3
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov value3,al
  
    
    mov dx,offset input4
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov value4,al
    
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    mov dl,"("
    mov ah,2
    int 21h
    mov dl,value3
    add dl,48
    mov ah,2
    int 21h
    mov dl,"*"
    mov ah,2
    int 21h
    mov dl,value4
    add dl,48
    mov ah,2
    int 21h
    mov dl,")"
    mov ah,2
    int 21h
    mov dl,"="
    mov ah,2
    int 21h
    
    mov al,value3
    mul value4
    mov result2,al
    mov dl,result2
    add dl,48
    mov  ah,2
    int 21h
    
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    
    mov dl,"("
    mov ah,2
    int 21h
    mov dl,value1
    add dl,48
    mov ah,2
    int 21h
    mov dl,"+"
    mov ah,2
    int 21h
    mov dl,value2 
    add dl,48
    mov ah,2
    int 21h
    mov dl,")"
    mov ah,2
    int 21h
    
    mov dl,"-"
    mov ah,2
    int 21h
    
    mov dl,"("
    mov ah,2
    int 21h
    mov dl,value3
    add dl,48
    mov ah,2
    int 21h
    mov dl,"*"
    mov ah,2
    int 21h
    mov dl,value4
    add dl,48
    mov ah,2
    int 21h
    mov dl,")"
    mov ah,2
    int 21h
    mov dl,"="
    mov ah,2
    int 21h  
    
    
    
    
    mov bl,result1
    mov cl,result2
    sub bl,cl
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    
    
    
    mov ah,4ch
    int 21h
           
    main endp

end main