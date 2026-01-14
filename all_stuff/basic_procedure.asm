.model small
.stack 100h
.data
str1 db 'Hello$'
str2 db 'My name is Awais$'
str3 db 'I am in CS$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;first string
    mov dx,offset str1
    mov ah,9
    int 21h
    
    ;calling newline procedure
    call newline
    
    ;second string
    mov dx,offset str2
    mov ah,9
    int 21h
    
    call newline
    
    ;third string
    mov dx,offset str3
    mov ah,9
    int 21h
    
    
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

