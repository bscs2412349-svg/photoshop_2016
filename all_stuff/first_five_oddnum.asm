.model small
.stack 100h
.data
.code
main proc
      mov bl,49
      mov cx,5
      odd:
      mov dl,bl
      mov ah,2
      int 21h
      
      add bl,2
      
      loop odd
      
 main endp
end main
