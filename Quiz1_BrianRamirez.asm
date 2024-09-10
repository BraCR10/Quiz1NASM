;   Programa que pasa una secuencia de bits a base 10   Quiz1_BrianRamirez.ASM
;   Objetive: Aprender a usar comandos de assembly y aprender a usar 
;   el macro io.mac
;   inputs: Secuencia de unos y ceros(Menor a 32 digitos)
;   outputs: Numero decimal
%include "io.mac"

.DATA
welcome_msg db 'Bienvenido a el covertidor de base 2 a base 10',0
instruction_msg    db  'Ingrese la secuencia binaria: ',0
result_msg   db  'El numero decinal de la secuencia binaria es: ',0
nonbynary_error_msg   db  'El numero binario no es valido',0
error_buffer_msg   db  'Error de buffer: El numero binario es demaciado largo(Mayor a 8bytes)',0
author_info_msg   db  'Estudiante: Brian Ramirez Arias Carnet: 2024109557 ',0

.UDATA
;El programa esta echo para almacenar hasta una cantidad de 32bits
bynarySecuence resb  4; buffer de 4bytes = 32bits

.CODE
    .STARTUP
    PutStr welcome_msg
    nwln
    PutStr instruction_msg
    GetStr bynarySecuence,4
    mov edx,bynarySecuence  ;Almacena el dato en el registro edx
   
checkSecuence:

    
    .EXIT


