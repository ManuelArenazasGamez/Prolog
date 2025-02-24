(defparameter *futbolistas*
  '((argentina
     (delantero (champions (messi dybala)) (sin-champions (batistuta crespo)))
     (mediocampista (champions (maradona)) (sin-champions (riquelme aimar))))
    (brasil
     (delantero (champions (ronaldo neymar)) (sin-champions (romario bebeto)))
     (mediocampista (champions (kaka ronaldinho)) (sin-champions (rivaldo))))
    (francia
     (delantero (champions (mbappe henry)) (sin-champions (trezeguet)))
     (mediocampista (champions (zidane pogba)) (sin-champions (kante))))
    (portugal
     (delantero (champions (cristiano eusebio)) (sin-champions (rui-patricio)))
     (mediocampista (champions (figo bruno-fernandes)) (sin-champions (bernardo-silva))))))

(defun hacer-pregunta (pregunta)
  (format t "~%~A (s/n): " pregunta)
  (let ((respuesta (read)))
    (eq respuesta 's)))

(defun buscar-jugadores (pais posicion champions?)
  (let* ((pais-info (cdr (assoc pais *futbolistas*)))  
         (posicion-info (cdr (assoc posicion pais-info)))) 
    (if champions?
        (cadr (assoc 'champions posicion-info))  ; Devolver jugadores que ganaron Champions
        (cadr (assoc 'sin-champions posicion-info)))))  ; Devolver jugadores sin Champions

(defun confirmar-jugador (jugadores)
  (dolist (jugador jugadores)
    (format t "~%¿Tu personaje es ~A? (s/n): " jugador)
    (let ((respuesta (read)))
      (if (eq respuesta 's)
          (progn
            (format t "¡Adiviné! El jugador es ~A." jugador)
            (return-from confirmar-jugador))  ; Salir si acierta el jugador
          (format t "Probando con otro jugador...")))))

(defun adivinar-futbolista ()
  (format t "~%¡Bienvenido al Akinator de Futbolistas!~%")

  (let ((pais (cond ((hacer-pregunta "¿Es argentino?") 'argentina)
                    ((hacer-pregunta "¿Es brasileño?") 'brasil)
                    ((hacer-pregunta "¿Es francés?") 'francia)
                    ((hacer-pregunta "¿Es portugués?") 'portugal)
                    (t nil))))  ; Si no se responde sí a ninguno, se pone nil

    (if (not pais)
        (format t "No tengo información sobre ese país.")
        
        (let ((posicion (if (hacer-pregunta "¿Es delantero?") 'delantero 'mediocampista))
              (champions? (hacer-pregunta "¿Ha ganado la Champions?")))  ; Nueva pregunta sobre Champions
          
          (let ((jugadores (buscar-jugadores pais posicion champions?)))
            (if jugadores
                (progn
                  (confirmar-jugador jugadores))  ; Confirmar la respuesta final
                (format t "No encontré coincidencias.")))))))

(adivinar-futbolista)
