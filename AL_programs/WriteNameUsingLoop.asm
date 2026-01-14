.model small
.stack 100h
.data 
.code
main proc 
     mov cx,5
     label:
       mov ah,8
       int 21h
       
       mov dl,al
       mov ah,2
       int 21h
       
     loop label 
     
    mov ah,4ch
    int 21h
main endp
end main