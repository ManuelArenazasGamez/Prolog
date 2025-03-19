
(defparameter *nodes*  '((argentina (
											
									(delantero(messi))		
									(medio(riquelme))		
									(defensa (cuti))))
						 (españa(
									(delantero (villa))		
									(medio(xavi))		
									(defensa(puyol))		
									(portero (dibu))))
						(mexico(
									(delantero (vela))		
									(medio(edson))		
									(defensa(layun))		
									(portero (ochoa))))
						(alemania(
									(delantero (havertz))		
									(medio(musiala))		
									(defensa(ruddiger))		
									(portero (neuer))))
						 ))
(defun recorre (lista)
  (when lista
    (let ((elemento (car lista)))
      (if (atom elemento)
          (format t "Tu personaje es ~a.~%" elemento)  
          (progn
            (format t "Tu personaje es ~a?-%" (car elemento))
            (setq a (read))
            (if (string-equal a "si")
                (recorre (cadr elemento))  
                (recorre (cdr lista))))))))


(defun recor(lista)
  (format t "¿Tu personaje es ~a ?" (caar lista) )
  
  ;(print (car lista))
  (if lista
	  (recor (cdr lista))
	  )
  )
