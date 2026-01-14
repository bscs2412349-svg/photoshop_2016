.model small
.stack 100h
.data 
num1 db ?
num2 db ?     
new_line db 0Dh,0Ah,'$' 
tab db 09h,'$'
input1 db "Input1: $"
input2 db "Input2: $"
operation db "Input the function to operate (+ - / *): $" 
add_message db "Addition: $"
sub_message db "Subtraction: $"
mul_message db "Multiplication: $"
div_message db "Division: $"
.code        add
main proc
     mov ax,@data
     mov ds,ax
     
    mov ah,9
    mov dx,offset input1   
    int 21h 
    
    mov ah,1    ;input 1 digit 3, 51
    int 21h     ; store al
    sub al,48   ; 48 subtracted from al
    mov num1,al
    
    mov ah,9
    mov dx, offset new_line
    int 21h
    
    mov ah,9
    mov dx,offset input2   
    int 21h 
    
    mov ah,1
    int 21h
    sub al,48
    mov num2,al
    
    mov ah,9
    mov dx, offset new_line
    int 21h
    
    mov ah,9
    mov dx, offset operation
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    
    cmp bl,'+'
    je addition
    
    cmp bl,'-'
    je subtraction
    
    cmp bl,'*'
    je multiplication
    
    cmp bl,'/'
    je division 
     
    
    
    mov ah,4ch
    int 21h
     
     
main endp
addition proc
    mov ah,9
    mov dx, offset new_line
    int 21h
    
    mov ah,9
    mov dx,offset add_message
    int 21h
    
    mov al,num1
    add al,num2
    mov dl,al
    add dl,48   ;moved from al to dl
    mov ah,2    ;48 add dl 
    int 21h      ; ah,2 read the value in dl,dx,dh then prints that 
    
    mov ah,4ch
    int 21h
    
    addition endp
subtraction proc
    mov ah,9
    mov dx, offset new_line
    int 21h
    
    mov ah,9
    mov dx,offset sub_message
    int 21h
    
    mov al,num1
    mov bl,num2
    sub al,bl  ;subtract bl from al , the result is stored in al
    mov dl,al  ; move al to dl
    add dl,48
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    subtraction endp
multiplication proc
    mov ah,9
    mov dx, offset new_line
    int 21h
    
    mov ah,9
    mov dx,offset mul_message
    int 21h
    
    mov al,num1  ; al = 2
    mov bl,num2   ; bl =3
    mul bl     ; al = al * bl  ; mul al (wrong)  ;mul bl = (al = al * bl)= 2 * 3 = 6 by default stored in al 
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    multiplication endp 
division proc
    mov ah,9
    mov dx, offset new_line
    int 21h
    
    mov ah,9
    mov dx,offset div_message
    int 21h
    
    mov al,num1  ; ax value stored num1 ; al = 8
    mov ah,0       ; ah = 0
    mov bl,num2  ; bl = 2
    div bl        ; al = 4
    mov dl,al
    add dl,48
    mov ah,2
    int 21h 
    
    
    mov ah,4ch
    int 21h
    division endp
end main
