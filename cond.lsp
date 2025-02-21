(defun aumento (anios)
 (case anios
 ((> = anios 10)  (+ (* 40000 .10) 40000))
 ((< = anios 10)  (+ (* 40000 .07) 40000))
 ((< = anios 5)  (+ (* 40000 .05) 40000))
 ((< = anios 3)  (+ (* 40000 .03) 40000))
 )
)

(defun peso (libras)
  (cond
    ((> libras 30) "La lavadora no funcionará, demasiado peso.")
    ((>= libras 22) "Nivel máximo, se necesitan 50 litros de agua.")
    ((>= libras 15) "Nivel alto, se necesitan 40 litros de agua.")
    ((>= libras 8) "Nivel medio, se necesitan 30 litros de agua.")
    (t "Nivel mínimo, se necesitan 20 litros de agua.")))

(defun fiesta (edad trae-regalo)
  (cond
    ((< edad 15) "No puedes entrar a la fiesta.")
    ((= edad 15) "Entras totalmente gratis.")
    ((and (> edad 15) trae-regalo) "Puedes entrar a la fiesta.")
    (t "No puedes entrar, necesitas traer un regalo.")))
