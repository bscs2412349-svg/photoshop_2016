.model small
.stack 100h
.data
msg1 db 'Enter a statement: $'
msg2 db 'Total Vowels: $'
msg3 db 'Total Consonants: $'  
msg4 db 'Press Y to run again or ESC key to terminate: $'
vowels db '0'
consonants db '0'
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    input: 
    lea dx,msg1 
    call display
    
    characterCheck:
    mov ah,1
    int 21h 
    cmp al,13
    je displayCount 
    cmp al,32
    je characterCheck
    cmp al,'A'
    je vowel
    cmp al,'a' 
    je vowel
    cmp al,'E'
    je vowel
    cmp al,'e'
    je vowel
    cmp al,'I'
    je vowel
    cmp al,'i'
    je vowel
    cmp al,'O'
    je vowel
    cmp al,'o'
    je vowel
    cmp al,'U'
    je vowel
    cmp al,'u'
    je vowel
    jmp consonant
    
    vowel:
    inc vowels
    jmp characterCheck  
    
    consonant:
    inc consonants
    jmp characterCheck 
    
    displayCount: 
    call newline
    lea dx,msg2
    call display

    mov dl,vowels
    mov ah,2
    int 21h

    call newline
    lea dx,msg3
    call display

    mov dl,consonants
    mov ah,2
    int 21h

    mov vowels,'0'
    mov consonants,'0'
    
    runAgain:
    call newline
    lea dx,msg4
    call display
    
    mov ah,1   
    int 21h 
    mov bl,al
    call newline  
    
    cmp bl,'Y'
    je input 
    
    cmp bl,27
    je exit
    
    jmp runAgain
    
    exit:
    mov ah,4ch
    int 21h 
      
    main endp

display proc
    mov ah,9
    int 21h
    ret
    display endp

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