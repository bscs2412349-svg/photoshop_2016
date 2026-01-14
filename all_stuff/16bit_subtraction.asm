.model small
.stack 100h
.data
.code
main proc
   mov ax,50
   mov bx,22
   
   sub ax, bx
   
   AAM
   
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
