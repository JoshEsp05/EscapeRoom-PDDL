
(define (domain escape-room-laboratorio)

  (:requirements :strips :typing :negative-preconditions)

  (:types
    jugador
    habitacion
    objeto
    puerta
    acertijo
  )

  (:predicates
    
    (exit-door ?d - puerta)
    
    ; Ubicacion del jugador
    (at ?p - jugador ?r - habitacion)

    ; Conexion entre habitaciones
    (connected ?r1 - habitacion ?r2 - habitacion ?d - puerta)

    ; Objetos que tiene el jugador
    (has ?p - jugador ?o - objeto)

    ; Ubicacion de los objetos
    (item-at ?o - objeto ?r - habitacion)

    ; Estado de las puertas
    (door-locked ?d - puerta)
    (door-unlocked ?d - puerta)
    (door-at ?d - puerta ?r - habitacion)

    ; Estado de los acertijos
    (puzzle-unsolved ?pz - acertijo)
    (puzzle-solved ?pz - acertijo)
    (puzzle-at ?pz - acertijo ?r - habitacion)

    ; Requisitos y recompensas
    (puzzle-requires ?pz - acertijo ?o - objeto)
    (puzzle-rewards ?pz - acertijo ?o - objeto)
    (opens ?d - puerta ?o - objeto)

    ; Salida y escape
    (exit-room ?r - habitacion)
    (escaped ?p - jugador)
  )


  ; ACCION 1: RECOGER OBJETO

  (:action take-item

    :parameters (?p - jugador ?o - objeto ?r - habitacion)

    :precondition (and
      (at ?p ?r)
      (item-at ?o ?r)
      (not (has ?p ?o))
    )

    :effect (and
      (has ?p ?o)
      (not (item-at ?o ?r))
    )
  )


  ; ACCION 2: RESOLVER ACERTIJO

  (:action solve-puzzle

    :parameters (
      ?p - jugador
      ?r - habitacion
      ?pz - acertijo
      ?tool - objeto
      ?reward - objeto
    )

    :precondition (and
      (at ?p ?r)
      (puzzle-at ?pz ?r)
      (puzzle-unsolved ?pz)
      (puzzle-requires ?pz ?tool)
      (has ?p ?tool)
      (puzzle-rewards ?pz ?reward)
    )

    :effect (and
      (puzzle-solved ?pz)
      (item-at ?reward ?r)
      (not (puzzle-unsolved ?pz))
    )
  )


  ; ACCION 3: DESBLOQUEAR PUERTA

  (:action unlock-door

    :parameters (
      ?p - jugador
      ?d - puerta
      ?o - objeto
      ?r - habitacion
    )

    :precondition (and
      (at ?p ?r)
      (door-at ?d ?r)
      (has ?p ?o)
      (door-locked ?d)
      (opens ?d ?o)
    )

    :effect (and
      (door-unlocked ?d)
      (not (door-locked ?d))
    )
  )


  ; ACCION 4: MOVERSE ENTRE HABITACIONES

  (:action move

    :parameters (
      ?p - jugador
      ?from - habitacion
      ?to - habitacion
      ?d - puerta
    )

    :precondition (and
      (at ?p ?from)
      (connected ?from ?to ?d)
      (door-unlocked ?d)
    )

    :effect (and
      (at ?p ?to)
      (not (at ?p ?from))
    )
  )


  ; ACCION 5: ESCAPAR

    (:action escape
      :parameters (?p - jugador ?r - habitacion ?d - puerta)
      :precondition (and
        (at ?p ?r)
        (exit-room ?r)
        (door-at ?d ?r)
        (exit-door ?d)
        (door-unlocked ?d)
      )
      :effect (and
        (escaped ?p)
      )
    )

)
