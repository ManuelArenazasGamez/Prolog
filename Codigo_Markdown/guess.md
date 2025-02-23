## Código 5: Juego de adivinanza de números

```lisp
(defun guess-my-number ()
  (ash (+ small big) -1))

(defun smaller ()
  (setf big (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf small (1+ (guess-my-number)))
  (guess-my-number))

(defun start-over ()
  (defparameter small 1)
  (defparameter big 100)
  (guess-my-number))
```

### Descripción:
Juego donde la computadora adivina un número entre 1 y 100:
- `guess-my-number()`: Calcula un número en el rango entre `small` y `big`.
- `smaller()`: Ajusta el límite superior.
- `bigger()`: Ajusta el límite inferior.
- `start-over()`: Reinicia los valores.
