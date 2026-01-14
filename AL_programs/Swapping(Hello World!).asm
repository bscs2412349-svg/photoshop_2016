.model small
.stack 100h
.data 
message db 'Hello World!$'
.code
main proc  
     mov ax,@data
     mov ds,ax
     
     mov si, offset message      ;When SI first is 0
     
     mov cx, 12                
push:
        ;mov al, [si]             ;SI=0 >> SI has H
        mov bx,[si] 
        push bx                   ;first H is pushed
        inc si                    ;si is incremented
        loop push                 
        
     mov cx, 12               
pop:
        pop bx                   ;pop the last stored in ax
        mov dx,bx                   ;mov al to dl
        mov ah, 2                ;prints
        int 21h                
        loop pop
     
     mov ah,4Ch
     int 21h
main endp
end main
