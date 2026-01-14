.model small
.stack 100h
.data 
message db "Hello World$"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset message   ; SI starts at message with index zero
    mov cx, 0                ; CX is zero to count length of the message

count_loop:
    mov al, [si]             ; get one character (si->0 ->H)
    cmp al, '!'              ; check end of string (using cmp to compare al to $. when al=$ so it jumps to length found found and the counting stops
    je length_found          ; if '$' ? stop counting
    inc cx                   ; increment counter . the cx increases at every iteration
    inc si                   ; go to next character . jumps to the count loop again like never ending loop. with the while conditon of al=$ 
    jmp count_loop
     
     
    ;cx counts from 0 to 11 and cx becomes 12
length_found:
    ;so now the cx will be 12
    
    ;printing length to verify
    add cx, 48               ; convert digit to ASCII (works for 0-9)
    mov dl, cl               ; for 16 bit 
    mov ah, 2                ;prints < as it is 12 in asc code and length is 12
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main
