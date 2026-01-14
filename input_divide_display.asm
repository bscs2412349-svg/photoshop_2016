.model small
.stack 100h
.data
.code

main proc
    
     mov ah,1
     int 21h
     
     mov cl,al
     sub cl,48
          
     mov ah,1
     int 21h
     
     mov bl,al
     sub bl,48
     
     mov al,cl
     
     mov ah,00h
     div bl       
     
     mov cx,00h
     mov cx,ax
             
     mov dl,cl      ;Quotient
     add dl,48
     mov ah,2
     int 21h
                        
     mov dl,ch      ;Remainder
     add dl,48
     mov ah,2
     int 21h
         
     mov ah,4ch
     int 21h
    
    main endp
end main
