
```lisp
;;; ------------------------------------------
;;; 🏆 BASE DE DATOS DE FUTBOLISTAS
;;; Estructura: (país (posición (jugador (atributos))))
;;; ------------------------------------------
(defparameter *futbolistas*
  '((argentina
     (delantero 
      ((messi (champions t) (mundial t)) 
      ((batistuta (champions nil) (mundial nil))))
     (mediocampista 
      ((maradona (champions t) (mundial t)) 
      ((riquelme (champions nil) (mundial nil)))))

    ;; ... (resto de países con misma estructura)
))

;;; FUNCIÓN DE BÚSQUEDA
(defun buscar (clave lista)
  "Busca una clave en lista asociativa. Ej: (buscar 'brasil *futbolistas*)"
  (cdr (assoc clave lista)))

;;;  FUNCIÓN PRINCIPAL (INTERACTIVA)
(defun adivinar-futbolista ()
  (format t "~%=== ADIVINA EL FUTBOLISTA ===~%~%")
  ;; Paso 1: Selección de país
  (format t "Países disponibles: ~a~%> " (mapcar #'car *futbolistas*))
  (let ((nacionalidad (read)))
    ;; ... (lógica interactiva completa)
  ))

;;; 🚀 INICIO AUTOMÁTICO
(adivinar-futbolista)