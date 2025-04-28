# Script en Lisp: Problema del Cruce del Puente

Este script en Lisp resuelve el problema clásico de cruce de un puente por varias personas con diferentes tiempos de cruce. En este caso, las personas tienen tiempos de cruce distintos, y la estrategia empleada busca minimizar el tiempo total de cruce.

## Código Lisp:

```lisp
(defun cross-bridge ()
  (let ((person-a 1)  ; Tiempo de cruce de la persona A
        (person-b 2)  ; Tiempo de cruce de la persona B
        (person-c 5)  ; Tiempo de cruce de la persona C
        (person-d 10) ; Tiempo de cruce de la persona D
        (total-time 0)) ; Tiempo total

    ;; Estrategia: A y B cruzan
    (setq total-time (+ total-time person-b))

    ;; A regresa
    (setq total-time (+ total-time person-a))

    ;; C y D cruzan
    (setq total-time (+ total-time person-d))

    ;; B regresa
    (setq total-time (+ total-time person-b))

    ;; A y B cruzan
    (setq total-time (+ total-time person-b))

    total-time))

;; Llamar la función
(print (cross-bridge))  ; Imprime el tiempo total, que debería ser 17
