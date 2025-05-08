# Definición de Predicados en Prolog

Este código contiene dos predicados en Prolog: uno para calcular el cuadrado de un número y otro para "aplanar" una lista, es decir, convertir una lista anidada en una lista plana.

## Calcular el Cuadrado de un Número

El predicado `cuadrado/2` toma un número `X` y calcula su cuadrado, almacenando el resultado en `Y`.

```prolog
cuadrado(X, Y) :- Y is X * X.


```prolog
% Aplanar una Lista en Prolog

% El siguiente código en Prolog define el predicado `flatten/2`, 
% que convierte una lista anidada (una lista que contiene otras listas) 
% en una lista plana (una lista sin sublistas).

% Caso base: Si la lista es vacía, el resultado también es una lista vacía.
flatten([], []).

% Caso recursivo: Si la lista no es vacía, se descompone en su cabeza (primer elemento) 
% y su cola (resto de la lista). Luego se aplica `flatten/2` a la cabeza y a la cola,
% y las listas resultantes se concatenan usando `append/3`.
flatten([H|T], R) :-
    flatten(H, RH),   % Recursión sobre la cabeza (H)
    flatten(T, RT),   % Recursión sobre la cola (T)
    append(RH, RT, R).  % Concatenación de las dos listas resultantes

% Caso base para elementos atómicos: Si el primer elemento no es una lista, 
% simplemente se coloca tal cual en la lista final.
flatten(X, [X]) :-
    X \= [],           % No es una lista vacía
    X \= [_|_].        % No es una lista no vacía (es un elemento atómico)
