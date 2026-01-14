.model small
.stack 100h
.data
.code
main proc
   mov ax,9  ; ax stored 9     
   mov bx,8  ; bx stored 8 
   
   mul bx    ; ax = ax * bx ;  ax = 9*8=72
   
   AAM
   
   mov ch,ah   ; ax (ah,al)  ah = 7 , al = 2
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
