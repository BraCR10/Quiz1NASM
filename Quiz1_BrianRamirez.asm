;   Programa que pasa una secuencia de bits a base 10   Quiz1_BrianRamirez.ASM
;   Objetive: Aprender a usar comandos de assembly y aprender a usar 
;   el macro io.mac
;   inputs: Secuencia de unos y ceros(Menor a 16 digitos)
;   outputs: Numero decimal


%include "io.mac"

.DATA
welcome_msg db 'Bienvenido al convertidor de base 2 a base 10',0
instruction_msg db 'Ingrese la secuencia binaria: ',0
result_msg db 'El numero decimal de la secuencia binaria es: ',0
warming_msg db 'ADVERTENCIA: El programa solo convierte hasta 16 bits(32767 base 10)',0
nonbynary_error_msg db 'El numero binario no es valido',0
author_info_msg db 'Estudiante: Brian Ramirez Arias Carnet: 2024109557', 0

.UDATA
bynarySecuence resb 16      ; Buffer para 16 bits 
numDigits resb 1            ; Almacena el número de dígitos
result resd 1               ; Almacena el resultado
currentPower resd 1         ; ALmacena las potencia de 2

.CODE
    .STARTUP
    PutStr welcome_msg
    nwln
    PutStr warming_msg
    nwln
    PutStr instruction_msg
    GetStr bynarySecuence, 16
    mov ESI, bynarySecuence  ; Apunta a la secuencia binaria
    mov EBX, 0               ; Índice para recorrer la secuencia
    mov [result], EBX          ; Inicializa el resultado a 0
    
checkBinary:
    mov AL, [ESI + EBX]      ; Recorre caracter por caracter
    cmp AL, 0                ; Verifica si llegó al final de la cadena
    je continue              ; Si es el final, salta a la conversión
    cmp AL, '1'              ; Verifica si es '1'
    je validCharacter
    cmp AL, '0'              ; Verifica si es '0'
    je validCharacter

    ; Si el carácter no es '1' ni '0', es inválido
    jmp errorNum

validCharacter:
    inc EBX                 
    jmp checkBinary          

errorNum:
    PutStr nonbynary_error_msg
    nwln
    .EXIT                    ; Termina el programa si la entrada no es válida

continue:

    mov [numDigits], EBX   ; EBX tiene el número de dígitos
    mov AX, 0             ; Limpia registro
    
    mov ESI, bynarySecuence
    mov EBX, [numDigits]     
    
    mov CL,1
    mov [currentPower], CL     ; Inicializa la potencia de 2 en 1 
    mov CL,0                   ; Limpia registro

convert:
    dec EBX                  ; Decrementa EBX(Contiene la cantidad de bits)
    mov DL, [ESI + EBX]      ; Recorre bit por bit 
    cmp DL, 0                ; Verifica si se llegó al final de la cadena
    je final

    cmp DL, '1'              
    jne nonAdd              ; Si es '0'

    ; Si es '1'
    mov AX, [currentPower]  ; Carga la potencia actual de 2 en EAX
    add [result], EAX        ; Suma la potencia de 2 al resultado

nonAdd:
    ; Multiplica la potencia actual de 2 por 2 
    mov AX, [currentPower]  ; Carga la potencia de 2 actual en EAX
    mov ECX, 2               ; Carga 2 en ECX
    mul ECX                  ; AX = AX * 2 (Multiplica la potencia por 2)
    mov [currentPower], AX  ; Guarda la nueva potencia de 2

    cmp EBX, 0
    jne convert              ; Si no se ha terminado de recorrer la cadena

final:
    PutStr result_msg
    mov CX, [result]        ; Carga el resultado en EAX
    PutInt CX               ; Imprime el resultado
    nwln
    nwln
    PutStr author_info_msg
    nwln
    .EXIT