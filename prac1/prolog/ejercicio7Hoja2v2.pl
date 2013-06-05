% REPRESENTACI�N DE ESTADOS DEL PROBLEMA:
% estado(Posici�nHorizontalMono,Posici�nVerticalMono,Posici�nCaja,TienePl�tano)
%   donde Posici�nHorizontalMono puede ser puerta, centro o ventana
%         Posici�nVerticalMono puede ser suelo o caja
%         TienePl�tano puede ser s� o no

% ESTADOS INICIAL Y OBJETIVO:
inicial(estado(puerta, suelo, ventana, no)).

%objetivo(estado(centro, caja, centro, s�)).
objetivo(estado(_, _, _, si)).

% MOVIMIENTOS:
movimiento(estado(P1, suelo, PC, T), estado(P2, suelo, PC, T), anda(P1, P2)) :- sitio(P1), sitio(P2), \+(P1 = P2).
movimiento(estado(P1, suelo, P1, T), estado(P2, suelo, P2, T), empuja_caja(P1, P2)) :- sitio(P1), sitio(P2), \+(P1 = P2).
movimiento(estado(PC, suelo, PC, T), estado(PC, caja, PC, T), sube(caja)).
movimiento(estado(centro, caja, centro, no), estado(centro, caja, centro, si),coge(platano)).




% PREDICADOS AUXILIARES:
sitio(ventana).
sitio(centro).
sitio(puerta).


% Encontrar la secuencia de movimientos
puede(Estado,_, []) :- objetivo(Estado).
puede(Estado,Visitados, [Operador|Operadores]) :- movimiento(Estado, Estado2, Operador),\+ member(Estado2, Visitados), puede(Estado2,[Estado2|Visitados], Operadores).

% CONSULTA:
consulta :- inicial(Estado), puede(Estado,[Estado], Operadores),
write('SOLUCI�N ENCONTRADA sin repetici�n de estados: '), nl, write(Operadores).
