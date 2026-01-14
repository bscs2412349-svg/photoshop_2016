.model small
.stack 100h
.data
.code
main proc
      mov ax,1       
      mov bx,8  ; bx stored 8 
      mov cx,3
      mov dx,5
      push ax    ;(top) 8 >> 1 (bottom)
      push bx
      push cx
      push dx
      
      pop ax      ; it will pop 8
      add ax,48
      mov dx,ax
      mov ah,2
      int 21h
      
      
      ; it will pop 1
      pop bx 
      mov ax,bx
      add ax,48
      mov dx,ax
      mov ah,2
      int 21h 
      
      pop cx
      mov ax,cx
      add ax,48
      mov dx,ax
      mov ah,2
      int 21h
      
      
      pop dx
      mov ax,dx
      add ax,48
      mov dx,ax
      mov ah,2
      int 21h
      
      
      
      
      
      mov ah,4ch
      int 21h
   main endp
   end main
   