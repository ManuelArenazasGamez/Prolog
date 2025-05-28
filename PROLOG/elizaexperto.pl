% ================================
% SISTEMA EXPERTO MEDICO Y FAMILIAR CORREGIDO
% ================================

% -------------------------------
% HECHOS DE FAMILIA 
% -------------------------------
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
% -------------------------------
% REGLAS DE RELACIONES FAMILIARES
% -------------------------------
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

% ================================
% SISTEMA EXPERTO MEDICO 
% ================================

% -------------------------------
% HECHOS MEDICOS 
% -------------------------------
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

% -------------------------------
% REGLAS DE DIAGNOSTICO MEJORADAS
% -------------------------------

% Definición de síntomas clave
sintoma_clave(cancer_de_ovario, dolor_pelvico).
sintoma_clave(cancer_de_ovario, distension_abdominal).
sintoma_clave(hepatitis, ictericia).
sintoma_clave(hepatitis, orina_oscura).

% Diagnóstico principal con validación mejorada
diagnosticar_por_genero(Genero, Sintomas, Region, Diagnostico) :-
    enfermedad(Diagnostico),
    enfermedad_valida_para_genero(Diagnostico, Genero),
    presente_en(Diagnostico, Region),
    diagnostico_confiable(Diagnostico, Sintomas).

% Diagnóstico confiable (requiere síntomas clave)
diagnostico_confiable(Enfermedad, Sintomas) :-
    sintoma_clave(Enfermedad, SintomaClave),
    member(SintomaClave, Sintomas),
    sintomas_suficientes(Enfermedad, Sintomas).

% Verificación de síntomas suficientes
sintomas_suficientes(Enfermedad, Sintomas) :-
    findall(S, tiene_sintoma(Enfermedad, S), SintomasRequeridos),
    intersection(Sintomas, SintomasRequeridos, Coincidentes),
    length(Coincidentes, N),
    umbral_minimo(Enfermedad, N).

% Umbrales mínimos actualizados
umbral_minimo(cancer_de_ovario, N) :- N >= 3. 
umbral_minimo(hepatitis, N) :- N >= 2.       

% Validación por género
enfermedad_valida_para_genero(cancer_de_ovario, mujer).
enfermedad_valida_para_genero(hepatitis, _).



% -------------------------------
% INTERFAZ DE DIAGNOSTICO MEJORADA
% -------------------------------
diagnostico_interactivo :-
    nl, write('=== DIAGNOSTICO MEDICO MEJORADO ==='), nl,
    write('Enfocado en cancer de ovario y hepatitis'), nl, nl,
    
    % Obtener datos del paciente
    write('Ingrese su nombre: '), read(Nombre),
    write('Ingrese su genero (hombre/mujer): '), read(Genero),
    (member(Genero, [hombre, mujer]) -> true ;
        (write('Genero no valido. Use "hombre" o "mujer".'), nl, fail)),
    
    % Obtener región y síntomas actualizados
    obtener_region_actualizada(Region),
    obtener_sintomas_actualizados(Sintomas),
    
    nl, write('Analizando sintomas para '), write(Nombre), write('...'), nl, nl,
    
    % Verificar síntomas de alarma primero
    (tiene_sintoma_alarma(Sintomas, EnfermedadAlarma) ->
        write('¡SINTOMA DE ALARMA DETECTADO!'), nl,
        write('Posible '), write(EnfermedadAlarma), write(' grave.'), nl,
        write('Se recomienda atencion medica inmediata.'), nl, nl,
        explicacion_urgencia(EnfermedadAlarma)
    ;
        true
    ),
    
    % Realizar diagnóstico
    (findall(D, diagnosticar_por_genero(Genero, Sintomas, Region, D), Diagnosticos),
     Diagnosticos \= [] ->
        write('DIAGNOSTICOS POSIBLES:'), nl,
        listar_diagnosticos(Diagnosticos)
    ;
        write('No se encontraron diagnosticos compatibles.'), nl,
        explicar_fallo_diagnostico(Genero, Sintomas, Region)
    ),
    
    nl, write('Presione enter para continuar...'), nl,
    read(_).

% -------------------------------
% FUNCIONES AUXILIARES
% -------------------------------
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

listar_diagnosticos([D|Ds]) :-
    write('- '), write(D), nl,
    (D = cancer_de_ovario -> explicar_cancer_ovario ;
     D = hepatitis -> explicar_hepatitis),
    listar_diagnosticos(Ds).
listar_diagnosticos([]).

explicar_fallo_diagnostico(hombre, Sintomas, _) :-
    (member(dolor_pelvico, Sintomas); member(distension_abdominal, Sintomas)) ->
    write('Nota: Los sintomas ginecologicos no aplican a pacientes masculinos.'), nl;
    true.
explicar_fallo_diagnostico(_, _, _).

% =====================================
% DETECCIÓN Y MANEJO DE URGENCIAS 
% =====================================
tiene_sintoma_alarma(Sintomas, cancer_de_ovario) :-
    member(sangrado_postmenopausia, Sintomas).
tiene_sintoma_alarma(Sintomas, hepatitis) :-
    member(confusion_mental, Sintomas).

% Explicación de urgencias
explicacion_urgencia(cancer_de_ovario) :-
    write('El sangrado postmenopáusico requiere evaluación inmediata'), nl,
    write('para descartar cáncer ginecológico avanzado.'), nl.
explicacion_urgencia(hepatitis) :-
    write('La confusión mental puede indicar encefalopatía hepática,'), nl,
    write('una complicación grave de la hepatitis.'), nl.

% -------------------------------
% EXPLICACIONES 
% -------------------------------
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

% -------------------------------
% INTERFAZ DE CONSULTA FAMILIAR 
% -------------------------------
consultar_familia :-
    nl, write('=== SISTEMA DE RELACIONES FAMILIARES ==='), nl,
    write('Miembros de la familia:'), nl,
    write('Hombres: juan, manuel, pedro, luis'), nl,
    write('Mujeres: maria, ana, sofia'), nl, nl,
    write('Relaciones disponibles:'), nl,
    write('1. padre'), nl,
    write('2. madre'), nl,
    write('3. abuelo'), nl,
    write('4. abuela'), nl,
    write('5. hermano'), nl,
    write('6. hermana'), nl,
    write('7. tio'), nl,
    write('8. tia'), nl,
    write('9. primo'), nl,
    write('10. prima'), nl,
    write('11. nieto'), nl,
    write('12. nieta'), nl,
    write('13. Salir'), nl, nl,
    write('Seleccione una relacion (ejemplo: 1): '),
    read(Opcion),
    procesar_opcion_familia(Opcion).

% Función auxiliar para mostrar resultados
mostrar_resultados(Consulta) :-
    call(Consulta),
    write('Resultado: '), write(Consulta), nl,
    fail.  % Fuerza el backtracking para mostrar todas las soluciones
mostrar_resultados(_) :-
    write('No hay mas resultados.'), nl, nl.

procesar_opcion_familia(1) :-
    write('Consulta padre(X,Y). Ejemplo: padre(juan,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(2) :-
    write('Consulta madre(X,Y). Ejemplo: madre(maria,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(3) :-
    write('Consulta abuelo(X,Y). Ejemplo: abuelo(juan,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(4) :-
    write('Consulta abuela(X,Y). Ejemplo: abuela(maria,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(5) :-
    write('Consulta hermano(X,Y). Ejemplo: hermano(manuel,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(6) :-
    write('Consulta hermana(X,Y). Ejemplo: hermana(ana,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(7) :-
    write('Consulta tio(X,Y). Ejemplo: tio(juan,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(8) :-
    write('Consulta tia(X,Y). Ejemplo: tia(maria,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(9) :-
    write('Consulta primo(X,Y). Ejemplo: primo(pedro,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(10) :-
    write('Consulta prima(X,Y). Ejemplo: prima(sofia,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(11) :-
    write('Consulta nieto(X,Y). Ejemplo: nieto(luis,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(12) :-
    write('Consulta nieta(X,Y). Ejemplo: nieta(sofia,X).'), nl,
    write('Ingresa la consulta: '), read(Consulta),
    mostrar_resultados(Consulta),
    consultar_familia.

procesar_opcion_familia(13) :-
    write('Regresando ...'), nl.

procesar_opcion_familia(_) :-
    write('Opcion no valida. Intenta otra vez.'), nl,
    consultar_familia.

% -------------------------------
% MENU PRINCIPAL
% -------------------------------
inicio :-
    nl, write('=== SISTEMA EXPERTO ==='), nl,
    write('1. Diagnostico medico'), nl,
    write('2. Consultar familia'), nl,
    write('3. Salir'), nl,
    write('Seleccione opcion: '), read(Opcion),
    ejecutar(Opcion).

ejecutar(1) :- diagnostico_interactivo, inicio.
ejecutar(2) :- consultar_familia, inicio.
ejecutar(3) :- write('Adios!'), nl.
ejecutar(_) :- write('Opcion invalida!'), nl, inicio.

:- inicio.