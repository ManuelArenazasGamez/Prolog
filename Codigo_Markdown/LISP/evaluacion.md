;;; ------------------------------------------
;;; EJERCICIOS DE MANIPULACIÓN DE LISTAS
;;; ------------------------------------------

;; 1. Obtener primer elemento
(defun primero (lista) (car lista))

;; 2. Obtener segundo elemento
(defun segundo (lista) (car (cdr lista)))

;; 3. Encontrar último elemento (recursivo)
(defun ultimo (lista)
  (if (null (cdr lista)) (car lista) (ultimo (cdr lista))))

;; 4. Calcular longitud (recursivo)
(defun longitud (lista)
  (if (null lista) 0 (+ 1 (longitud (cdr lista)))))

;; 5. Sumar elementos numéricos (recursivo)
(defun suma (lista)
  (if (null lista) 0 (+ (car lista) (suma (cdr lista)))))

;; 6. Función pendiente
(defun verificar (lista) 
  (format t "Función no implementada aún.~%"))

;;; ------------------------------------------
;;; EJEMPLOS DE USO
;;; ------------------------------------------
(format t "~%=== EJEMPLOS ===~%")
(format t "Primero de (A B C): ~a~%" (primero '(A B C)))
(format t "Segundo de (1 2 3): ~a~%" (segundo '(1 2 3)))
(format t "Último de (X Y Z): ~a~%" (ultimo '(X Y Z)))
(format t "Longitud de (10 20 30): ~a~%" (longitud '(10 20 30)))
(format t "Suma de (5 10 15): ~a~%" (suma '(5 10 15)))
(verificar '(a b c))