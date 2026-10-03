# miniproyecto01
# Sistema de inventario y control de venta de boletos para un cine en MipsyWeb
**Asignatura:** UCOM250 - Organización y Arquitectura de Computadores  
**Integrantes:** Ricardo Perez, Eduardo Nogales  
**Año:** 2026  
**Fecha:** 03/10/2026
## Descripción

### Escenario
El escenario asignado consiste en desarrollar un programa en lenguaje ensamblador MIPS para llevar el control de inventario y venta de boletos de un cine.
El programa debe determinar la capacidad total del cine a partir del número de salas y la cantidad de asientos disponibles por sala. Luego debe calcular cuántos asientos permanecen disponibles después de registrar las ventas realizadas y comprobar si la cantidad de boletos vendidos alcanzó la capacidad máxima del cine.
### Resultado
El programa debe calcular la capacidad total del cine, determinar la cantidad de asientos disponibles y tomar una decisión según el nivel de ocupación.
- Si la cantidad de boletos vendidos es igual a la capacidad total, debe mostrar:
Cine lleno
- Si todavía existen asientos disponibles, debe mostrar el mensaje junto con la cantidad restante. Para los datos utilizados en el proyecto, el resultado esperado es:
Asientos disponibles: 25
## Análisis
### Datos del programa
Los datos principales se almacenan en memoria dentro del segmento `.data`. Además de las entradas iniciales, el programa reserva espacio para almacenar los resultados calculados y los mensajes que se muestran por pantalla.

| Dato | Valor inicial | Propósito |
| salas | 4 | Almacena el número total de salas del cine. |
| asientos | 50 | Almacena la cantidad de asientos por sala. |
| vendidos | 175 | Almacena la cantidad de boletos vendidos. |
| capacidad_total | 0 | Guarda la capacidad máxima calculada del cine: 4 × 50 = 200. |
| disponibles | 0 | Guarda la cantidad de asientos libres: 200 - 175 = 25. |
| es_diferente | 0 | Guarda 1 si la cantidad vendida es diferente de la capacidad total y 0 en caso contrario. |
| msg_lleno | "Cine lleno\n" | Mensaje mostrado cuando el cine alcanza su capacidad máxima. |
| msg_disp | "Asientos disponibles: " | Mensaje mostrado cuando todavía existen asientos libres. |

### Operaciones requeridas

| Datos / Resultados | Propósito | Operación requerida | Instrucción MIPS |
| salas | Cargar el número de salas desde memoria | Carga | lw |
| asientos| Cargar los asientos por sala desde memoria | Carga | lw |
| vendidos | Cargar la cantidad de boletos vendidos | Carga | lw |
| capacidad_total | Calcular 4 × 50 = 200 | Multiplicación | mul |
|disponibles | Calcular 200 - 175 = 25 | Resta | sub |
| es_diferente | Comprobar si vendidos ≠ capacidad total |Comparación de desigualda| sne |
| Resultados calculados | Guardar los valores obtenidos en memoria|Almacenamiento |sw|
| Flujo del programa |Comparar vendidos con capacidad total y decidir qué salida ejecutar |Salto condicional|beq|
| Mensajes y resultado|Mostrar texto y valores en pantalla|Entrada/salida|syscall|
Las instrucciones principales utilizadas por el programa son:
- lw: cargar un dato desde memoria.
- sw: almacenar un resultado en memoria.
- mul: realizar la multiplicación para obtener la capacidad total.
- sub: calcular los asientos disponibles.
- sne: determinar si la cantidad vendida es diferente de la capacidad total.
- beq: dirigir el flujo hacia el caso de cine lleno cuando los valores son iguales.
- li, la y move: preparar valores y direcciones para las llamadas al sistema.
- j: saltar al final del programa después de mostrar el resultado correspondiente.
- syscall: imprimir mensajes, mostrar el número de asientos disponibles y finalizar la ejecución.
## Implementación
El programa se encuentra organizado en una versión base y una versión final, de acuerdo con la estructura solicitada para el repositorio.
### Versión base
La carpeta `version_base/` contiene el código base de referencia de la actividad, conservado para que pueda ejecutarse y compararse con la versión desarrollada por el grupo.
**Archivo:**
### Versión final
**Archivo:**
version_final/programa_final.s
La versión final realiza las siguientes etapas:
1. Carga desde memoria los valores de salas, asientos y vendidos.
2. Calcula la capacidad total del cine mediante mul.
3. Calcula los asientos disponibles mediante sub.
4. Compara la cantidad vendida con la capacidad máxima mediante sne y beq.
5. Guarda capacidad_total, disponibles y es_diferente en memoria mediante sw.
6. Si el cine está lleno, muestra el mensaje Cine lleno.
7. En caso contrario, muestra Asientos disponibles: seguido del número de asientos libres.
8. Finaliza la ejecución mediante la llamada al sistema correspondiente.
El código contiene comentarios que permiten identificar los bloques principales y seguir el flujo del programa.
## Evidencias de ejecución
Las siguientes imágenes deben almacenarse dentro de la carpeta `evidencias/` utilizando exactamente los nombres indicados para que se muestren correctamente en GitHub.
### Código
![Código MIPS](evidencias/codigo.png)
**Descripción:**  
La captura muestra el código ensamblador ejecutado en MipsyWeb. Se observan el segmento de datos, la carga de valores desde memoria, el procesamiento mediante registros, el almacenamiento de resultados, la estructura condicional y las llamadas al sistema utilizadas para mostrar la salida.
### Registros
![Registros](evidencias/registros.png)
**Descripción:**  
Durante la ejecución, los registros temporales principales contienen los valores usados y calculados por el programa:
| Registro | Valor | Contenido |
| $t0 | 4 | Número de salas. |
| $t1 | 50 | Asientos por sala. |
| $t2 | 175 | Boletos vendidos. |
| $t3 | 200 | Capacidad total calculada. |
| $t4 | 25 | Asientos disponibles. |
| $t5 | 1 | Resultado de la comparación vendidos!= capacidad_total |
Estos valores permiten comprobar que las operaciones aritméticas y de comparación se realizaron correctamente.
### Resultado
![Resultado del programa](evidencias/resultado.png)
**Descripción:**  
Con los datos utilizados en el proyecto, la capacidad total es de 200 asientos y se han vendido 175 boletos. Por tanto, el programa determina que quedan 25 asientos disponibles y muestra:
Asientos disponibles: 25
## Conclusiones
El desarrollo de este proyecto permitió comprender de manera práctica el flujo de procesamiento de datos en una arquitectura de bajo nivel. Se pudo observar que, antes de realizar operaciones matemáticas o comparaciones, los datos almacenados en memoria deben cargarse en registros para poder ser procesados por el programa.
La implementación también permitió relacionar operaciones de alto nivel, como calcular una capacidad, obtener una diferencia o evaluar una condición, con instrucciones concretas de lenguaje ensamblador MIPS. El uso de MipsyWeb facilitó la comprobación del programa al permitir observar tanto los registros como el resultado final de la ejecución.
Además, la actividad permitió reforzar el trabajo colaborativo y la validación sistemática de resultados. Comparar los valores esperados con los obtenidos en los registros ayudó a confirmar que la lógica implementada era correcta antes de dar por finalizada la solución.
En conjunto, la práctica permitió comprender mejor la relación entre memoria, registros, operaciones aritméticas, comparaciones, saltos condicionales y llamadas al sistema dentro de un programa en ensamblador.
## Documentación
El reporte completo del proyecto se encuentra en formato PDF dentro de:
documentacion/reporte_proyecto.pdf
El documento contiene la descripción del escenario, el análisis de los datos, la implementación, las evidencias, las conclusiones y la bibliografía utilizada durante el desarrollo.
## Bibliografía
1. Citas APA – Normas APA. (s.f.). *Normas APA*. Recuperado el 24 de septiembre de 2026, de https://normas-apa.org/citas/
2. CiteMaker. (s.f.). *CiteMaker CiteWeb | APA 7th Edn.* [Extensión de Chrome]. Chrome Web Store. Recuperado el 24 de septiembre de 2026, de https://chromewebstore.google.com/detail/citemaker-citeweb-apa-7th/naankklphfojljboaokgfbheobbgenka
3. Mipsy Web: MIPS Assembly Emulator and Debugger. (s.f.). Recuperado el 29 de septiembre de 2026, de https://mipsy.qml.io/
4. Patterson, D. A., & Hennessy, J. L. (2018). *Estructura y diseño de computadores: La interfaz hardware/software* (5.ª ed.). Editorial Reverté.
5. Sweetman, D. (2007). *See MIPS run* (2.ª ed.). Morgan Kaufmann Publishers.

6. Tanenbaum, A. S., & Bos, H. (2015). *Sistemas operativos modernos* (4.ª ed.). Pearson Education.
