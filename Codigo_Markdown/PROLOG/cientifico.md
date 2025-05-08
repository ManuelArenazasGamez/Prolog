# Representación de un Problema de Lógica en Prolog

Este código en Prolog modela un problema clásico de lógica donde hay que determinar la relación entre varios laboratorios con diferentes características (como color, especialidad, equipo y bebida). Es un planteamiento típico para resolver acertijos lógicos con restricciones.

```prolog
% Colores posibles de los laboratorios
color(rojo).
color(azul).
color(verde).
color(blanco).
color(amarillo).
color(naranja).
color(negro).

% Especialidades científicas que se pueden asignar a un laboratorio
especialidad(biologia).
especialidad(fisica).
especialidad(quimica).
especialidad(matematicas).
especialidad(computacion).

% Equipos disponibles en los laboratorios
equipo(microscopio).
equipo(espectrofotometro).
equipo(centrifuga).
equipo(pipeta).
equipo(balanza).
equipo(laptop).
equipo(osciloscopio).

% Bebidas consumidas en cada laboratorio
bebida(te).
bebida(cafe).
bebida(agua).

% Posiciones relativas posibles (aunque aquí no se usan explícitamente)
posicion(izquierda).
posicion(derecha).
posicion(centro).
posicion(primero).

% Hechos conocidos del problema (pistas)
% El laboratorio rojo se dedica a biología
hecho(laboratorio(rojo, biologia, _, _)).

% El laboratorio azul se dedica a física
hecho(laboratorio(azul, fisica, _, _)).

% El laboratorio que se dedica a química tiene un microscopio
hecho(laboratorio(_, quimica, microscopio, _)).

% En el laboratorio verde se toma té
hecho(laboratorio(verde, _, _, te)).

% El laboratorio amarillo tiene una centrífuga
hecho(laboratorio(amarillo, _, centrifuga, _)).

% El laboratorio naranja está relacionado con matemáticas
hecho(laboratorio(naranja, _,matematicas, _, _)).

% En el laboratorio negro se toma agua
hecho(laboratorio(negro, _, _, _, agua)).
