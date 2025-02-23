## Código 4: Cálculo de la serie de Fibonacci

```lisp
(defun fibo(n)
  (if (<= n 1)
      n
      (+ (fibo (- n 1)) (fibo (- n 2)))))
```

### Descripción:
- `fibo(n)`: Calcula el número `n` en la secuencia de Fibonacci de manera recursiva.