
# Escape Room – El misterio del laboratorio secreto

## Descripción
Proyecto de planificación automática desarrollado utilizando **PDDL (Planning Domain Definition Language)**. Consiste en un Escape Room donde un jugador debe recorrer diferentes habitaciones, recoger objetos, resolver acertijos y desbloquear puertas para conseguir escapar de un laboratorio secreto.

## Objetivo
Aplicar conceptos de inteligencia artificial y planificación automática mediante la definición de acciones, precondiciones, efectos y objetivos.

## Escenario
El Escape Room está compuesto por cuatro habitaciones:

- **Control:** habitación inicial donde se encuentra una nota y el primer acertijo.
- **Almacén:** contiene una tarjeta de acceso.
- **Laboratorio:** contiene el segundo acertijo y permite obtener el código de salida.
- **Seguridad:** habitación final donde se encuentra la puerta de salida.


## Estructura del proyecto
```text
EscapeRoom-PDDL/
│
├── domain.pddl
│
├── problem.pddl
│
├── Documentacion_Escape_Room.pdf
│
├── PlanificadorCap/
│   └── escape-room.png
│
└── README.md
```


## Herramientas utilizadas

- **PDDL:** lenguaje para representar problemas de planificación.
- **Planning.Domains:** plataforma utilizada para ejecutar y resolver el problema.
- **BFWS:** planificador utilizado para encontrar una solución.

## Resultado

El planificador encontró una solución de **14 acciones**, permitiendo que el jugador recoja los objetos necesarios, resuelva los acertijos, desbloquee las puertas y finalmente escape del laboratorio.

## Autor

Joshua Emmanuel Esparza Chavez

Proyecto académico desarrollado como parte de la materia de Inteligencia Artificial.
