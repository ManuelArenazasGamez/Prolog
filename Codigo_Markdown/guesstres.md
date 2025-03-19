# Script en Lisp: Adivina el Jugador de Fútbol

Este script en Lisp realiza un juego interactivo para adivinar el jugador de fútbol. Se basa en una lista de futbolistas clasificados por nacionalidad y posición. El programa pregunta al usuario si el jugador corresponde a cada categoría, y si la respuesta es afirmativa, sigue profundizando hasta adivinar al futbolista.

## Código Lisp:

```lisp
;; --- Definición de futbolistas por nacionalidad y posición ---

(defparameter *nodes*  
  '((argentina 
     (delantero (messi))       
     (medio (riquelme))        
     (defensa (cuti)))
    (españa
     (delantero (villa))      
     (medio (xavi))           
     (defensa (puyol))        
     (portero (dibu)))
    (mexico
     (delantero (vela))       
     (medio (edson))          
     (defensa (layun))        
     (portero (ochoa)))
    (alemania
     (delantero (havertz))    
     (medio (musiala))        
     (defensa (ruddiger))     
     (portero (neuer)))))

;; --- Función recorre: Recursión para recorrer la lista de futbolistas ---

(defun recorre (lista)
  (when lista
    (let ((elemento (car lista)))
      (if (atom elemento)
          (format t "Tu personaje es ~a.~%" elemento)  ;; Si es un elemento (nombre), adivina al personaje
          (progn
            (format t "¿Tu personaje es ~a? (si/no): " (car elemento))  ;; Pregunta por el nombre
            (setq a (read))  ;; Lee la respuesta del usuario
            (if (string-equal a "si")
                (recorre (cadr elemento))  ;; Si la respuesta es "si", recursivamente busca en la siguiente lista
                (recorre (cdr lista)))))))  ;; Si la respuesta es "no", sigue en la siguiente opción

;; --- Función recor: Pregunta por cada jugador en la lista ---

(defun recor (lista)
  (format t "¿Tu personaje es ~a? (si/no): " (caar lista))  ;; Pregunta si el primer jugador es el correcto
  (if lista
      (recor (cdr lista))))  ;; Si hay más jugadores, continúa preguntando
