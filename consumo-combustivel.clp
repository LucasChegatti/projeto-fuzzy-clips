(defglobal
    ?*g_resultado* = 0
)

(deftemplate Peso
0 1300 kg
    ((leve (z 0 800))
    (medio (700 0)(800 1)(1000 1)(1100 0))
    (pesado (s 1000 1300))
    )
)

(deftemplate Velocidade
0 140 km/h
    ((baixa (z 0 60))
    (media (50 0)(60 1)(90 1)(100 0))
    (alta (s 90 140))
    )
)

(deftemplate Consumo
0 16 km/l 
    ((muito_baixo (z 0 5))
    (baixo (4 0)(6 1)(8 0))
    (medio (7 0)(9 1)(10 0))
    (alto (9 0)(11 1)(14 0))
    (muito_alto (s 13 16))
    )
)

(defrule muito_baixo
    (declare (salience 10))
    (Peso leve)
    (Velocidade baixa)
=>
    (assert (Consumo muito_baixo))
)

(defrule baixo
    (declare (salience 10))
    (or (and (Peso medio) (Velocidade baixa))
        (and (Peso leve) (Velocidade media)) 
    )
=>
    (assert (Consumo baixo))
)

(defrule medio
    (declare (salience 10))
    (or (and (Peso pesado) (Velocidade baixa))
        (and (Peso medio) (Velocidade media)) 
        (and (Peso leve) (Velocidade alta)) 
    )
=>
    (assert (Consumo medio))
)

(defrule alto
    (declare (salience 10))
    (or (and (Peso pesado) (Velocidade media))
        (and (Peso medio) (Velocidade alta)) 
    )
=>
    (assert (Consumo alto))
)

(defrule muito_alto
    (declare (salience 10))
    (Peso pesado)
    (Velocidade alta)
=>
    (assert (Consumo muito_alto))
)

(defrule defuzifica
  (declare (salience 0))
  ?v_tmp <- (Consumo ?)
=>
  (bind ?*g_resultado* (moment-defuzzify ?v_tmp))
  (plot-fuzzy-value t "*" nil nil ?v_tmp)
  (retract ?v_tmp)
  (printout t "Consumo: ")
  (printout t ?*g_resultado* crlf)
  (printout t " >>> FIM <<< " crlf)
)

(deffacts Consumo
  (Peso medio)
  (Velocidade media)
)

