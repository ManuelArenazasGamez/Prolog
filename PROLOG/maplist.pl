cuadrado(X, Y):- Y is X * X.

flatten([], []).
flatten([H|T], R) :-
    flatten(H, RH),
    flatten(T, RT),
    append(RH, RT, R).
flatten(X, [X]) :-
    X \= [],
    X \= [_|_].
flatten([1, [2, [3, 4]], 5], R).