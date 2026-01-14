.model small
.stack 100h
.data
.code
main proc
   mov bl,65
   mov cx,26
   
   capital:
        mov dl,bl
        mov ah,2
        int 21h
        
        inc bx
        
   loop capital
   
   
   mov ah,4ch
   int 21h
   
main endp
end main
