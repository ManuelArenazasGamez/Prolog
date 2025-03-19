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

#Abuelo
abuelo(X, Y) :- padre(X, W), padre(W, Y).

#Abuela
abuela(X, Y) :- madrede(X, W), madrede(W, Y).

# Nieto
nieto(X, Y) :- abuelo(Y, X); abuela(Y, X), hombre(X).

# Nieta
nieta(X, Y) :- abuelo(Y, X); abuela(Y, X), mujer(X).

# Hermano
hermano(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y, hombre(X).

# Hermana
hermana(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y, mujer(X).

# Tío
tio(X, Y) :- hermano(X, Z), padre(Z, Y); hermano(X, Z), madre(Z, Y).

# Tía
tia(X, Y) :- hermana(X, Z), padre(Z, Y); hermana(X, Z), madre(Z, Y).

# Primo
primo(X, Y) :- padre(Z, X), hermano(Z, W), padre(W, Y), hombre(X).
primo(X, Y) :- madre(Z, X), hermana(Z, W), madre(W, Y), hombre(X).

# Prima
prima(X, Y) :- padre(Z, X), hermano(Z, W), padre(W, Y), mujer(X).
prima(X, Y) :- madre(Z, X), hermana(Z, W), madre(W, Y), mujer(X).

# Sobrino
sobrino(X, Y) :- tio(Y, X), hombre(X).
sobrino(X, Y) :- tia(Y, X), hombre(X).

# Sobrina
sobrina(X, Y) :- tio(Y, X), mujer(X).
sobrina(X, Y) :- tia(Y, X), mujer(X).

