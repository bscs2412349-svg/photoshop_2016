.model small
.stack 100h
.data
msg1 db "Enter a number (0-9): $"
msg2 db 0Dh,0Ah, "Factorial = $"
result dw 1

.code
main proc
    mov ax, @data
    mov ds, ax

    
    mov dx, offset msg1
    mov ah, 9
    int 21h

   
    mov ah, 1
    int 21h       
    sub al, 30h    
    mov bl, al     

    
    mov ax, 1      

fact_loop:
    cmp bl, 1
    jl done_fact  
    mul bl        
    dec bl
    jmp fact_loop

done_fact:
    mov result, ax 

    
    mov dx, offset msg2
    mov ah, 9
    int 21h

   
    mov ax, result
    call print_num

    mov ah, 4Ch
    int 21h
main endp

print_num proc
    
    mov bx, 10
    mov cx, 0

next_digit:
    xor dx, dx
    div bx       
    push dx       
    inc cx        
    cmp ax, 0
    jne next_digit

print_loop:
    pop dx
    add dl, 30h
    mov ah, 2
    int 21h
    loop print_loop

    ret
print_num endp
end main
