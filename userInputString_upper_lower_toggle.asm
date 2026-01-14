.model small
.stack 100h
.data
    count  dw ?
    stat   db 'Enter your Statement: $'
    input  db 20 dup (?)                          
    upper  db 10,13, 'Upper Case: $'
    lower  db 10,13, 'Lower Case: $'
    toggle db 10,13, 'Toggle Case: $'
  
.code

main proc
          mov  ax,@data
          mov  ds,ax
          lea  dx,stat         
          mov  ah,9
          int  21h            
          lea  si,input
          mov  count,0  
          
    start:
          mov  ah,1
          int  21h
          cmp  al,13
          je   end1
          mov  [si],al
          inc  si
          inc  count
          jmp  start
    end1: 
            
          lea  dx,upper
          mov  ah,9
          int  21h
          lea  si,input        
          mov  cx,count
    L1:   
          mov  dl,[si]
          and  dl,11011111b
          mov  ah,2
          int  21h
          inc  si
          loop L1
            
          lea  dx,lower
          mov  ah,9
          int  21h
          lea  si,input       
          mov  cx,count
    L2:   
          mov  dl,[si]
          or  dl,00100000b
          mov  ah,2
          int  21h
          inc  si
          loop L2
         
          lea  dx,toggle
          mov  ah,9
          int  21h
          lea  si,input        ;mov si,offset input
          mov  cx,count
    L3:   
          mov  dl,[si]
          xor  dl,0100000b
          mov  ah,2
          int  21h
          inc  si
          loop L3
            
            
          mov  ah,4ch
          int  21h
    
main endp

end main      