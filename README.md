# Sistema de inventario y control de venta de boletos para un cine en MipsyWeb

**Asignatura:** UCOM250 – Organización y Arquitectura de Computadores  
**Integrantes:** Ricardo Perez, Eduardo Nogales  
**Año:** 2026  
**Fecha:** 07/10/2026

---

## Descripción

### Escenario

El proyecto plantea el control de disponibilidad de boletos para un cine mediante un programa desarrollado en lenguaje ensamblador MIPS y ejecutado en MipsyWeb.

El cine cuenta con **4 salas**, cada una con una capacidad de **50 asientos**, por lo que la capacidad total es de **200 asientos**. En el escenario asignado se han vendido **175 boletos**.

El programa utiliza los datos almacenados en memoria para calcular la capacidad total del cine, determinar cuántos asientos permanecen disponibles y mostrar el resultado correspondiente.

### Resultado

El programa calcula:

- Capacidad total del cine: **200 asientos**.
- Boletos vendidos: **175**.
- Asientos disponibles: **25**.

Si la cantidad de boletos vendidos es igual a la capacidad total, el programa muestra:

```text
Cine lleno
```

En caso contrario, muestra:

```text
Asientos disponibles: 25
```

---

## Análisis

### Datos del programa

Los datos principales se almacenan en memoria y representan la información necesaria para calcular la disponibilidad del cine.

| Dato | Valor inicial | Propósito |
|---|---:|---|
| Número de salas | 4 | Indicar cuántas salas tiene el cine |
| Asientos por sala | 50 | Indicar la capacidad de cada sala |
| Boletos vendidos | 175 | Registrar la cantidad de boletos vendidos |
| Capacidad total | 200 | Resultado de multiplicar salas × asientos por sala |
| Asientos disponibles | 25 | Resultado de restar boletos vendidos a la capacidad total |

### Operaciones requeridas

| Datos / Resultados | Propósito | Operación requerida | Instrucción MIPS |
|---|---|---|---|
| Número de salas | Cargar dato desde memoria | Carga | `lw` |
| Asientos por sala | Cargar dato desde memoria | Carga | `lw` |
| Boletos vendidos | Cargar dato desde memoria | Carga | `lw` |
| Capacidad total | Calcular la capacidad del cine | Multiplicación | `mul` |
| Asientos disponibles | Calcular los asientos restantes | Resta | `sub` |
| Comparación de capacidad | Determinar si el cine está lleno | Comparación | `sne` |
| Control de flujo | Seleccionar el mensaje que debe mostrarse | Salto condicional | `beq` |
| Resultados | Guardar valores calculados en memoria | Almacenamiento | `sw` |
| Mensajes | Cargar direcciones y valores para impresión | Preparación de salida | `la`, `li`, `move` |
| Flujo del programa | Evitar ejecutar bloques no correspondientes | Salto | `j` |
| Salida | Mostrar los resultados por pantalla | Impresión | `syscall` |

Instrucciones utilizadas en el programa:

- `lw`: cargar un dato desde memoria.
- `sw`: almacenar un resultado en memoria.
- `mul`: realizar una multiplicación.
- `sub`: realizar una resta.
- `sne`: determinar si dos valores son diferentes.
- `beq`: realizar un salto si dos valores son iguales.
- `li`: cargar un valor inmediato en un registro.
- `la`: cargar la dirección de una etiqueta.
- `move`: copiar el contenido de un registro a otro.
- `j`: realizar un salto incondicional.
- `syscall`: mostrar información por pantalla o finalizar el programa.

---

## Implementación

El código se organiza en una versión base y una versión final. La versión final contiene la solución completa del escenario y se ejecuta en MipsyWeb.

### Versión base

La carpeta `version_base/` contiene el programa utilizado como punto de partida de la actividad.

**Archivo:**

```text
version_base/programa_base.s
```

**Descripción del estado inicial:**  
La versión base carga desde memoria la cantidad de salas, los asientos por sala y los boletos vendidos. A partir de estos datos calcula la capacidad total del cine y los asientos disponibles, compara si la cantidad de boletos vendidos es diferente de la capacidad total y almacena los resultados nuevamente en memoria. Esta versión todavía no incluye el control de flujo ni la presentación de mensajes por pantalla, elementos que se incorporan en la versión final.

### Versión final

La carpeta `version_final/` contiene el programa desarrollado por el grupo.

**Archivo:**

```text
version_final/programa_final.s
```

La versión final incluye:

- Carga de los datos almacenados en memoria mediante `lw`.
- Cálculo de la capacidad total mediante `mul`.
- Cálculo de los asientos disponibles mediante `sub`.
- Comparación de los boletos vendidos con la capacidad total.
- Uso de `sne` y `beq` para controlar el flujo del programa.
- Almacenamiento de los resultados mediante `sw`.
- Presentación del resultado por pantalla mediante `syscall`.
- Mensajes diferentes para los casos de cine lleno y asientos disponibles.
- Comentarios explicativos dentro del código.

---

## Evidencias de ejecución

Las siguientes capturas demuestran el código, el uso de registros y el resultado final en MipsyWeb.

### Código

![Código MIPS](evidencias/codigo.png)

**Descripción:**  
La captura muestra el código fuente ejecutado en MipsyWeb. Se observan las instrucciones utilizadas para cargar los datos, calcular la capacidad total y los asientos disponibles, almacenar resultados en memoria y controlar la salida mediante saltos y llamadas al sistema.

### Registros

![Registros](evidencias/registros.png)

**Descripción:**  
La captura muestra los registros utilizados durante la ejecución. Se observan, entre otros, `$t0 = 4`, `$t1 = 50`, `$t2 = 175`, `$t3 = 200`, `$t4 = 25` y `$t5 = 1`, correspondientes a los datos de entrada, la capacidad total, los asientos disponibles y el resultado de la comparación.

### Resultado

![Resultado del programa](evidencias/resultado.png)

**Descripción:**  
La salida muestra **“Asientos disponibles: 25”**, confirmando que el programa calculó correctamente la diferencia entre la capacidad total de 200 asientos y los 175 boletos vendidos. MipsyWeb también indica que el programa finalizó correctamente con estado de salida 0.

---

## Conclusiones

El desarrollo del proyecto permitió aplicar de forma práctica conceptos de organización y arquitectura de computadores mediante programación en lenguaje ensamblador MIPS. La implementación ayudó a comprender cómo los datos almacenados en memoria son cargados a registros y posteriormente procesados mediante instrucciones aritméticas, de comparación y de control de flujo.

Una parte importante del trabajo consistió en traducir un problema sencillo de la vida real a operaciones básicas que puedan ser ejecutadas por el procesador. Calcular la capacidad total, determinar los asientos disponibles y seleccionar el mensaje correcto permitió observar cómo una secuencia de instrucciones MIPS construye el comportamiento completo de un programa.

También se reforzó el uso de MipsyWeb para comprobar el contenido de los registros y verificar que cada operación produjera el resultado esperado. La revisión paso a paso facilitó la identificación de errores y permitió relacionar de manera más clara las instrucciones escritas con los cambios producidos durante la ejecución.

Si se desarrollara nuevamente la actividad, sería conveniente planificar desde el inicio la distribución de los registros, documentar cada bloque conforme se construye y realizar pruebas con distintos valores, por ejemplo un cine con asientos disponibles y otro con su capacidad completamente ocupada.

---

## Documentación

El reporte completo del proyecto se encuentra almacenado en:

```text
documentacion/reporte_proyecto.pdf
```

---

## Estructura del repositorio

```text
miniproyecto01/
│
├── README.md
│
├── version_base/
│   └── programa_base.s
│
├── version_final/
│   └── programa_final.s
│
├── evidencias
│   ├── codigo.png
│   ├── registros.png
│   └── resultado.png
│
└── documentacion/
    └── reporte_proyecto.pdf
```

---

## Bibliografía

### Webgrafía

1. Citas APA – Normas APA. (s.f.). Recuperado el 24 de septiembre de 2026, de https://normas-apa.org/citas/

2. CiteMaker. (s.f.). *CiteMaker CiteWeb | APA 7th Edn.* [Extensión de Chrome]. Chrome Web Store. Recuperado el 24 de septiembre de 2026, de https://chromewebstore.google.com/detail/citemaker-citeweb-apa-7th/naankklphfojljboaokgfbheobbgenka

3. *Mipsy Web: MIPS Assembly Emulator and Debugger*. (s.f.). Recuperado el 29 de septiembre de 2026, de https://mipsy.qml.io/

### Referencias utilizadas

1. Patterson, D. A., & Hennessy, J. L. (2018). *Estructura y diseño de computadores: La interfaz hardware/software* (5.ª ed.). Editorial Reverté.

2. Sweetman, D. (2007). *See MIPS run* (2.ª ed.). Morgan Kaufmann Publishers.

3. Tanenbaum, A. S., & Bos, H. (2015). *Sistemas operativos modernos* (4.ª ed.). Pearson Education.
