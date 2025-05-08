```prolog
% Problema 1: Los guardianes de los templos
% Cuatro guardianes (Apolo, Hécate, Ares y Hermes) custodian templos mitológicos
% asociados con diferentes elementos (fuego, agua, tierra y aire).
% Sabemos que:
% - Apolo no cuida el templo de fuego ni el de tierra.
% - Hécate no cuida el templo de aire.
% - Ares no cuida el templo de agua ni de aire.
% - Hermes cuida el templo de fuego o de agua.
% Pregunta: ¿Qué templo cuida cada guardián?

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
    % Asegurarse de que cada guardián tenga un templo único
    T1 \= T2, T1 \= T3, T1 \= T4,
    T2 \= T3, T2 \= T4,
    T3 \= T4,
    write('Apolo cuida el templo de '), write(T1), nl,
    write('Hécate cuida el templo de '), write(T2), nl,
    write('Ares cuida el templo de '), write(T3), nl,
    write('Hermes cuida el templo de '), write(T4), nl.

% Problema 2: Las armas de los héroes
% Cuatro héroes mitológicos (Aquiles, Perseo, Hércules y Teseo) 
% poseen armas únicas (espada, lanza, arco y escudo). Sabemos que:
% - Aquiles no usa el escudo ni el arco.
% - Perseo no usa la espada.
% - Hércules no usa la lanza ni el escudo.
% - Teseo usa el arco o el escudo.
% Pregunta: ¿Qué arma pertenece a cada héroe?

% Héroes
heroe(aquiles).
heroe(hercules).
heroe(teseo).
heroe(perseo).

% Armas
arma(espada).
arma(lanza).
arma(arco).
arma(escudo).

% Reglas para asignar armas a héroes
usa(aquiles, Arma) :- arma(Arma), Arma \= escudo, Arma \= arco.
usa(hercules, Arma) :- arma(Arma), Arma \= lanza, Arma \= escudo.
usa(teseo, Arma) :- arma(Arma), (Arma = arco ; Arma = escudo).

% Solución: Asignar un arma única a cada héroe
asignar_armas :-
    usa(aquiles, A1),
    usa(hercules, A2),
    usa(teseo, A3),
    usa(perseo, A4),
    % Asegurarse de que cada héroe tenga un arma única
    A1 \= A2, A1 \= A3, A1 \= A4,
    A2 \= A3, A2 \= A4,
    A3 \= A4,
    write('Aquiles usa la '), write(A1), nl,
    write('Hércules usa la '), write(A2), nl,
    write('Teseo usa la '), write(A3), nl,
    write('Perseo usa la '), write(A4), nl.

% Problema 3: Las gemas de los titanes
% Cuatro titanes (Cronos, Océano, Hiperión y Japeto) tienen cada uno una gema 
% (zafiro, rubí, esmeralda y diamante). Sabemos que:
% - Cronos no tiene el zafiro ni el diamante.
% - Océano no tiene el rubí.
% - Hiperión no tiene el zafiro ni el rubí.
% - Japeto tiene el diamante o la esmeralda.
% Pregunta: ¿Qué gema tiene cada titán?

% Titanes
titan(cronos).
titan(oceano).
titan(hiperion).
titan(japeto).

% Gemas
gema(zafiro).
gema(rubi).
gema(esmeralda).
gema(diamante).

% Reglas para asignar gemas a titanes
tiene(cronos, Gema) :- gema(Gema), Gema \= zafiro, Gema \= diamante.
tiene(oceano, Gema) :- gema(Gema), Gema \= rubi.
tiene(hiperion, Gema) :- gema(Gema), Gema \= zafiro, Gema \= rubi.
tiene(japeto, Gema) :- gema(Gema), (Gema = diamante ; Gema = esmeralda).

% Solución: Asignar una gema única a cada titán
asignar_gemas :-
    tiene(cronos, G1),
    tiene(oceano, G2),
    tiene(hiperion, G3),
    tiene(japeto, G4),
    % Asegurarse de que cada titán tenga una gema única
    G1 \= G2, G1 \= G3, G1 \= G4,
    G2 \= G3, G2 \= G4,
    G3 \= G4,
    write('Cronos tiene el '), write(G1), nl,
    write('Océano tiene el '), write(G2), nl,
    write('Hiperión tiene el '), write(G3), nl,
    write('Japeto tiene el '), write(G4), nl.
