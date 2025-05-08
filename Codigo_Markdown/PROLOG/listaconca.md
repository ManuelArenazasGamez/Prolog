# Definición de Predicados en Prolog

Este código contiene dos predicados: uno para concatenar listas y otro para verificar si un elemento pertenece a una lista.

## Concatenar dos listas

El predicado `concatenar/3` toma tres argumentos: dos listas de entrada y una lista de salida que es el resultado de concatenar las dos primeras listas. Aquí está la definición:

```prolog
% Caso base: Si la primera lista es vacía, el resultado de la concatenación
% es simplemente la segunda lista.
concatenar([], L, L).

% Caso recursivo: Si la primera lista no está vacía, se toma la cabeza H
% de la primera lista y se agrega al resultado. Luego, se llama recursivamente
% con la cola T de la primera lista, la segunda lista L, y el resto R.
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).
