# Script en Lisp: Cálculo de áreas y volúmenes

Este script en Lisp define funciones para calcular áreas y volúmenes de figuras geométricas comunes. Además, incluye una función principal (`calcular-figuras`) que muestra los resultados de los cálculos.

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

;; --- Función principal para calcular y mostrar resultados ---

(defun calcular-figuras ()
  "Calcula y muestra las áreas y volúmenes de varias figuras geométricas."
  (let ((lado 4)
        (base 5)
        (altura 6)
        (radio 3)
        (base1 7)
        (base2 9)
        (profundidad 10))
    (format t "~%Área del cuadrado: ~d~%" (area-cuadrado lado))
    (format t "~%Área del rectángulo: ~d~%" (area-rectangulo base altura))
    (format t "~%Área del círculo: ~f~%" (area-circulo radio))
    (format t "~%Área del triángulo: ~d~%" (area-triangulo base altura))
    (format t "~%Área del trapecio: ~d~%" (area-trapecio base1 base2 altura))
    (format t "~%Volumen del cubo: ~d~%" (volumen-cubo lado))
    (format t "~%Volumen del prisma: ~d~%" (volumen-prisma base altura profundidad))
    (format t "~%Volumen de la esfera: ~f~%" (volumen-esfera radio))
    (format t "~%Volumen del cilindro: ~f~%" (volumen-cilindro radio altura))
    (format t "~%Volumen del cono: ~f~%" (volumen-cono radio altura))))

;; Llamar a la función principal
(calcular-figuras)