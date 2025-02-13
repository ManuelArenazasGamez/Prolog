(defun area-cuadrado (lado)
  (* lado lado))

(defun area-rectangulo (base altura)
  (* base altura))

(defun area-circulo (radio)
  (* 3.1416 radio radio))

(defun area-triangulo (base altura)
  (/ (* base altura) 2))

(defun area-trapecio (base1 base2 altura)
  (/ (* (+ base1 base2) altura) 2))

(defun volumen-cubo (lado)
  (expt lado 3))

(defun volumen-prisma (base altura profundidad)
  (* base altura profundidad))

(defun volumen-esfera (radio)
  (* (/ 4 3) 3.1416 (expt radio 3)))

(defun volumen-cilindro (radio altura)
  (* 3.1416 (expt radio 2) altura))

(defun volumen-cono (radio altura)
  (/ (* 3.1416 (expt radio 2) altura) 3))

(defun calcular-figuras ()
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
