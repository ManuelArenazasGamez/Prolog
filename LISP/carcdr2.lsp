(defun recorre (lista) 
 (princ (car lista))
(if lista
      (recorre(cdr lista))
      )
)


(defun recorra (lista)
  (mapc #'princ (removek-if-not #'evenp lista)))
ass