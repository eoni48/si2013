% REPRESENTACIÓN DE ESTADOS DEL PROBLEMA:
% estado(PosiciónHorizontalMono,PosiciónVerticalMono,PosiciónCaja,TienePlátano)
%   donde PosiciónHorizontalMono puede ser puerta, centro o ventana
%         PosiciónVerticalMono puede ser suelo o caja
%         TienePlátano puede ser sí o no

% ESTADOS INICIAL Y OBJETIVO:
inicial(estado(puerta, suelo, ventana, no)).

%objetivo(estado(centro, caja, centro, sí)).
objetivo(estado(_, _, _, sí)).

% MOVIMIENTOS: requiere que los movimientos estén en un orden determinado para evitar ciclos
movimiento(estado(centro, caja, centro, no), estado(centro, caja, centro, sí),coge(plátano)).
movimiento(estado(PC, suelo, PC, T), estado(PC, caja, PC, T), sube(caja)).
movimiento(estado(P1, suelo, P1, T), estado(P2, suelo, P2, T), empuja_caja(P1, P2)) :- sitio(P1), sitio(P2), \+(P1 = P2).
movimiento(estado(P1, suelo, PC, T), estado(P2, suelo, PC, T), anda(P1, P2)) :- sitio(P1), sitio(P2), \+(P1 = P2).


% PREDICADOS AUXILIARES:
sitio(ventana).
sitio(centro).
sitio(puerta).


% Encontrar la secuencia de movimientos
puede(Estado, []) :- objetivo(Estado).
puede(Estado, [Operador|Operadores]) :-	movimiento(Estado, Estado2, Operador),puede(Estado2,Operadores).

% CONSULTA:
consulta :-	inicial(Estado), puede(Estado, Operadores),
write('SOLUCIÓN ENCONTRADA: '), nl, write(Operadores).
