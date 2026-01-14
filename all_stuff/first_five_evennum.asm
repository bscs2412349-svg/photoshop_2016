.model small
.stack 100h
.data
.code
main proc
   mov bl,48
   mov cx,5
   
   capital:
        mov dl,bl
        mov ah,2
        int 21h
        
        add bl,2
        
   loop capital
   
   
   mov ah,4ch
   int 21h
   
main endp
end main
