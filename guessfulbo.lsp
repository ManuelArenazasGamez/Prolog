(defparameter *futbolistas*
  '((argentina
     (delantero ((messi (champions t) (mundial t)) (batistuta (champions nil) (mundial nil))))
     (mediocampista ((maradona (champions t) (mundial t)) (riquelme (champions nil) (mundial nil)))))
    (brasil
     (delantero ((ronaldo (champions t) (mundial t)) (neymar (champions t) (mundial nil))))
     (mediocampista ((kaka (champions t) (mundial t)) (ronaldinho (champions t) (mundial t)))))
    (francia
     (delantero ((mbappe (champions t) (mundial t)) (henry (champions t) (mundial t))))
     (mediocampista ((zidane (champions t) (mundial t)) (pogba (champions t) (mundial t)))))
    (portugal
     (delantero ((cristiano (champions t) (mundial nil)) (eusebio (champions nil) (mundial nil))))
     (mediocampista ((figo (champions t) (mundial nil)) (bruno-fernandes (champions nil) (mundial nil)))))))

(defun buscar (clave lista)
  "Busca una clave en la lista y devuelve su valor."
  (cdr (assoc clave lista)))

(defun adivinar-futbolista ()
  "Adivina un futbolista con preguntas interactivas."
  (format t "Selecciona una nacionalidad: ~a~%> " (mapcar #'car *futbolistas*))
  (let ((nacionalidad (read)))
    (let ((posiciones (buscar nacionalidad *futbolistas*)))
      (if posiciones
          (progn
            (format t "Selecciona una posición: ~a~%> " (mapcar #'car posiciones))
            (let ((posicion (read)))
              (let ((jugadores (buscar posicion posiciones)))
                (if jugadores
                    (progn
                      (format t "¿Ganó la Champions? (t/nil): ")
                      (let ((gano-champions (read)))
                        (format t "¿Ganó el Mundial? (t/nil): ")
                        (let ((gano-mundial (read)))
                          (let ((resultado (assoc-if
                                            (lambda (datos)
                                              (and (equal gano-champions (cadr (assoc 'champions (cdr datos))))
                                                   (equal gano-mundial (cadr (assoc 'mundial (cdr datos))))))
                                            jugadores)))
                            (if resultado
                                (format t "El futbolista es: ~a~%" (car resultado))
                                (format t "No se encontró un jugador con esas características.~%"))))))
                    (format t "Posición no encontrada.~%"))))
          (format t "Nacionalidad no encontrada.~%")))))

(adivinar-futbolista)
)