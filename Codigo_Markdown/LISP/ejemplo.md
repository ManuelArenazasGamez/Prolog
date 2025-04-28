## Código 3: Cálculo de áreas y volúmenes

```lisp
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
```

### Descripción:
Este código define funciones para calcular áreas y volúmenes de diferentes figuras geométricas:
- `area-cuadrado(lado)`: Calcula el área de un cuadrado.
- `area-rectangulo(base, altura)`: Calcula el área de un rectángulo.
- `area-circulo(radio)`: Calcula el área de un círculo.
- `volumen-cubo(lado)`: Calcula el volumen de un cubo.
- `volumen-cilindro(radio, altura)`: Calcula el volumen de un cilindro.

### Uso:
- `area-cuadrado(4)` devolverá `16`.
- `volumen-esfera(3)` devolverá `113.09`.
