## Código 6: Multiplicación y división recursivas

```lisp
(defun multiplicar (a b)
  (if (or (= a 0) (= b 0))
      0
      (+ a (multiplicar a (- b 1)))))

(defun dividir (a b)
  (if (< a b)
      0
      (+ 1 (dividir (- a b) b))))
```

### Descripción:
- `multiplicar(a, b)`: Implementa la multiplicación mediante sumas sucesivas.
- `dividir(a, b)`: Implementa la división mediante restas sucesivas.