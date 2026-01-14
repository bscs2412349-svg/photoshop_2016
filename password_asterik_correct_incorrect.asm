.model small
.stack 100h
.data  

msg1 db "Enter password: $" 
msg2 db "Correct Password$"
msg3 db "Incorrect Password$" 
inputpassword db 20 dup('$')
password db 'admin$' 
count dw 0    
     
.code
main proc
    
    mov ax,@data
    mov ds,ax    
    
    lea dx, msg1
    call print
    
    lea si,password

lengthCounter: 
    mov al, [si]
    cmp al,'$'
    je L1 
    inc si
    inc count
    jmp lengthCounter 

L1:    
    mov di, offset inputpassword
    
input:
    mov ah,7
    int 21h 
    
    cmp al,13
    je check 

    mov [di], al
    inc di
    call star
    jmp input
    
    call newline
    
check:       
    mov cx,count 
    mov si, offset password
    mov di, offset inputpassword 
    
compare: 
    mov al,[si]
    mov bl,[di]
    cmp al,bl
    jne incorrect
    inc si
    inc di
    loop compare
    jmp correct
    
incorrect:
    call newline
    lea dx, msg3
    call print
    jmp exit
      
correct:
    call newline
    lea dx, msg2
    call print 
    jmp exit
    
exit:
    mov ah,4ch
    int 21h
    
    main endp 

star proc
    mov dl,'*'
    mov ah,2
    int 21h
    ret
    star endp 

newline proc
    mov dl,10
    mov ah,2
    int 21h

    mov dl,13
    mov ah,2
    int 21h
    ret 
    newline endp 

print proc
    mov ah,9
    int 21h
    ret
    print endp
    
end main