;
; Miembros del grupo: Óscar Crespo Salazar y Luis Valero Martín
;

;
; HECHOS
;
; Descendiente directo padre madre nombre Hijo/a m/h hombre/mujer

(deffacts inicio 
	(dd juan maria rosa m)
	(dd juan maria luis h)
	(dd jose laura pilar m)
	(dd luis pilar miguel h))
;
; REGLAS
;
(defrule R-parentesco-hijo
    (dd ?X ?W ?Y h)
    =>
    (assert (padre ?X ?Y))
    (assert (madre ?W ?Y))
    (assert (hijo  ?Y ?X))
    (assert (hijo  ?Y ?W))
    )

(defrule R-parentesto-hija
    (dd ?X ?W ?Y m)
    =>
    (assert (padre ?X ?Y))
    (assert (madre ?W ?Y))
    (assert (hija  ?Y ?X))
    (assert (hija  ?Y ?W))
    )

(defrule R-hermano
    (dd ?X ?Y ?W h)
    (dd ?X ?Y ?E ?)
    (test (neq ?W ?E))
    =>
    (assert (hermano ?W ?E))
    )

(defrule R-hermana
    (dd ?X ?Y ?W m)
    (dd ?X ?Y ?E ?)
    (test (neq ?W ?E))
    =>
    (assert (hermana ?W ?E))
    )

(defrule R-abuelo 
    (dd ?X ? ?Y ?)
    (dd ?W ?E ?H ?)
    (or (test (eq ?Y ?W)) 
    (test (eq ?Y ?E)))
    =>
    (assert (abuelo ?X ?H))
    )

(defrule R-abuela 
    (dd ? ?X ?Y ?)
    (dd ?W ?E ?H ?)
    (or (test (eq ?Y ?W)) 
    (test (eq ?Y ?E)))
    =>
    (assert (abuela ?X ?H))
    )

(reset)
(run)
(facts)