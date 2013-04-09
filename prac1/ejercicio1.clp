;
; Miembros del grupo: Óscar Crespo Salazar y Luis Valero Martín
;

;Se deben tomar antihistam�nicos cuando se ha diagnosticado una enfermedad al�rgica.[X]
;Fernerg�n contiene antihistam�nicos.[X]
;Aspirina contiene �cido acetil-salic�lico.[X]
;Clamoxil contiene antibi�tico.[X]
;Hay que tomar antibi�ticos cuando se tiene una enfermedad infecciosa.[X]
;Hay que tomar �cido acetil-salic�lico cuando se tiene fiebre o dolor.[X]
;Si un enfermo es al�rgico a un componente qu�mico nunca debe tomar una medicina que lo contenga.[X]
;Siempre se debe recomendar en primer lugar la medicina m�s espec�fica para la enfermedad del paciente.[X]
;La fiebre del heno es una enfermedad al�rgica.[X]
;La amigdalitis es una enfermedad infecciosa.[X]
;Los s�ntomas de la amigdalitis son dolor de garganta, fiebre y malestar general.[X]
;Los s�ntomas de la fiebre del heno son congesti�n nasal e irritaci�n ocular.[X]

;HECHOS

; plantilla de medicamentos con su componente
(deftemplate Tablamedicamento
    (slot nombreMedicamento)
    (slot componente)
    )

; plantilla de enfermedad con su tipo
(deftemplate Tablaenfermedad
    (slot nombreEnfermedad)
    (slot tipo)
    )

; plantilla de tipo de enfermedad con su componente
(deftemplate Tablatipocomp
    (slot nombreTipoEnfermedad)
    (slot componente)
    )

; hechos iniciales
(deffacts inicio
    ;Sintomas enfermo
    (sintoma fiebre)
    (sintoma dolorGarganta)
    (sintoma malestarGeneral)
    ;(sintoma congestionNasal)
    ;(sintoma irritacionOcular)
    ;(alergico antibiotico)
    ;(alergico antihistaminicos)
    ;(alergico acido-Acetil-salicilico)
    
    ;Tabla de medicamentos/componentes
    (Tablamedicamento (nombreMedicamento Fernergan)(componente antihistaminicos))
    (Tablamedicamento (nombreMedicamento Aspirina)(componente acido-Acetil-salicilico))
    (Tablamedicamento (nombreMedicamento Clamoxil)(componente antibiotico))
    
    ;Tabla tipo enfermedad/componente
    (Tablatipocomp (nombreTipoEnfermedad infecciosa)(componente antibiotico))
    (Tablatipocomp (nombreTipoEnfermedad alergica)(componente antihistaminicos))
    
    
    ;Tabla de enfermedades/tipo
    (Tablaenfermedad (nombreEnfermedad heno)(tipo alergica))
    (Tablaenfermedad (nombreEnfermedad amigdalitis)(tipo infecciosa))
    ;
    )

;REGLAS

; inserta enfermedad amigdalitis
(defrule R-Amigdalitis
    (sintoma fiebre)
    (sintoma dolorGarganta)
    (sintoma malestarGeneral) 
    =>
    (assert (enfermedad amigdalitis))
    )

; inserta enfermedad heno
(defrule R-Heno
    (sintoma congestionNasal)
    (sintoma irritacionOcular) 
    =>
    (assert (enfermedad heno))
    )

; inserta segun la enfermedad el tipo de enfermedad que se tiene
(defrule R-enfermedad-tipo
    (enfermedad ?X)
    (Tablaenfermedad (nombreEnfermedad ?X)(tipo ?Y))
    =>
    (assert (tipoEnfermedad ?Y))
    )

; inserta segun el tipo de enfermedad que se tiene el componente que se debe tomar
(defrule R-tipo-comp (declare (salience 1))
    (tipoEnfermedad ?X)
    (Tablatipocomp (nombreTipoEnfermedad ?X)(componente ?Y))
    =>
    (assert (componente ?Y))
    )

; inserta el componente acido acetil salicilico si no se ha diagnosticado ninguna enfermedad
; y se tienen los sintomas de fiebre o malestar general
(defrule R-comp-sintomas (declare (salience -1))
    (sintoma ?X)
    (test (or (eq ?X fiebre) (eq ?X malestarGeneral)))
    (not (enfermedad ?))
    =>
   	(assert (componente acido-Acetil-salicilico))
    )

; inserta la medicina que se debe tomar segun el componente y si no es alergico a este
(defrule R-medicina
    (componente ?X)
    (Tablamedicamento (nombreMedicamento ?Y)(componente ?X))
    (not (alergico ?X))
    =>
    (assert (medicamento ?Y))
    )

; si no se ha podido recetar ningun medicamento se muestra un mensaje
(defrule R-no-solucion ;(declare (salience -2))
    (not (medicamento ?))
    =>
   	(printout t "No se ha podido encontrar una solucion para su problema, vaya al medico" crlf)
    )

(reset)
(run)
(facts)
