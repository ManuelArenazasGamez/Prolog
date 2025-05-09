% Síntomas generales (compartidos)  
sintoma(fatiga).  
sintoma(perdida_peso).  
sintoma(nauseas).  

% Síntomas de cáncer de ovario  
sintoma(dolor_pelvico).  
sintoma(distension_abdominal).  
sintoma(saciedad_temprana).  
sintoma(cambio_habitos_urinarios).  

% Síntomas de hepatitis  
sintoma(ictericia).  
sintoma(dolor_abdominal_derecho).  
sintoma(orina_oscura).  
sintoma(heces_claras).  

region(asia).  
region(africa).  
region(america_latina).  
region(europa).  

% Factores de riesgo por región  
factor_riesgo(asia, hepatitis_b).          % Alta prevalencia de Hepatitis B  
factor_riesgo(africa, hepatitis_c).       % Alta prevalencia de Hepatitis C  
factor_riesgo(america_latina, cancer_ovario). % Mayor incidencia en ciertos países  

% Cáncer de ovario  
sintoma_enfermedad(dolor_pelvico, cancer_ovario).  
sintoma_enfermedad(distension_abdominal, cancer_ovario).  
sintoma_enfermedad(saciedad_temprana, cancer_ovario).  

% Hepatitis  
sintoma_enfermedad(ictericia, hepatitis).  
sintoma_enfermedad(dolor_abdominal_derecho, hepatitis).  
sintoma_enfermedad(orina_oscura, hepatitis).  

% Hepatitis es más común en Asia y África  
enfermedad_region(hepatitis, asia).  
enfermedad_region(hepatitis, africa).  

% Cáncer de ovario tiene alta incidencia en América Latina y Europa  
enfermedad_region(cancer_ovario, america_latina).  
enfermedad_region(cancer_ovario, europa).  

% Hepatitis B es más común en Asia  
enfermedad_subtipo_region(hepatitis_b, asia).  

% Hepatitis C es más común en África  
enfermedad_subtipo_region(hepatitis_c, africa).  

% Cáncer de ovario epitelial es más común en Europa  
enfermedad_subtipo_region(epitelial, europa).  