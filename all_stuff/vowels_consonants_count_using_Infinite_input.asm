.model small
.stack 100h
.data
vowels db 0
consonants db 0
str1 db 'Enter the word:  $'
str2 db 'Vowel: $'
str3 db 'Consonant: $' 
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    mov dx,offset str1
    mov ah,9
    int 21h
    
    
    starting:
        mov ah,1
        int 21h 
 
        
        cmp al,13
        je print
                               
        cmp al,'a'
        je vowel
        
        cmp al,'e'
        je vowel
        
        cmp al,'i'
        je vowel
        
        cmp al,'o'
        je vowel 
        
        cmp al,'u'
        je vowel
        
        
        jmp consonant
        
        cmp al,32
        je starting
        

        
        
      
vowel:
        inc vowels
        jmp starting     
        
consonant:
        inc consonants
        jmp starting     
        
     
    
        mov ah,4ch
        int 21h
        
        main endp
        

 print proc 
        call newline 
        
        mov dx,offset str2
        mov ah,9
        int 21h
        
        mov dl,vowels
        add dl, 30h
        mov ah,2
        int 21h
        
        call newline
        
        
        mov dx,offset str3
        mov ah,9
        int 21h
        
        mov dl,consonants
        add dl, 30h
        mov ah,2 
        int 21h
        
        mov ah,4ch
        int 21h
         
        print endp
 
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