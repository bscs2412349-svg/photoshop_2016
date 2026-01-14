newline macro:
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h 
    mov dl,0
endm
.stack 100h
.model
.data
input db 'Input the password:- $'  
message1 db 'Correct Password!!$'
message2 db 'Wrong Password!!$'
password db '2412327$'
insertion db 7 dup(?), '$'
uncomplete db 'Not complete password!! Insert again..$'
.code

    main proc
        
    mov ax,@data
    mov ds,ax    
    
    program:
        mov dx,offset input
        mov ah,9
        int 21h
        
        mov si,0
        mov cx,7
        inserting:
           mov ah,8
           int 21h
          
           mov bl,al
           
           cmp bl,13
           je finish
           
           mov dl,'*'
           mov ah,2
           int 21h
           
           
           mov insertion[si],bl
           
           
           
           inc si       
        loop inserting
    
    mov cx,7
    mov si,0
    mov di,0
    
    checking:
        mov bl,0
        mov al,0
        mov bl,password[si]
        mov al,insertion[di]
        
        cmp bl,al
        jne wrong
        
        inc si
        inc di
        
        loop checking
     jmp correct 
    
    correct:
        newline
        mov dx,offset message1
        mov ah,9
        int 21h
        
        mov ah,4ch
        int 21h
        
    wrong:     
        newline
        mov dx,offset message2
        mov ah,9
        int 21h
        
        mov dl,7
        mov ah,2
        int 21h
        
        mov ah,4ch
        int 21h
    
    finish:
       newline

       mov dx,offset uncomplete
       mov ah,9
       int 21h 
       
       mov dl,7
       mov ah,2
       int 21h
       
       newline
       
       jmp program
        
  
    
    mov ah,4ch
    int 21h
    
   
           
    main endp
    
end main
