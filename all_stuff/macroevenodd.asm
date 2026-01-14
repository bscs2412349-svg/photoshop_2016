checking macro p1
    mov al,p1
    mov ah,0
    mov bl,2
    div bl
    cmp ah,0
    
    je even
    
    jne odd
    endm
.model small
.stack 100h
.data
input db 'Input number: $'
str1 db 'Even number! $'
str2 db 'Odd number! $'
num db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,offset input
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov num,al
    
    call newline
    
    checking num
    
even:
    mov dx,offset str1
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h    
    
odd:
    mov dx,offset str2
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