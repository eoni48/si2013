(deftemplate user
    (slot nombre)
    (slot tipo)
    (slot dinero)
    (slot so)
    (slot portatil)
    (slot potencia)
    (slot renovable)
    (slot jugar)
    )
(deftemplate componente
    (slot nombre)
    (slot tipo)
    (slot precio)
    (slot marca)
    (slot conexion)
    (slot memoria)
    )
(deftemplate equipo
    (slot procesador)
    (slot placa)
    (slot grafica)
    (slot ram)
    (slot fuente)
    (slot hdd)
    (slot marca)
    (slot precio)
    )
(deffacts inicio
    (user(nombre pepito)(dinero 3000)(so win)(portatil no)(potencia alta)(renovable no)(jugar si))
    (user(nombre grillo)(dinero 1000)(so win)(portatil no)(potencia alta)(renovable si)(jugar si))
    (user(nombre gepeto)(dinero 700)(so win)(portatil no)(potencia media)(renovable si)(jugar si))
    (user(nombre koyi)(dinero 6000)(so win)(portatil si)(potencia alta)(renovable si)(jugar si))
    (user(nombre dolar)(dinero 6000)(so win)(portatil no)(potencia alta)(renovable si)(jugar si))
    
    (equipo (precio 0))
    
    
    ;amd
    (componente(marca asus)(nombre croshair)(precio 220)(tipo placa) (conexion am3p) (memoria 32))
    (componente(marca asus)(nombre sabertooth)(precio 168)(tipo placa) (conexion am3p) (memoria 32))
    
	(componente(marca amd)(nombre 8120)(precio 152)(tipo cpu) (conexion amd3p) (memoria 64))
	(componente(marca amd)(nombre 8350)(precio 183)(tipo cpu) (conexion amd3p) (memoria 64))
    
    
    ;intel
    (componente(marca asus)(nombre rampage)(precio 400)(tipo placa) (conexion 2011) )
	(componente(marca gigabyte)(nombre gax79)(precio 270)(tipo placa) (conexion 2011) )
    
    (componente(marca intel)(nombre i7-3820)(precio 290)(tipo cpu) (conexion 2011) )
     (componente(marca intel)(nombre i7-3930)(precio 540)(tipo cpu) (conexion 2011) )
    (componente(marca intel)(nombre i7-3970x)(precio 1050)(tipo cpu) (conexion 2011) )
    
    ;gpu
    ;ati
    (componente(marca ati)(nombre 7970x2)(precio 1380)(tipo gpu) (conexion pcie3) )
    (componente(marca ati)(nombre 7970)(precio 434)(tipo gpu) (conexion pcie3) )
    (componente(marca ati)(nombre 7950)(precio 314)(tipo gpu) (conexion pcie3) )
    (componente(marca ati)(nombre 7870)(precio 249)(tipo gpu) (conexion pcie3) )
    ;nvidia
    (componente(marca nvidia)(nombre 680)(precio 529)(tipo gpu) (conexion pcie3) )
    (componente(marca nvidia)(nombre 670)(precio 369)(tipo gpu) (conexion pcie3) )
    (componente(marca nvidia)(nombre 660)(precio 205)(tipo gpu) (conexion pcie3) )
    (componente(marca nvidia)(nombre 650)(precio 147)(tipo gpu) (conexion pcie3) )
    
    ;ram
    (componente(marca kingston)(nombre hyperx)(precio 133)(tipo ram) (conexion ddr3) (memoria 16))
    (componente(marca kingston)(nombre hyperx)(precio 295)(tipo ram) (conexion ddr3) (memoria 32))
    (componente(marca kingston)(nombre value)(precio 115)(tipo ram) (conexion ddr3) (memoria 12))
    (componente(marca kingston)(nombre hyperx)(precio 62)(tipo ram) (conexion ddr3) (memoria 8))
    
    ;fuente
    (componente(marca thermaltake)(nombre tp)(precio 248)(tipo fuente))
    (componente(marca thermaltake)(nombre smart)(precio 97)(tipo fuente))
    
    ;hdd
    (componente(marca seagate)(nombre barracuda)(precio 49)(tipo hdd) (conexion sata) (memoria 500))
    (componente(marca seagate)(nombre barracuda)(precio 87)(tipo hdd) (conexion sata) (memoria 1))
    
    (componente(marca intel)(nombre ssd)(precio 195)(tipo hdd) (conexion sata) (memoria 240))
    (componente(marca intel)(nombre ssd)(precio 444)(tipo hdd) (conexion sata) (memoria 300))
    
    
    ;tabla componente-nombre
  
    )