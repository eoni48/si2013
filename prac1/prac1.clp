
(deftemplate user
    (slot nombre)
    (slot dinero(type NUMBER))
    (slot duracion(type NUMBER))
    (slot juego)
    )
(deftemplate Tabla-juegos-gama
    (slot nombre-juego)
    (slot gama-juego(type NUMBER))
    )

(deftemplate componente
    (slot nombre)
    (slot tipo)
    (slot precio)
    (slot marca)
    (slot conexion)
    (slot memoria)
    (slot renovable)
    (slot gama-juego)
    )
(deftemplate equipo
    (slot procesador (default empty))
    (slot placa (default empty))
    (slot grafica (default empty))
    (slot ram (default empty))
    (slot fuente (default empty))
    (slot hdd (default empty))
    (slot marca (default empty))
    (slot precio (type NUMBER)(default 0))
    )
(deffacts inicio
    ;(user(nombre pepito)(dinero 3000)(so win)(portatil no)(potencia alta)(renovable no)(jugar si))
    (user(nombre grillo)(dinero 2100)(duracion 5)(juego crysis3))
    ;(user(nombre gepeto)(dinero 1200)(so win)(portatil no)(potencia media)(renovable si)(jugar si))
    ;(user(nombre koyi)(dinero 6000)(so win)(portatil si)(potencia alta)(renovable si)(jugar si))
    ;(user(nombre dolar)(dinero 6000)(so win)(portatil no)(potencia alta)(renovable si)(jugar si))
    
    (Tabla-juegos-gama (nombre-juego bf3)(gama-juego 8))
    (Tabla-juegos-gama (nombre-juego sims)(gama-juego 1))
    (Tabla-juegos-gama (nombre-juego crysis3)(gama-juego 10))
    (Tabla-juegos-gama (nombre-juego batman)(gama-juego 5))
    (Tabla-juegos-gama (nombre-juego dota2)(gama-juego 1))
   	
    ;amd
    (componente(marca asus)(nombre asus-sabertooth)(precio 168)(tipo placa) (conexion amd3p) (memoria 32))
    (componente(marca asus)(nombre asus-croshair)(precio 220)(tipo placa) (conexion amd3p) (memoria 32))
    
    
	(componente(marca amd)(nombre amd-8120)(precio 152)(tipo cpu) (conexion amd3p) )
	(componente(marca amd)(nombre amd-8350)(precio 183)(tipo cpu) (conexion amd3p) )
    
    
    ;intel
    (componente(marca asus)(nombre asus-rampage)(precio 400)(tipo placa) (conexion 2011) )
	(componente(marca gigabyte)(nombre gugabyte-gax79)(precio 270)(tipo placa) (conexion 2011) )
    
    (componente(marca intel)(nombre i7-3820)(precio 290)(tipo cpu) (conexion 2011) )
    (componente(marca intel)(nombre i7-3930)(precio 540)(tipo cpu) (conexion 2011) )
    (componente(marca intel)(nombre i7-3970x)(precio 1050)(tipo cpu) (conexion 2011) )
    
    ;gpu
    ;ati
    (componente(marca ati)(nombre ati-7970x2)(precio 1380)(tipo gpu) (conexion pcie3) (gama-juego 10))
    (componente(marca ati)(nombre ati-7970)(precio 434)(tipo gpu) (conexion pcie3) (gama-juego 8))
    (componente(marca ati)(nombre ati-7950)(precio 314)(tipo gpu) (conexion pcie3) (gama-juego 5))
    (componente(marca ati)(nombre ati7870)(precio 249)(tipo gpu) (conexion pcie3) (gama-juego 5))
    ;nvidia
    (componente(marca nvidia)(nombre nvidia-680)(precio 529)(tipo gpu) (conexion pcie3) (gama-juego 8))
    (componente(marca nvidia)(nombre nvidia-670)(precio 369)(tipo gpu) (conexion pcie3) (gama-juego 8))
    (componente(marca nvidia)(nombre nvidia-660)(precio 205)(tipo gpu) (conexion pcie3) (gama-juego 5))
    (componente(marca nvidia)(nombre nvidia-650)(precio 147)(tipo gpu) (conexion pcie3) (gama-juego 1))
    
    ;ram
    (componente(marca kingston)(nombre hyperx-16)(precio 133)(tipo ram) (conexion ddr3) (memoria 16))
    (componente(marca kingston)(nombre hyperx-32)(precio 295)(tipo ram) (conexion ddr3) (memoria 32))
    (componente(marca kingston)(nombre value-12)(precio 115)(tipo ram) (conexion ddr3) (memoria 12))
    (componente(marca kingston)(nombre hyperx-8)(precio 62)(tipo ram) (conexion ddr3) (memoria 8))
    
    ;fuente
    (componente(marca thermaltake)(nombre tp)(precio 248)(tipo fuente))
    (componente(marca thermaltake)(nombre smart)(precio 97)(tipo fuente))
    
    ;hdd
    (componente(marca seagate)(nombre barracuda-500)(precio 49)(tipo hdd) (conexion sata) (memoria 500))
    (componente(marca seagate)(nombre barracuda-1000)(precio 87)(tipo hdd) (conexion sata) (memoria 1000))
    
    (componente(marca intel)(nombre ssd-240)(precio 195)(tipo hdd) (conexion sata) (memoria 240))
    (componente(marca intel)(nombre ssd-300)(precio 444)(tipo hdd) (conexion sata) (memoria 300))
    
    ;tabla componente-nombre

    )

;reglas

(defrule r-gama-juego
    (user (juego ?X))
    (Tabla-juegos-gama (nombre-juego ?X)(gama-juego ?Y))
    =>
    (assert (gama-juego ?Y))
    )

(defrule r-renovable?
    (user (nombre ?) (dinero ?) (duracion ?X))
    (test (>= ?X 5))
    =>
    (assert (marca amd))
    )

(defrule r-renovable?2
    (user (nombre ?) (dinero ?) (duracion ?X))
    (test (> 5 ?X ))
    =>
    (assert (marca todas))
    )


(defrule r-conexion
    (marca amd)
    =>
    (assert (conexion amd3p))
    )

(defrule r-conexion2
    (marca todas)
    =>
    (assert (conexion indiferente))
    )

(defrule add-equipo

 	(conexion ?conexion_placa)
    (test (neq ?conexion_placa indiferente))
    (gama-juego ?gama)
    
    (componente
        (marca ?)
        (nombre ?nom_placa)
        (precio ?precio_placa)
        (tipo placa)
        (conexion ?conexion_placa)
        (memoria ?mem_placa)
        )    
    (componente
        (marca ?)
        (nombre ?nom_cpu)
        (precio ?precio_cpu)
        (tipo cpu)
        (conexion ?conexion_placa)
        ) 
    (componente
        (marca ?)
        (nombre ?nom_gpu)
        (precio ?precio_gpu)
        (tipo gpu)
        (conexion ?conexion_gpu)
        (gama-juego ?gama-juego)
        ) 
    (test (>= ?gama-juego ?gama))
    
    (componente
        (marca ?)
        (nombre ?nom_mem)
        (precio ?precio_mem)
        (tipo ram)
        (memoria ?mem_mem &:(<= ?mem_mem ?mem_placa))
        )
    (componente
        (marca ?)
        (nombre ?nom_fuente)
        (precio ?precio_fuente)
        (tipo fuente)
        
        ) 
    (componente
        (marca ?)
        (nombre ?nom_hdd)
        (precio ?precio_hdd)
        (tipo hdd)
        
        ) 
    (user 
        (dinero ?pres&:(>= ?pres (+ ?precio_placa  ?precio_cpu ?precio_gpu ?precio_mem ?precio_fuente ?precio_hdd)))
        (nombre ?)
        (duracion ?)
     )
        =>
	   (assert 
	        (equipo
	            (fuente ?nom_fuente)
	            (grafica ?nom_gpu)
	            (hdd ?nom_hdd)
	            (placa ?nom_placa)
	            (precio (+ ?precio_placa  ?precio_cpu ?precio_gpu ?precio_mem ?precio_fuente ?precio_hdd))
	            (procesador ?nom_cpu)
	            (ram ?nom_mem)
	      	)
        )
    )

(defrule add-equipo2

 	(conexion indiferente)
    (gama-juego ?gama)
    
    (componente
        (marca ?)
        (nombre ?nom_placa)
        (precio ?precio_placa)
        (tipo placa)
        (conexion ?conexion_placa)
        (memoria ?mem_placa)
        )    
    (componente
        (marca ?)
        (nombre ?nom_cpu)
        (precio ?precio_cpu)
        (tipo cpu)
        (conexion ?conexion_placa)
        ) 
    (componente
        (marca ?)
        (nombre ?nom_gpu)
        (precio ?precio_gpu)
        (tipo gpu)
        (conexion ?conexion_gpu)
        (gama-juego ?gama-juego)
        ) 
    (test (>= ?gama-juego ?gama))
    
    (componente
        (marca ?)
        (nombre ?nom_mem)
        (precio ?precio_mem)
        (tipo ram)
        (memoria ?mem_mem &:(<= ?mem_mem ?mem_placa))
        )
    (componente
        (marca ?)
        (nombre ?nom_fuente)
        (precio ?precio_fuente)
        (tipo fuente)
        
        ) 
    (componente
        (marca ?)
        (nombre ?nom_hdd)
        (precio ?precio_hdd)
        (tipo hdd)
        
        ) 
    (user 
        (dinero ?pres&:(>= ?pres (+ ?precio_placa  ?precio_cpu ?precio_gpu ?precio_mem ?precio_fuente ?precio_hdd)))
        (nombre ?)
        (duracion ?)
     )
        =>
	   (assert 
	        (equipo
	            (fuente ?nom_fuente)
	            (grafica ?nom_gpu)
	            (hdd ?nom_hdd)
	            (placa ?nom_placa)
	            (precio (+ ?precio_placa  ?precio_cpu ?precio_gpu ?precio_mem ?precio_fuente ?precio_hdd))
	            (procesador ?nom_cpu)
	            (ram ?nom_mem)
	      	)
        )
    )

(reset)
(run)
(facts)
