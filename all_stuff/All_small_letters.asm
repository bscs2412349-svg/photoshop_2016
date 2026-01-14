.model small
.stack 100h
.data
.code
main proc
   mov bl,97
   mov cx,26
   
   capital:
        mov dl,bl
        mov ah,2
        int 21h
        
        inc bl
        
   loop capital
   
   
   mov ah,4ch
   int 21h
   
main endp
end main
