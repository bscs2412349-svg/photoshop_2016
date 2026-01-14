include 'emu8086.inc'
.model small
.stack 100h
.data
array db 1,5,9,7,3,2
len equ 6
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov cx,len
    mov si,offset array 
    add si, len-1   
    print 'enter elements: '
    input:
    mov dl,[si]
    add dl,48
    mov ah,2
    int 21h 
    dec si
    loop input
    
    mov ah,4ch
    int 21h
    
    

   main endp
end main



