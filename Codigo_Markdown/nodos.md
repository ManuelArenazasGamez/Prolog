# Script en Lisp: Juego de Adivinanza de Personajes

Este script en Lisp está diseñado para adivinar personajes a partir de distintas categorías (como "preal", "pnoreal", "pkimera" y "pextraterrstre"). El programa recursivamente realiza preguntas sobre el personaje hasta que adivina correctamente, basándose en las respuestas del usuario.

## Código Lisp:

```lisp
;; --- Definición de personajes por categoría ---

(defparameter *nodos* 
  '((preal
     (alto (cpelo (VCarranza VFox)))
     (bajo (BJuarez)))
    (pnoreal
     (bob)
     (patricio)
     (pantera rosa))
    (pkimera
     (k1)
     (k2))
    (pextraterrstre
     (ex1)
     (ex2))))

;; --- Función recorre: Recursión para recorrer la lista de personajes ---

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

;; --- Función recor: Pregunta por cada personaje en la lista ---

(defun recor (lista)
  (format t "¿Tu personaje es ~a? (si/no): " (caar lista))  ;; Pregunta si el primer personaje es el correcto
  (if lista
      (recor (cdr lista))))  ;; Si hay más personajes, continúa preguntando
