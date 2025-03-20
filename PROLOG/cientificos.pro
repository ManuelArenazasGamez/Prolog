% Colores
color(rojo).
color(azul).
color(verde).
color(blanco).
color(amarillo).
color(naranja).
color(negro).

% Especialidades
especialidad(biologia).
especialidad(fisica).
especialidad(quimica).
especialidad(matematicas).
especialidad(computacion).

% Equipos
equipo(microscopio).
equipo(espectrofotometro).
equipo(centrifuga).
equipo(pipeta).
equipo(balanza).
equipo(laptop).
equipo(osciloscopio).

% Bebidas
bebida(te).
bebida(cafe).
bebida(agua).

% Posiciones
posicion(izquierda).
posicion(derecha).
posicion(centro).
posicion(primero).

hecho(laboratorio(rojo, biologia, _, _)).
hecho(laboratorio(azul, fisica, _, _)).
hecho(laboratorio(_, quimica, microscopio, _)).
hecho(laboratorio(verde, _, _, te)).
hecho(laboratorio(amarillo, _, centrifuga, _)).
hecho(laboratorio(naranja, _,matematicas, _, _)).
hecho(laboratorio(negro, _, _, _, agua)).


