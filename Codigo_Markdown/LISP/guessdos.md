# Script en Lisp: Adivina el Futbolista

Este script en Lisp es una versión del juego "Akinator" centrado en futbolistas. El objetivo del programa es adivinar el nombre de un futbolista mediante una serie de preguntas sobre su nacionalidad, posición y si ha ganado la Champions League.

## Código Lisp:

```lisp
;; --- Definir los futbolistas y sus categorías ---

(defparameter *futbolistas*
  '((argentina
     (delantero (champions (messi dybala)) (sin-champions (batistuta crespo)))
     (mediocampista (champions (maradona)) (sin-champions (riquelme aimar))))
    (brasil
     (delantero (champions (ronaldo neymar)) (sin-champions (romario bebeto)))
     (mediocampista (champions (kaka ronaldinho)) (sin-champions (rivaldo))))
    (francia
     (delantero (champions (mbappe henry)) (sin-champions (trezeguet)))
     (mediocampista (champions (zidane pogba)) (sin-champions (kante))))
    (portugal
     (delantero (champions (cristiano eusebio)) (sin-champions (rui-patricio)))
     (mediocampista (champions (figo bruno-fernandes)) (sin-champions (bernardo-silva))))))

;; --- Función para hacer preguntas al usuario ---

(defun hacer-pregunta (pregunta)
  (format t "~%~A (s/n): " pregunta)
  (let ((respuesta (read)))
    (eq respuesta 's)))  ;; Devolver 't si la respuesta es 's'

;; --- Función para buscar jugadores según país, posición y Champions ---

(defun buscar-jugadores (pais posicion champions?)
  (let* ((pais-info (cdr (assoc pais *futbolistas*)))  
         (posicion-info (cdr (assoc posicion pais-info)))) 
    (if champions?
        (cadr (assoc 'champions posicion-info))  ;; Devolver jugadores que ganaron Champions
        (cadr (assoc 'sin-champions posicion-info)))))  ;; Devolver jugadores sin Champions

;; --- Función para confirmar el jugador adivinado ---

(defun confirmar-jugador (jugadores)
  (dolist (jugador jugadores)
    (format t "~%¿Tu personaje es ~A? (s/n): " jugador)
    (let ((respuesta (read)))
      (if (eq respuesta 's)
          (progn
            (format t "¡Adiviné! El jugador es ~A." jugador)
            (return-from confirmar-jugador))  ;; Salir si acierta el jugador
          (format t "Probando con otro jugador...")))))

;; --- Función principal para adivinar el futbolista ---

(defun adivinar-futbolista ()
  (format t "~%¡Bienvenido al Akinator de Futbolistas!~%")
  ;; Preguntar por la nacionalidad
  (let ((pais (cond ((hacer-pregunta "¿Es argentino?") 'argentina)
                    ((hacer-pregunta "¿Es brasileño?") 'brasil)
                    ((hacer-pregunta "¿Es francés?") 'francia)
                    ((hacer-pregunta "¿Es portugués?") 'portugal)
                    (t nil))))  ;; Si no se responde sí a ninguno, se pone nil

    (if (not pais)
        (format t "No tengo información sobre ese país.")
        
        ;; Preguntar por la posición y si ha ganado la Champions
        (let ((posicion (if (hacer-pregunta "¿Es delantero?") 'delantero 'mediocampista))
              (champions? (hacer-pregunta "¿Ha ganado la Champions?")))  ;; Pregunta sobre Champions
          
          ;; Buscar jugadores que coincidan con las respuestas
          (let ((jugadores (buscar-jugadores pais posicion champions?)))
            (if jugadores
                (progn
                  (confirmar-jugador jugadores))  ;; Confirmar la respuesta final
                (format t "No encontré coincidencias.")))))))

;; Llamada a la función principal para iniciar el juego
(adivinar-futbolista)
