# Variables Primitivas y Exclusivas de CLISP

En CLISP, existen tipos de datos primitivos y algunas características exclusivas del dialecto.

## Tipos de Datos Primitivos en CLISP

1. **Números**  
   - Enteros: `42`, `-7`
   - Flotantes: `3.14`, `-0.001`
   - Racionales: `3/4`, `-5/2`
   - Complejos: `#C(2 3)`, `#C(-1 0.5)`

2. **Símbolos**  
   - Nombres que representan variables o funciones: `'x`, `'my-variable`

3. **Cadenas de Texto**  
   - `"Hola, mundo!"`, `"Lisp"`

4. **Listas**  
   - `'(1 2 3)`, `'(a b c)`

5. **Vectores**  
   - `#(1 2 3)`, `#("a" "b" "c")`

6. **Caracteres**  
   - `#\A`, `#\Space`, `#\λ`

7. **Booleanos**  
   - `T` (verdadero)  
   - `NIL` (falso y lista vacía)

8. **Funciones**  
   - `#'(lambda (x) (+ x 1))` (función anónima)

## Características Exclusivas de CLISP

- **Extensiones de Formato en `FORMAT`**  
  CLISP agrega opciones avanzadas para formateo de cadenas.

- **Soporte Ampliado para Unicode**  
  Permite el uso de caracteres Unicode en cadenas y símbolos.

- **Manejo de Excepciones con `CONDITION`**  
  CLISP proporciona un sistema avanzado de manejo de errores.

- **Memoria y Recolección de Basura Mejorada**  
  Usa un sistema eficiente de administración de memoria.

- **Funciones para I/O Extendidas**  
  Incluye más opciones para manipulación de archivos y flujo de datos.

---

CLISP es una implementación potente con características avanzadas en comparación con otros dialectos de Common Lisp.
