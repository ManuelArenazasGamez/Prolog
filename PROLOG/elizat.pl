

eliza :-
    writeln('Hola, mi nombre es Eliza, tu chatbot experto en medicina y relaciones familiares.'),
    writeln('Por favor ingresa tu consulta en minusculas:'),
    readln(Input),
    procesar_consulta(Input), !.

% Casos para terminar la conversacion
procesar_consulta(Input) :- 
    member(Input, [['adios'], ['adios', '.'], ['hasta', 'luego'], ['nos', 'vemos'], ['chao'], 
                  ['hasta', 'pronto'], ['me', 'voy'], ['cuidate'], ['bye'], ['hasta', 'manana']]),
    writeln('Adios. Espero haberte ayudado. Espero verte pronto.'), !.


procesar_consulta(Input) :-
    (Input == ['quiero', 'un', 'diagnostico'] ; 
     Input == ['necesito', 'un', 'diagnostico'] ;
     Input == ['diagnostico'] ;
     Input == ['diagnosticame']),
    iniciar_diagnostico, !.

procesar_consulta(Input) :-
    (Input == ['tengo', 'sintomas'] ; 
     Input == ['tengo', 'malestar'] ;
     Input == ['me', 'siento', 'mal']),
    writeln('Entiendo que no te sientes bien. Vamos a hacer un diagnostico.'),
    iniciar_diagnostico, !.


procesar_consulta(Input) :-
    (Input == ['quiero', 'consultar', 'familia'] ; 
     Input == ['consulta', 'familiar'] ;
     Input == ['familia'] ;
     Input == ['relaciones', 'familiares']),
    writeln('Vamos a consultar relaciones familiares. Por favor ingresa tu consulta como:'),
    writeln('"X es padre de Y" o "maria es madre de juan":'),
    readln(ConsultaFam),
    procesar_consulta_familiar(ConsultaFam), !.


procesar_consulta(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    readln(Input1),
    procesar_consulta(Input1), !.

% Plantillas de conversacion general
template([hola], ['Hola', '¿','en', 'que', 'puedo', 'ayudarte', '?'], []).
template([hola, _], ['Hola', '¿como', 'estas', '?', '¿','en', 'que', 'puedo', 'ayudarte', '?'], []).
template([como, estas], ['Estoy', 'bien,', 'gracias', 'por', 'preguntar.', '¿Y', 'tu', '?'], []).
template([que, puedes, hacer], ['Puedo', 'ayudarte', 'con:', 'diagnosticos', 'medicos', '(cancer', 'de', 'ovario', 'y', 'hepatitis)', 'y', 'consultas', 'sobre', 'relaciones', 'familiares.'], []).

% Plantilla por defecto
template(_, ['No', 'entendi', 'completamente.', '¿Podrias', 'reformular', 'tu', 'pregunta', 'o', 'decir', '"quiero', 'un', 'diagnostico"', 'o', '"consulta', 'familiar"?'], []).


match([],[]).
match([], _):- true.
match([S|Stim],[I|Input]) :-
    atom(S),
    S == I,
    match(Stim, Input),!.
match([S|Stim],[_|Input]) :-
    \+atom(S),
    match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagLike,
    elizaLikes(Atom, R).
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagDo,
    elizaDoes(Atom, R).
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagIs,
    elizaIs(Atom, R).
replace0([I|Index], Input, N, Resp, R):-
    length(Index, M), M =:= 0,
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1), append(R1, [], R),!.
replace0([I|Index], Input, N, Resp, R):-
    nth0(I, Input, Atom),
    length(Index, M), M > 0,
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R),!.


iniciar_diagnostico :-
    nl, write('=== DIAGNOSTICO MEDICO ==='), nl,
    write('Enfocado en cancer de ovario y hepatitis'), nl, nl,
    
    write('Ingrese su nombre: '), read(Nombre),
    pedir_genero(Genero),
    obtener_region_actualizada(Region),
    obtener_sintomas_actualizados(Sintomas),
    
    nl, write('Analizando sintomas para '), write(Nombre), write('...'), nl, nl,
    
    (tiene_sintoma_alarma(Sintomas, EnfermedadAlarma) ->
        write('¡SINTOMA DE ALARMA DETECTADO!'), nl,
        write('Posible '), write(EnfermedadAlarma), write(' grave.'), nl,
        write('Se recomienda atencion medica inmediata.'), nl, nl,
        explicacion_urgencia(EnfermedadAlarma)
    ;
        true
    ),
    
    (findall(D, diagnosticar_por_genero(Genero, Sintomas, Region, D), Diagnosticos),
     Diagnosticos \= [] ->
        write('DIAGNOSTICOS POSIBLES:'), nl,
        listar_diagnosticos(Diagnosticos)
    ;
        write('No se encontraron diagnosticos compatibles.'), nl,
        explicar_fallo_diagnostico(Genero, Sintomas, Region)
    ),
    
    nl, write('¿Quieres hacer otra consulta médica? (si/no): '), read(Respuesta),
    (Respuesta == si -> iniciar_diagnostico ; eliza).

pedir_genero(Genero) :-
    write('Ingrese su genero (hombre/mujer): '),
    read(Genero),
    (member(Genero, [hombre, mujer]) -> true ;
        (write('Genero no valido. Use "hombre" o "mujer".'), nl,
         pedir_genero(Genero))).

obtener_region_actualizada(Region) :-
    write('Regiones disponibles:'), nl,
    write('Mexico: mexico, michoacan, jalisco, guerrero, veracruz, sinaloa, tabasco, oaxaca, baja_california'), nl,
    write('Colombia: colombia, bogota, amazonas'), nl,
    write('Argentina: argentina, buenos_aires, salta'), nl,
    write('Otras: sonora, chiapas, nayarit'), nl,
    write('Ingrese su region: '), read(Region),
    (region(Region) -> true ; (write('Region no valida.'), nl, fail)).

obtener_sintomas_actualizados(Sintomas) :-
    write('Sintomas reconocidos:'), nl,
    write('Generales: fiebre, cansancio, nauseas, vomito, perdida_peso, perdida_apetito, malestar_general'), nl,
    write('Cancer ovario: dolor_pelvico, distension_abdominal, sangrado_irregular, dolor_abdominal,'), nl,
    write('miccion_frecuente, estrenimiento, saciedad_rapida, dolor_lumbar, cambios_mestruales, sangrado_postmenopausia'), nl,
    write('Hepatitis: ictericia, picazon, orina_oscura, heces_claras, dolor_articulaciones, dolor_muscular, confusion_mental'), nl,
    write('Ingrese sus sintomas como lista (ej. [fiebre,dolor_abdominal]): '), nl,
    read(Sintomas),
    (validar_sintomas(Sintomas) -> true ; (write('Sintomas no validos.'), nl, fail)).

validar_sintomas([]).
validar_sintomas([H|T]) :- sintoma(H), validar_sintomas(T).


procesar_consulta_familiar(Input) :-
    (Input = [X, es, padre, de, Y] -> 
        (padre(X, Y) -> writeln(['Si,', X, 'es padre de', Y]) ; writeln(['No,', X, 'no es padre de', Y]))
    ; Input = [X, es, madre, de, Y] -> 
        (madre(X, Y) -> writeln(['Si,', X, 'es madre de', Y]) ; writeln(['No,', X, 'no es madre de', Y]))
    ; Input = [X, es, abuelo, de, Y] -> 
        (abuelo(X, Y) -> writeln(['Si,', X, 'es abuelo de', Y]) ; writeln(['No,', X, 'no es abuelo de', Y]))
    ; Input = [X, es, abuela, de, Y] -> 
        (abuela(X, Y) -> writeln(['Si,', X, 'es abuela de', Y]) ; writeln(['No,', X, 'no es abuela de', Y]))
    ; Input = [X, es, hermano, de, Y] -> 
        (hermano(X, Y) -> writeln(['Si,', X, 'es hermano de', Y]) ; writeln(['No,', X, 'no es hermano de', Y]))
    ; Input = [X, es, hermana, de, Y] -> 
        (hermana(X, Y) -> writeln(['Si,', X, 'es hermana de', Y]) ; writeln(['No,', X, 'no es hermana de', Y]))
    ; Input = [X, es, tio, de, Y] -> 
        (tio(X, Y) -> writeln(['Si,', X, 'es tio de', Y]) ; writeln(['No,', X, 'no es tio de', Y]))
    ; Input = [X, es, tia, de, Y] -> 
        (tia(X, Y) -> writeln(['Si,', X, 'es tia de', Y]) ; writeln(['No,', X, 'no es tia de', Y]))
    ; Input = [X, es, primo, de, Y] -> 
        (primo(X, Y) -> writeln(['Si,', X, 'es primo de', Y]) ; writeln(['No,', X, 'no es primo de', Y]))
    ; Input = [X, es, prima, de, Y] -> 
        (prima(X, Y) -> writeln(['Si,', X, 'es prima de', Y]) ; writeln(['No,', X, 'no es prima de', Y]))
    ; Input = [X, es, nieto, de, Y] -> 
        (nieto(X, Y) -> writeln(['Si,', X, 'es nieto de', Y]) ; writeln(['No,', X, 'no es nieto de', Y]))
    ; Input = [X, es, nieta, de, Y] -> 
        (nieta(X, Y) -> writeln(['Si,', X, 'es nieta de', Y]) ; writeln(['No,', X, 'no es nieta de', Y]))
    ; Input = [_, es, relacion, de, _] ->  % Corregido: variables anónimas
        writeln('Por favor especifica la relacion (ej. "padre de", "madre de", etc.)')
    ; writeln('Formato no reconocido. Usa "X es relacion de Y" (ej. "juan es padre de pedro")')),
    nl, write('¿Quieres hacer otra consulta familiar? (si/no): '), 
    readln(Respuesta),
    procesar_respuesta_familiar(Respuesta).

procesar_respuesta_familiar(Respuesta) :-
    (Respuesta = [si] ; Respuesta = [si, '.']) ->
        writeln('Ingresa tu consulta familiar:'),
        readln(NuevaConsulta),
        procesar_consulta_familiar(NuevaConsulta)
    ; (Respuesta = [no] ; Respuesta = [no, '.'] ) ->
        eliza
    ; % Si la respuesta no es reconocida
        writeln('Respuesta no reconocida. Volviendo al menu principal.'),
        eliza.





hombre(jose).
hombre(manuel).
hombre(gerardo).
hombre(gonzalo).
hombre(manuelhijo).

mujer(maria).
mujer(arisbet).
mujer(sofia).
mujer(ana).
mujer(lorena).
mujer(luisa).
mujer(sandra).

padre(jose, manuel).
padre(jose, gerardo).
padre(jose, gonzalo).
padre(manuel, sofia).
padre(manuel, manuelhijo).
padre(gonzalo, lorena).
padre(gerardo, ana).

madre(maria, manuel).
madre(maria, gerardo).
madre(maria, gonzalo).
madre(arisbet, sofia).
madre(arisbet, manuelhijo).
madre(luisa, lorena).
madre(sandra, ana).

% Reglas de relaciones familiares
abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
abuela(X, Y) :- madre(X, Z), madre(Z, Y).
nieto(X, Y) :- (abuelo(Y, X); abuela(Y, X)), hombre(X).
nieta(X, Y) :- (abuelo(Y, X); abuela(Y, X)), mujer(X).
hermano(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y, hombre(X).
hermana(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y, mujer(X).
tio(X, Y) :- hermano(X, Z), (padre(Z, Y); madre(Z, Y)).
tia(X, Y) :- hermana(X, Z), (padre(Z, Y); madre(Z, Y)).
primo(X, Y) :- (padre(Z, X); madre(Z, X)), (hermano(Z, W); hermana(Z, W)), (padre(W, Y); madre(W, Y)), hombre(X), X \= Y.
prima(X, Y) :- (padre(Z, X); madre(Z, X)), (hermano(Z, W); hermana(Z, W)), (padre(W, Y); madre(W, Y)), mujer(X), X \= Y.


region(mexico).
region(colombia).
region(argentina).
region(michoacan). 
region(jalisco).
region(nayarit).
region(sonora). 
region(chiapas).
region(guerrero).
region(veracruz).
region(bogota).
region(buenos_aires).
region(sinaloa).
region(tabasco). 
region(oaxaca). 
region(amazonas).
region(salta). 
region(baja_california).

sintoma(fiebre). 
sintoma(dolor_abdominal).
sintoma(cansancio).
sintoma(ictericia). 
sintoma(nauseas).
sintoma(vomito).
sintoma(perdida_peso).
sintoma(dolor_pelvico). 
sintoma(distension_abdominal).
sintoma(sangrado_irregular).
sintoma(picazon).
sintoma(orina_oscura).
sintoma(miccion_frecuente). 
sintoma(estrenimiento).
sintoma(saciedad_rapida). 
sintoma(dolor_lumbar).
sintoma(cambios_mestruales).
sintoma(heces_claras). 
sintoma(dolor_articulaciones).
sintoma(perdida_apetito). 
sintoma(malestar_general).
sintoma(dolor_muscular).
sintoma(sangrado_postmenopausia).
sintoma(confusion_mental).

enfermedad(cancer_de_ovario). 
enfermedad(hepatitis).

% Relaciones sintoma-enfermedad
tiene_sintoma(cancer_de_ovario, dolor_pelvico). 
tiene_sintoma(cancer_de_ovario, distension_abdominal).
tiene_sintoma(cancer_de_ovario, sangrado_irregular). 
tiene_sintoma(cancer_de_ovario, cansancio).
tiene_sintoma(cancer_de_ovario, perdida_peso). 
tiene_sintoma(cancer_de_ovario, dolor_abdominal).
tiene_sintoma(cancer_de_ovario, miccion_frecuente).
tiene_sintoma(cancer_de_ovario, estrenimiento).
tiene_sintoma(cancer_de_ovario, saciedad_rapida).
tiene_sintoma(cancer_de_ovario, dolor_lumbar).
tiene_sintoma(cancer_de_ovario, cambios_mestruales).
tiene_sintoma(cancer_de_ovario, sangrado_postmenopausia).

tiene_sintoma(hepatitis, ictericia). 
tiene_sintoma(hepatitis, fiebre).
tiene_sintoma(hepatitis, nauseas).
tiene_sintoma(hepatitis, vomito). 
tiene_sintoma(hepatitis, cansancio). 
tiene_sintoma(hepatitis, picazon).
tiene_sintoma(hepatitis, orina_oscura).
tiene_sintoma(hepatitis, heces_claras).
tiene_sintoma(hepatitis, dolor_articulaciones).
tiene_sintoma(hepatitis, perdida_apetito).
tiene_sintoma(hepatitis, malestar_general).
tiene_sintoma(hepatitis, dolor_muscular).
tiene_sintoma(hepatitis, confusion_mental).

% Relaciones enfermedad-region
presente_en(cancer_de_ovario, mexico).
presente_en(cancer_de_ovario, colombia).
presente_en(cancer_de_ovario, michoacan). 
presente_en(cancer_de_ovario, jalisco).
presente_en(cancer_de_ovario, guerrero).
presente_en(cancer_de_ovario, veracruz).
presente_en(cancer_de_ovario, bogota).
presente_en(cancer_de_ovario, buenos_aires).
presente_en(cancer_de_ovario, sinaloa).

presente_en(hepatitis, mexico).
presente_en(hepatitis, argentina).
presente_en(hepatitis, sonora).
presente_en(hepatitis, chiapas).
presente_en(hepatitis, tabasco).
presente_en(hepatitis, oaxaca).
presente_en(hepatitis, amazonas).
presente_en(hepatitis, salta).
presente_en(hepatitis, baja_california).


sintoma_clave(cancer_de_ovario, dolor_pelvico).
sintoma_clave(cancer_de_ovario, distension_abdominal).
sintoma_clave(hepatitis, ictericia).
sintoma_clave(hepatitis, orina_oscura).

diagnosticar_por_genero(Genero, Sintomas, Region, Diagnostico) :-
    enfermedad(Diagnostico),
    enfermedad_valida_para_genero(Diagnostico, Genero),
    diagnostico_confiable(Diagnostico, Sintomas, Region). 

diagnostico_confiable(Enfermedad, Sintomas, Region) :-
    sintoma_clave(Enfermedad, SintomaClave),
    member(SintomaClave, Sintomas),
    sintomas_suficientes(Enfermedad, Sintomas, Region).

sintomas_suficientes(Enfermedad, Sintomas, Region) :-
    findall(S, tiene_sintoma(Enfermedad, S), SintomasRequeridos),
    intersection(Sintomas, SintomasRequeridos, Coincidentes),
    length(Coincidentes, N),
    (presente_en(Enfermedad, Region) -> 
        umbral_minimo(Enfermedad, N, baja) 
    ; 
        umbral_minimo(Enfermedad, N, alta)). 

umbral_minimo(cancer_de_ovario, N, baja) :- N >= 3. 
umbral_minimo(cancer_de_ovario, N, alta) :- N >= 4. 
umbral_minimo(hepatitis, N, baja) :- N >= 2.
umbral_minimo(hepatitis, N, alta) :- N >= 3.     

enfermedad_valida_para_genero(cancer_de_ovario, mujer).
enfermedad_valida_para_genero(hepatitis, _).


tiene_sintoma_alarma(Sintomas, cancer_de_ovario) :-
    member(sangrado_postmenopausia, Sintomas).
tiene_sintoma_alarma(Sintomas, hepatitis) :-
    member(confusion_mental, Sintomas).

explicacion_urgencia(cancer_de_ovario) :-
    write('El sangrado postmenopausico requiere evaluacion inmediata'), nl,
    write('para descartar cancer ginecologico avanzado.'), nl.
explicacion_urgencia(hepatitis) :-
    write('La confusion mental puede indicar encefalopatia hepatica,'), nl,
    write('una complicacion grave de la hepatitis.'), nl.

listar_diagnosticos(Diagnosticos) :-
    sort(Diagnosticos, DiagnosticosUnicos),
    listar_diagnosticos_unicos(DiagnosticosUnicos).

listar_diagnosticos_unicos([D|Ds]) :-
    write('- '), write(D),
    (presente_en(D, _) ->  
        write(' (zona de riesgo)')
    ; 
        write(' (zona no endemica)')),
    nl,
    (D = cancer_de_ovario -> explicar_cancer_ovario ;
     D = hepatitis -> explicar_hepatitis),
    listar_diagnosticos_unicos(Ds).

explicar_cancer_ovario :-
    write('RECOMENDACIONES:'), nl,
    write('1. Consultar a un ginecologo oncologo'), nl,
    write('2. Realizar ultrasonido pelvico y marcadores CA-125'), nl,
    write('Zonas de alto riesgo: Guerrero, Veracruz, Sinaloa'), nl,
    write('Factores de riesgo: antecedentes familiares, mutaciones BRCA'), nl, nl.

explicar_hepatitis :-
    write('RECOMENDACIONES:'), nl,
    write('1. Acudir a un hepatologo'), nl,
    write('2. Realizar pruebas de funcion hepatica'), nl,
    write('Zonas endemicas: Tabasco, Amazonas'), nl,
    write('Modos de contagio: agua contaminada, contacto sanguineo'), nl, nl.

explicar_fallo_diagnostico(hombre, Sintomas, _) :-
    (member(dolor_pelvico, Sintomas); member(distension_abdominal, Sintomas)) ->
    write('Nota: Los sintomas ginecologicos no aplican a pacientes masculinos.'), nl;
    true.
explicar_fallo_diagnostico(_, _, _).

likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).

elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].

does(study).
does(cook).
does(work).

elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].

is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].

:- eliza.