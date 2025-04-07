% Definición del predicado concatenar/3 que concatena dos listas.

% Caso base: Si la primera lista es vacía, el resultado de la concatenación
% es simplemente la segunda lista.
concatenar([], L, L).

% Caso recursivo: Si la primera lista no está vacía, se toma la cabeza H
% de la primera lista y se agrega al resultado. Luego, se llama recursivamente
% con la cola T de la primera lista, la segunda lista L, y el resto R.
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).


% a) verificar si un elemento pertenece a una lista
miembro(X, [X|_]).
miembro(X, [_|T]) :- miembro(X, T).
