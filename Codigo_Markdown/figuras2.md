# Script en Lisp: Cálculo interactivo de áreas y volúmenes

Este script en Lisp define funciones para calcular áreas y volúmenes de figuras geométricas comunes. Además, incluye una interfaz interactiva que permite al usuario seleccionar qué cálculo desea realizar.

## Código Lisp

```lisp
;; --- Funciones para calcular áreas ---

(defun area-cuadrado (lado)
  "Calcula el área de un cuadrado dado su lado."
  (* lado lado))

(defun area-rectangulo (base altura)
  "Calcula el área de un rectángulo dada su base y altura."
  (* base altura))

(defun area-circulo (radio)
  "Calcula el área de un círculo dado su radio."
  (* 3.1416 radio radio))

(defun area-triangulo (base altura)
  "Calcula el área de un triángulo dada su base y altura."
  (/ (* base altura) 2))

(defun area-trapecio (base1 base2 altura)
  "Calcula el área de un trapecio dadas sus dos bases y altura."
  (/ (* (+ base1 base2) altura) 2))

;; --- Funciones para calcular volúmenes ---

(defun volumen-cubo (lado)
  "Calcula el volumen de un cubo dado su lado."
  (expt lado 3))

(defun volumen-prisma (base altura profundidad)
  "Calcula el volumen de un prisma rectangular dada su base, altura y profundidad."
  (* base altura profundidad))

(defun volumen-esfera (radio)
  "Calcula el volumen de una esfera dado su radio."
  (* (/ 4 3) 3.1416 (expt radio 3)))

(defun volumen-cilindro (radio altura)
  "Calcula el volumen de un cilindro dado su radio y altura."
  (* 3.1416 (expt radio 2) altura))

(defun volumen-cono (radio altura)
  "Calcula el volumen de un cono dado su radio y altura."
  (/ (* 3.1416 (expt radio 2) altura) 3))

;; --- Funciones auxiliares para interactuar con el usuario ---

(defun pedir-dato (mensaje)
  "Solicita un dato al usuario y lo devuelve."
  (format t "~a: " mensaje)
  (read))

;; --- Funciones para calcular y mostrar resultados ---

(defun calcular-area-cuadrado ()
  "Calcula y muestra el área de un cuadrado."
  (let ((lado (pedir-dato "Introduce el valor del lado del cuadrado")))
    (format t "~%Área del cuadrado: ~d~%" (area-cuadrado lado))))

(defun calcular-area-rectangulo ()
  "Calcula y muestra el área de un rectángulo."
  (let ((base (pedir-dato "Introduce el valor de la base del rectángulo"))
        (altura (pedir-dato "Introduce el valor de la altura del rectángulo")))
    (format t "~%Área del rectángulo: ~d~%" (area-rectangulo base altura))))

(defun calcular-area-circulo ()
  "Calcula y muestra el área de un círculo."
  (let ((radio (pedir-dato "Introduce el valor del radio del círculo")))
    (format t "~%Área del círculo: ~f~%" (area-circulo radio))))

(defun calcular-area-triangulo ()
  "Calcula y muestra el área de un triángulo."
  (let ((base (pedir-dato "Introduce el valor de la base del triángulo"))
        (altura (pedir-dato "Introduce el valor de la altura del triángulo")))
    (format t "~%Área del triángulo: ~d~%" (area-triangulo base altura))))

(defun calcular-area-trapecio ()
  "Calcula y muestra el área de un trapecio."
  (let ((base1 (pedir-dato "Introduce el valor de la base1 del trapecio"))
        (base2 (pedir-dato "Introduce el valor de la base2 del trapecio"))
        (altura (pedir-dato "Introduce el valor de la altura del trapecio")))
    (format t "~%Área del trapecio: ~d~%" (area-trapecio base1 base2 altura))))

(defun calcular-volumen-cubo ()
  "Calcula y muestra el volumen de un cubo."
  (let ((lado (pedir-dato "Introduce el valor del lado del cubo")))
    (format t "~%Volumen del cubo: ~d~%" (volumen-cubo lado))))

(defun calcular-volumen-prisma ()
  "Calcula y muestra el volumen de un prisma."
  (let ((base (pedir-dato "Introduce el valor de la base del prisma"))
        (altura (pedir-dato "Introduce el valor de la altura del prisma"))
        (profundidad (pedir-dato "Introduce el valor de la profundidad del prisma")))
    (format t "~%Volumen del prisma: ~d~%" (volumen-prisma base altura profundidad))))

(defun calcular-volumen-esfera ()
  "Calcula y muestra el volumen de una esfera."
  (let ((radio (pedir-dato "Introduce el valor del radio de la esfera")))
    (format t "~%Volumen de la esfera: ~f~%" (volumen-esfera radio))))

(defun calcular-volumen-cilindro ()
  "Calcula y muestra el volumen de un cilindro."
  (let ((radio (pedir-dato "Introduce el valor del radio del cilindro"))
        (altura (pedir-dato "Introduce el valor de la altura del cilindro")))
    (format t "~%Volumen del cilindro: ~f~%" (volumen-cilindro radio altura))))

(defun calcular-volumen-cono ()
  "Calcula y muestra el volumen de un cono."
  (let ((radio (pedir-dato "Introduce el valor del radio del cono"))
        (altura (pedir-dato "Introduce el valor de la altura del cono")))
    (format t "~%Volumen del cono: ~f~%" (volumen-cono radio altura))))

;; --- Función principal para seleccionar el cálculo ---

(defun seleccionar-calculo ()
  "Muestra un menú interactivo para seleccionar qué cálculo realizar."
  (format t "~%¿Qué cálculo quieres realizar?~%")
  (format t "1. Calcular área del cuadrado~%")
  (format t "2. Calcular área del rectángulo~%")
  (format t "3. Calcular área del círculo~%")
  (format t "4. Calcular área del triángulo~%")
  (format t "5. Calcular área del trapecio~%")
  (format t "6. Calcular volumen del cubo~%")
  (format t "7. Calcular volumen del prisma~%")
  (format t "8. Calcular volumen de la esfera~%")
  (format t "9. Calcular volumen del cilindro~%")
  (format t "10. Calcular volumen del cono~%")
  (format t "~%Elige una opción (1-10): ")
  (let ((opcion (read)))
    (cond
      ((= opcion 1) (calcular-area-cuadrado))
      ((= opcion 2) (calcular-area-rectangulo))
      ((= opcion 3) (calcular-area-circulo))
      ((= opcion 4) (calcular-area-triangulo))
      ((= opcion 5) (calcular-area-trapecio))
      ((= opcion 6) (calcular-volumen-cubo))
      ((= opcion 7) (calcular-volumen-prisma))
      ((= opcion 8) (calcular-volumen-esfera))
      ((= opcion 9) (calcular-volumen-cilindro))
      ((= opcion 10) (calcular-volumen-cono))
      (t (format t "~%Opción no válida, intenta de nuevo~%")
         (seleccionar-calculo)))))

;; Llamar a la función principal para seleccionar el cálculo
(seleccionar-calculo)