
(define (problem escape-room-problema)

  (:domain escape-room-laboratorio)

  (:objects

    jugador1 - jugador

    control almacen laboratorio seguridad - habitacion

    nota tarjeta codigo-almacen codigo-salida - objeto

    puerta-almacen puerta-laboratorio
    puerta-seguridad puerta-salida - puerta

    acertijo-control acertijo-laboratorio - acertijo
  )

  (:init

    ; POSICION INICIAL DEL JUGADOR
    (at jugador1 control)

    ; CONEXIONES ENTRE HABITACIONES
    (connected control almacen puerta-almacen)
    (connected almacen laboratorio puerta-laboratorio)
    (connected laboratorio seguridad puerta-seguridad)

    ; UBICACION INICIAL DE LOS OBJETOS
    (item-at nota control)
    (item-at tarjeta almacen)

    ; PUERTAS INICIALMENTE BLOQUEADAS
    (door-locked puerta-almacen)
    (door-locked puerta-laboratorio)
    (door-locked puerta-seguridad)
    (door-locked puerta-salida)

    ; UBICACION DE LAS PUERTAS
    (door-at puerta-almacen control)
    (door-at puerta-laboratorio almacen)
    (door-at puerta-seguridad laboratorio)
    (door-at puerta-salida seguridad)

    ; ACERTIJOS PENDIENTES
    (puzzle-unsolved acertijo-control)
    (puzzle-unsolved acertijo-laboratorio)

    ; UBICACION DE LOS ACERTIJOS
    (puzzle-at acertijo-control control)
    (puzzle-at acertijo-laboratorio laboratorio)

    ; OBJETOS NECESARIOS PARA RESOLVER LOS ACERTIJOS
    (puzzle-requires acertijo-control nota)
    (puzzle-requires acertijo-laboratorio tarjeta)

    ; RECOMPENSAS DE LOS ACERTIJOS
    (puzzle-rewards acertijo-control codigo-almacen)
    (puzzle-rewards acertijo-laboratorio codigo-salida)

    ; OBJETOS QUE ABREN LAS PUERTAS
    (opens puerta-almacen codigo-almacen)
    (opens puerta-laboratorio tarjeta)
    (opens puerta-seguridad tarjeta)
    (opens puerta-salida codigo-salida)

    ; HABITACION DONDE SE ENCUENTRA LA SALIDA
    (exit-room seguridad)
    (exit-door puerta-salida)
  )

  (:goal
    (escaped jugador1)
  )
)
