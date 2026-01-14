newline macro    
    mov dl,13  
    mov ah,2
    int 21h
                      
    mov dl,10  
    mov ah,2
    int 21h      
    newline endm
                                                                                             
print macro str
    lea dx,str
    mov ah,9
    int 21h
    print endm  

.model small
.stack 100h
.data
  msg db 'Press any Key: $'
  upp db 'user pressed Upper Case letter$'
  low db 'user pressed Lower Case letter$'
  num db 'user pressed Number $'
  sym db 'user pressed Symbol $'
  again db 'Press Y to run again or ESC to terminate: $'
.code

main proc

      mov ax,@data
      mov ds,ax

start:
      newline      
      print msg
      
      mov ah,1
      int 21h
      
      cmp al,48
      jb symbol           ;jl=jb-->Jump if less than
      cmp al,57
      jle number          ;jle-->Jump Less than equal to  
      cmp al,65
      jl symbol
      cmp al,91
      jl upper
      cmp al,97
      jl symbol
      cmp al,122
      jle lower
      cmp al, 126
      jle symbol
      
      
lower:
      newline
      print low
      jmp end1  
      
upper:

      newline
      print upp
      jmp end1
      
number:
      newline
      print num
      jmp end1
       
symbol:
      
      newline
      print sym
      jmp end1
      
end1:       
      newline
      print again
      mov ah,1
      int 21h
      
      cmp al,'y'
      je start
      cmp al,'Y'
      je start
      cmp al,27
      je exit
      jmp end1
      
exit:       
      mov ah,4ch
      int 21h
    
main endp
end main      

