.data
# Datos de entrada almacenados en memoria
salas: .word 4 # Cantidad de salas de cine
asientos: .word 50 # Asientos por sala
vendidos: .word 175 # Boletos vendidos
# Variables para almacenar los resultados
capacidad_total: .word 0 # Capacidad total calculada (4 * 50 = 200)
disponibles: .word 0 # Asientos disponibles (200 - 175 = 25)
es_diferente: .word 0 # Bandera: 1 si vendidos != capacidad_total
.text
.globl main
main:
# 1. Cargar datos desde la memoria a registros temporales
lw $t0, salas # $t0 = 4
lw $t1, asientos # $t1 = 50
lw $t2, vendidos # $t2 = 175
# 2. Realizar las operaciones correspondientes
# Capacidad total = salas * asientos
mul $t3, $t0, $t1 # $t3 = 4 * 50 = 200
# Asientos disponibles = capacidad_total - vendidos
sub $t4, $t3, $t2 # $t4 = 200 - 175 = 25
# Comprobar si los vendidos son diferentes a la capacidad total
sne $t5, $t2, $t3 # $t5 = (175 != 200) ? 1 : 0
# 3. Guardar resultados en memoria
sw $t3, capacidad_total # Memoria[capacidad_total] = 200
sw $t4, disponibles # Memoria[disponibles] = 25
sw $t5, es_diferente # Memoria[es_diferente] = 1
# Finalización del programa
li $v0, 0
jr $ra
