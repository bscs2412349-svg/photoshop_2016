.model small
.stack 100h
.data
same db 10,13, "Both arrays are same!! $"
notsame db 10,13, "Both arrays are not same!! $"
array db 10,13, "Array: $" 
arr db 5,7,9,4
arr2 db 5,7,9,4
.code
main proc
     mov ax,@data
     mov ds,ax
     
     mov si,offset arr
     mov di,offset arr2
     mov cx,4 
     
     loop1:
     mov al,[si]
     mov bl,[di]
      
     cmp al,bl
     jne arenotsame
     
     inc si 
     inc di
     loop loop1
     
     jmp aresame
     
    aresame:
       mov ah,9
       mov dx,offset same
       int 21h
      
        mov ah,4ch
        int 21h
        
    arenotsame:
        mov ah,9
        mov dx,offset notsame
        int 21h
        
    main endp 
end main


