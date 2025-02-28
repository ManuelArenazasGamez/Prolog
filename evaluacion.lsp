;Ejercico 1
(defun primero (lista)
  (car lista))

;ejecicio 2
(defun segundo (lista)
  (car (cdr lista)))

;ejercicio 3
(defun ultimo (lista)
(if (null (cdr lista))
(car lista)
(ultimo (cdr lista))
))

;ejercio 4
(defun longitud (lista)
(if (null lista)
    0
 (+ 1 (longitud (cdr lista))))) 

 ; ejercicio 5

 (defun suma(lista)
 (if (null lista)
    0
 (+(car lista) (suma(cdr lista)))
 )  
 )
    
;ejercicio 6
(defun verificar(lista)

)