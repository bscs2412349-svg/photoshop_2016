include 'emu8086.inc'
.model small
.stack 100h
.data
array db 5 ?
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov cx,5
    mov si,offset array    
    print 'enter elements: '
    input:
    mov ah,1
    int 21h
    mov [si],al
    inc si
    loop input
    
    
    mov si,offset array
    mov cx,5
    mov dl,10  
    mov ah,2
    int 21h  
    mov dl,13
    mov ah,2
    int 21h
    
    print 'print array: '
    output:
    mov dl,[si]
    
    mov ah,2
    int 21h
    inc si
    loop output
    
    mov ah,4ch
    int 21h
    
    
    

   main endp
end main



