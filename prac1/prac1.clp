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
(deffacts inicio
    (user(nombre pepito)(dinero 3000)(so win)(portatil no)(potencia alta)(renovable no)(jugar si))
    (user(nombre grillo)(dinero 1000)(so win)(portatil no)(potencia alta)(renovable si)(jugar si))
    (user(nombre gepeto)(dinero 700)(so win)(portatil no)(potencia media)(renovable si)(jugar si))
    (user(nombre koyi)(dinero 6000)(so win)(portatil si)(potencia alta)(renovable si)(jugar si))
    (user(nombre dolar)(dinero 6000)(so win)(portatil no)(potencia alta)(renovable si)(jugar si))
    
    )