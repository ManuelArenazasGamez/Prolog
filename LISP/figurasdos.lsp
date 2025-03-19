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

(defun pedir-dato (mensaje)
  (format t "~a: " mensaje)
  (read))

(defun calcular-area-cuadrado ()
  (let ((lado (pedir-dato "Introduce el valor del lado del cuadrado")))
    (format t "~%Área del cuadrado: ~d~%" (area-cuadrado lado))))

(defun calcular-area-rectangulo ()
  (let ((base (pedir-dato "Introduce el valor de la base del rectángulo"))
        (altura (pedir-dato "Introduce el valor de la altura del rectángulo")))
    (format t "~%Área del rectángulo: ~d~%" (area-rectangulo base altura))))

(defun calcular-area-circulo ()
  (let ((radio (pedir-dato "Introduce el valor del radio del círculo")))
    (format t "~%Área del círculo: ~f~%" (area-circulo radio))))

(defun calcular-area-triangulo ()
  (let ((base (pedir-dato "Introduce el valor de la base del triángulo"))
        (altura (pedir-dato "Introduce el valor de la altura del triángulo")))
    (format t "~%Área del triángulo: ~d~%" (area-triangulo base altura))))

(defun calcular-area-trapecio ()
  (let ((base1 (pedir-dato "Introduce el valor de la base1 del trapecio"))
        (base2 (pedir-dato "Introduce el valor de la base2 del trapecio"))
        (altura (pedir-dato "Introduce el valor de la altura del trapecio")))
    (format t "~%Área del trapecio: ~d~%" (area-trapecio base1 base2 altura))))

(defun calcular-volumen-cubo ()
  (let ((lado (pedir-dato "Introduce el valor del lado del cubo")))
    (format t "~%Volumen del cubo: ~d~%" (volumen-cubo lado))))

(defun calcular-volumen-prisma ()
  (let ((base (pedir-dato "Introduce el valor de la base del prisma"))
        (altura (pedir-dato "Introduce el valor de la altura del prisma"))
        (profundidad (pedir-dato "Introduce el valor de la profundidad del prisma")))
    (format t "~%Volumen del prisma: ~d~%" (volumen-prisma base altura profundidad))))

(defun calcular-volumen-esfera ()
  (let ((radio (pedir-dato "Introduce el valor del radio de la esfera")))
    (format t "~%Volumen de la esfera: ~f~%" (volumen-esfera radio))))

(defun calcular-volumen-cilindro ()
  (let ((radio (pedir-dato "Introduce el valor del radio del cilindro"))
        (altura (pedir-dato "Introduce el valor de la altura del cilindro")))
    (format t "~%Volumen del cilindro: ~f~%" (volumen-cilindro radio altura))))

(defun calcular-volumen-cono ()
  (let ((radio (pedir-dato "Introduce el valor del radio del cono"))
        (altura (pedir-dato "Introduce el valor de la altura del cono")))
    (format t "~%Volumen del cono: ~f~%" (volumen-cono radio altura))))

(defun seleccionar-calculo ()
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
