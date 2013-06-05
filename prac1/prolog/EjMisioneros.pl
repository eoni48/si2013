% Oscar Crespo Salazar y Luis Valero Martin

% Ejercicio 8
% 3 misioneros y 3 canibales.

inicial(estado(3,3,1)).

objetivo(estado(0,0,0)).

peligro(estado(NM,NC,_)) :- (NM < NC), (NM =\= 0).
peligro(estado(NM,NC,_)) :- (NM > NC), (NM =\= 3).

%de uno
% mover un misionero a la derecha.
movimiento(estado(NM,NC,1),estado(NNM,NC,0),unMisioneroDr):- NNM is NM - 1,\+ peligro(estado(NNM,NC,0)),NM > 0.
% mover un misionero a la izquierda.
movimiento(estado(NM,NC,0),estado(NNM,NC,1),unMisioneroIz):- NNM is NM + 1,\+ peligro(estado(NNM,NC,1)),NM < 3.
% mover un canibal a la derecha.
movimiento(estado(NM,NC,1),estado(NM,NNC,0),unCanibalDr):- NNC is NC - 1,\+ peligro(estado(NM,NNC,0)), NC > 0.
% mover un canibal a la izquierda
movimiento(estado(NM,NC,0),estado(NM,NNC,1),unCanibalIz):- NNC is NC + 1,\+ peligro(estado(NM,NNC,1)), NC < 3.
% mover dos misioneros a la derecha
%
% de dos
movimiento(estado(NM,NC,1),estado(NNM,NC,0),dosMisionerosDr):- NNM is NM - 2,\+ peligro(estado(NNM,NC,0)),NM > 1.
% mover dos misioners a la izquierda
movimiento(estado(NM,NC,0),estado(NNM,NC,1),dosMisonerosIz):- NNM is NM + 2,\+ peligro(estado(NNM,NC,1)),NM < 2.
% mover dos canibales a la derecha
movimiento(estado(NM,NC,1),estado(NM,NNC,0),dosCanibalDr):- NNC is NC - 2,\+ peligro(estado(NM,NNC,1)), NC > 1.
% mover dos canibales a la izquierda
movimiento(estado(NM,NC,0),estado(NM,NNC,1),dosCanibalIz):- NNC is NC + 2,\+ peligro(estado(NM,NNC,1)), NC < 2.
% mover un misionero y un canibal
%
% ambos
movimiento(estado(NM,NC,0),estado(NNM,NNC,1),unMisioneroCanibalIz):- NNM is NM + 1, NNC is NC + 1,\+ peligro(estado(NNM,NNC,1)), NM < 3, NC < 3.
% mover un misionero y un canibal
movimiento(estado(NM,NC,1),estado(NNM,NNC,0),unMisioneroCanibalDr):- NNM is NM - 1, NNC is NC - 1,\+ peligro(estado(NNM,NNC,0)), NM > 0, NC > 0.

puede(Estado, Estado,_, []).
puede(EstadoX,EstadoY,Visitados, [Operador|Operadores]) :- movimiento(EstadoX, Estadoi, Operador),
	\+ member(Estadoi,Visitados),puede(Estadoi,EstadoY, [Estadoi|Visitados], Operadores).

consulta :- inicial(Eini),objetivo(Efin), puede(Eini,Efin,[Eini],Camino),
write('SOLUCIÓN ENCONTRADA sin repetición de estados: '), nl, write(Camino).
