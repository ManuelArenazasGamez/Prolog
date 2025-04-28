% --- Hechos: Definen las personas y relaciones básicas ---

% Hombres
hombre(juan).
hombre(carlos).
hombre(luis).
hombre(pedro).
hombre(alejandro).
hombre(roberto).
hombre(fernando).
hombre(raul).
hombre(diego).
hombre(eduardo).

% Mujeres
mujer(maria).
mujer(ana).
mujer(luisa).
mujer(sofia).
mujer(diana).
mujer(elena).
mujer(carmen).
mujer(laura).
mujer(paula).
mujer(monica).

% Padre(Hombre, Hijo/Hija)
padre(juan, carlos).
padre(juan, ana).
padre(luis, pedro).
padre(luis, sofia).
padre(carlos, alejandro).
padre(carlos, diana).
padre(fernando, roberto).
padre(fernando, elena).
padre(raul, laura).
padre(raul, carmen).
padre(pedro, diego).
padre(pedro, paula).

% Madre(Mujer, Hijo/Hija)
madre(maria, carlos).
madre(maria, ana).
madre(luisa, pedro).
madre(luisa, sofia).
madre(ana, alejandro).
madre(ana, diana).
madre(sofia, roberto).
madre(sofia, elena).
madre(carmen, laura).
madre(paula, monica).
madre(elena, eduardo).

% Relación de pareja (Padre, Madre)
padrede(juan, maria).
padrede(luis, luisa).
padrede(carlos, ana).
padrede(fernando, sofia).
padrede(raul, carmen).
padrede(pedro, paula).

madrede(maria, juan).
madrede(luisa, luis).
madrede(ana, carlos).
madrede(sofia, fernando).
madrede(carmen, raul).
madrede(paula, pedro).

% --- Reglas: Definen relaciones familiares complejas ---

% Abuelo(X, Y): X es abuelo de Y si X es padre de W y W es padre de Y
abuelo(X, Y) :- padre(X, W), padre(W, Y).

% Abuela(X, Y): X es abuela de Y si X es madre de W y W es madre de Y
abuela(X, Y) :- madrede(X, W), madrede(W, Y).

% Nieto(X, Y): X es nieto de Y si Y es abuelo o abuela de X y X es hombre
nieto(X, Y) :- (abuelo(Y, X); abuela(Y, X)), hombre(X).

% Nieta(X, Y): X es nieta de Y si Y es abuelo o abuela de X y X es mujer
nieta(X, Y) :- (abuelo(Y, X); abuela(Y, X)), mujer(X).

% Hermano(X, Y): X y Y tienen los mismos padres, son diferentes y X es hombre
hermano(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y, hombre(X).

% Hermana(X, Y): X y Y tienen los mismos padres, son diferentes y X es mujer
hermana(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y, mujer(X).

% Tío(X, Y): X es hermano del padre o madre de Y
tio(X, Y) :- (hermano(X, Z), padre(Z, Y)); (hermano(X, Z), madre(Z, Y)).

% Tía(X, Y): X es hermana del padre o madre de Y
tia(X, Y) :- (hermana(X, Z), padre(Z, Y)); (hermana(X, Z), madre(Z, Y)).

% Primo(X, Y): X es hijo de un hermano/hermana del padre/madre de Y y X es hombre
primo(X, Y) :- padre(Z, X), hermano(Z, W), padre(W, Y), hombre(X).
primo(X, Y) :- madre(Z, X), hermana(Z, W), madre(W, Y), hombre(X).

% Prima(X, Y): X es hija de un hermano/hermana del padre/madre de Y y X es mujer
prima(X, Y) :- padre(Z, X), hermano(Z, W), padre(W, Y), mujer(X).
prima(X, Y) :- madre(Z, X), hermana(Z, W), madre(W, Y), mujer(X).

% Sobrino(X, Y): X es hijo de hermano/hermana de Y y X es hombre
sobrino(X, Y) :- (tio(Y, X); tia(Y, X)), hombre(X).

% Sobrina(X, Y): X es hija de hermano/hermana de Y y X es mujer
sobrina(X, Y) :- (tio(Y, X); tia(Y, X)), mujer(X).

% --- Ejemplos de uso: ---

% ¿Quiénes son los nietos de Juan?
% ?- nieto(X, juan).

% ¿Quiénes son las primas de Paula?
% ?- prima(X, paula).

% ¿Quién es tío de Roberto?
% ?- tio(X, roberto).

% ¿Laura tiene hermanos?
% ?- hermano(X, laura).

% --- Descripción del código ---

% Este script en Prolog define una base de conocimiento sobre relaciones familiares.
% Está compuesto por hechos y reglas que permiten inferir relaciones complejas.

% 1. Hechos:
%    - Se definen individuos (hombre/1 y mujer/1) y sus relaciones básicas
%      (padre/2, madre/2, padrede/2, madrede/2).
%    - Los hechos establecen quiénes son los padres, madres y parejas de cada persona.

% 2. Reglas:
%    - Las reglas definen relaciones familiares complejas, como abuelos, nietos,
%      hermanos, tíos, primos, sobrinos, etc.
%    - Estas reglas se basan en los hechos para inferir relaciones indirectas.

% 3. Ejemplos de uso:
%    - Al final del script, se incluyen consultas de ejemplo para demostrar cómo
%      se pueden usar las reglas para obtener información sobre las relaciones familiares.

% Ejemplos de consultas:
%    - nieto(X, juan): Encuentra a los nietos de Juan.
%    - prima(X, paula): Encuentra a las primas de Paula.
%    - tio(X, roberto): Encuentra al tío de Roberto.
%    - hermano(X, laura): Determina si Laura tiene hermanos.

% Este script es útil para modelar y consultar relaciones familiares en un entorno
% lógico como Prolog. Puede extenderse fácilmente para incluir más personas o
% relaciones adicionales.