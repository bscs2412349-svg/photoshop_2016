.model small
.stack 100h
.data 
enter db 10,13, "Enter number: $"
evennum db 10,13,"Even number!!$"
oddnum db 10,13,"Odd number!!$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    mov dx,offset enter
    int 21h
     
    mov ah,1
    int 21h
    
    mov bl,2
    div bl
    cmp ah,0
    
  je even
  jne odd  
    
    even:
       mov ah,9
       mov dx,offset evennum
       int 21h
       
       mov ah,4ch
       int 21h
    odd:
    mov ah,9
    mov dx,offset oddnum
    int 21h
    mov ah,4ch
    int 21h
      
    main endp
end main