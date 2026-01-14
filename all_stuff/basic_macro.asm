;macro with oneparameter only
display macro p1
    mov dx,offset p1
    mov ah,9
    int 21h
endm


;macro with twoparameters
displaytwo macro p1,p2
    mov dx,offset p1
    mov ah,9
    int 21h
    
    call newline
    
    mov dx,offset p2
    mov ah,9
    int 21h
    
endm

;can use macro as a proc with no return amd no parameter
print_5 macro:
   mov dl,'5'
   mov ah,2
   int 21h
    
    endm
.model small
.stack 100h
.data
str1 db 'first variable$'
str2 db 'second variable$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;it will take one argument str1 in display macro
    display str1
    call newline
    display str2
    
    call newline 
    
    ;like calls the print_5 macro with no parameters and only displays what's inside it
    print_5
    
    call newline
 
    ;it will take two arguments str1 and str2 int displaytwo macro
    displaytwo str1,str2
        
    mov ah,4ch
    int 21h
    
    main endp

newline proc
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
     
    ret
    newline endp

end main