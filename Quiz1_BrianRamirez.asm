;   Programa que pasa una secuencia de bits a base 10   Quiz1_BrianRamirez.ASM
;   Objetive: Aprender a usar comandos de assembly y aprender a usar 
;   el macro io.mac
;   inputs: Secuencia de unos y ceros(Menor a 80 digitos)
;   outputs: Numero decimal
%include "io.mac"

.DATA
welcome_msg db 'Bienvenido a el covertidor de base 2 a base 10',0
instruction_msg    db  'Ingrese la secuencia binaria: ',0
result_msg   db  'El numero decinal de la secuencia binaria es: ',0
nonbynary_error_msg   db  'El numero binario no es valido',0
error_buffer_msg   db  'Error de buffer: El numero binario es demaciado largo(Mayor a 8bytes)',0
author_info_msg   db  'Estudiante: Brian Ramirez Arias Carnet: 2024109557 ',0

;confirm_msg1 db  'Repetir mensaje: ',0
;confirm_msg2 db   ' veces? (S/N) ',0
;welcome_msg db     'Bienvenido al el lenguaje Ensamblador ',0

.UDATA
;El programa esta echo para almacenar hasta una cantidad de 80bits
bynarySecuence resb  10; buffer de 10bytes = 80bits

.CODE
    .STARTUP
    PutStr welcome_msg
    nwln
    PutStr instruction_msg
    GetStr bynarySecuence,10
checkSecuence:
    
   
    
    .EXIT
;ask_count:
;    PutStr welcome_msg
;    GetInt CX
;    PutStr welcome_msg
;    PutInt CX
;    PutStr welcome_msg
   
;display_msg:
;    PutStr welcome_msg
;    PutStr welcome_msg
;    nwln
;    loop display_msg
;    .EXIT

