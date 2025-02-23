## Código 1: Recorrer listas en Lisp

```lisp
(defun recorre (lista)  
  (princ (car lista))
  (if lista
      (recorre (cdr lista))))
)

(defun recorra (lista)
  (mapc #'princ (remove-if-not #'evenp lista)))
```

### Descripción:
Este código contiene dos funciones para recorrer y procesar listas en Lisp:
- `recorre(lista)`: Esta función recorre una lista de forma recursiva, imprimiendo cada uno de sus elementos en orden. Se detiene cuando la lista está vacía.
- `recorra(lista)`: Utiliza la función `mapc` para recorrer la lista e imprimir solo los números pares. Para ello, filtra los elementos impares usando `remove-if-not` con la función `evenp` (que verifica si un número es par).

### Uso:
- Si la lista es `(1 2 3 4 5)`, `recorre` imprimirá `1 2 3 4 5`.
- Si la lista es `(1 2 3 4 5)`, `recorra` imprimirá `2 4` porque filtra los números impares.
