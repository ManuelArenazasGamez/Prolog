/*Problema 1: Los guardianes de los templos
Cuatro guardianes (Apolo, Hécate, Ares y Hermes) custodian templos mitológicos asociados con diferentes elementos (fuego, agua, tierra y aire). Sabemos que:

Apolo no cuida el templo de fuego ni el de tierra.
Hécate no cuida el templo de aire.
Ares no cuida el templo de agua ni de aire.
Hermes cuida el templo de fuego o de agua.
Pregunta: ¿Qué templo cuida cada guardián? */

% Guardianes
guardian(apolo).
guardian(hecate).
guardian(ares).
guardian(hermes).

% Templos
templo(fuego).
templo(agua).
templo(tierra).
templo(aire).

% Reglas para asignar templos a guardianes
cuida(apolo, Templo) :- templo(Templo), Templo \= fuego, Templo \= tierra.
cuida(hecate, Templo) :- templo(Templo), Templo \= aire.
cuida(ares, Templo) :- templo(Templo), Templo \= agua, Templo \= aire.
cuida(hermes, fuego).
cuida(hermes, agua).

% Solución: Asignar un templo único a cada guardián
asignar_templos :-
    cuida(apolo, T1),
    cuida(hecate, T2),
    cuida(ares, T3),
    cuida(hermes, T4),
    % Asegurar que los templos son únicos
    T1 \= T2, T1 \= T3, T1 \= T4,
    T2 \= T3, T2 \= T4,
    T3 \= T4,
    write('Apolo cuida el templo de '), write(T1), nl,
    write('Hécate cuida el templo de '), write(T2), nl,
    write('Ares cuida el templo de '), write(T3), nl,
    write('Hermes cuida el templo de '), write(T4), nl.