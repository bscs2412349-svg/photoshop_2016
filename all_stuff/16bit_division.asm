.model small
.stack 100h
.data
.code
main proc
   mov ax,225
   mov bx,5
   
   div bx  ; ax = ax/bx >> ax = 225/5 = 45 = ax  
              ; ah will store the values in tens like 40
              ; al will store the values in ones like 5  
             ; ah = 4 ; al = 5
   AAM       ; tens and ones alag kare tho
   
   mov ch,ah
   mov cl,al
   
   mov dl,ch
   add dl, 48
   mov ah,2
   int 21h
   
   mov dl,cl 
   add dl,48
   mov ah,2
   int 21h
   
   mov ah,4ch
   int 21h
   
main endp
end main
