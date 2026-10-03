.data
    salas:           .word 4            # Número de salas
    asientos:        .word 50           # Asientos por sala
    vendidos:        .word 175          # Boletos vendidos
    capacidad_total: .word 0            # Capacidad total calculada (4 * 50 = 200)
    disponibles:     .word 0            # Asientos disponibles (200 - 175 = 25)
    es_diferente:    .word 0            # Bandera: 1 si vendidos != capacidad_total
    
    # Cadenas de texto para la salida por pantalla (syscalls)
    msg_lleno:       .asciiz "Cine lleno\n"
    msg_disp:        .asciiz "Asientos disponibles: "

.text
.globl main

main:
    # 1. Cargar datos desde la memoria
    lw $t0, salas                 # $t0 = 4
    lw $t1, asientos              # $t1 = 50
    lw $t2, vendidos              # $t2 = 175

    # 2. Operaciones aritméticas y de comparación
    mul $t3, $t0, $t1             # $t3 = capacidad_total = 4 * 50 = 200
    sub $t4, $t3, $t2             # $t4 = disponibles = 200 - 175 = 25
    sne $t5, $t2, $t3             # $t5 = (175 != 200) ? 1 : 0

    # 3. Guardar resultados calculados en memoria
    sw $t3, capacidad_total       # Guardar 200 en memoria
    sw $t4, disponibles           # Guardar 25 en memoria
    sw $t5, es_diferente          # Guardar 1 en memoria

    # 4. Estructura condicional y salida por pantalla
    beq $t2, $t3, cine_lleno      # Si vendidos = capacidad_total ($t2 = $t3), ir a cine_lleno

    # Caso contrario: Hay asientos disponibles
    li $v0, 4                     # Syscall 4: Imprimir cadena de texto
    la $a0, msg_disp              # Cargar dirección de "Asientos disponibles: "
    syscall

    li $v0, 1                     # Syscall 1: Imprimir entero
    move $a0, $t4                 # Cargar el valor de asientos disponibles ($t4 = 25)
    syscall

    j fin                         # Salta al final para evitar ejecutar 'cine_lleno'

cine_lleno:
    li $v0, 4                     # Syscall 4: Imprimir cadena de texto
    la $a0, msg_lleno             # Cargar dirección de "Cine lleno\n"
    syscall

fin:
    li $v0, 10                    # Syscall 10: Finalizar el programa limpiamente
    syscall
