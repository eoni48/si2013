%1º granjero,2ºlobo,3ºcabra,4ºcol,5ºbarco
inicial(estado(1,1,1,1)).
objetivo(estado(0,0,0,0)).

peligro(estado(G,L,Cb,_)) :- (L == Cb) ,(G \= L).
peligro(estado(G,_,Cb,Cl)) :-  (Cb == Cl) , (G \= Cb).

%mov der
movimiento(estado(1,1,X,Y),estado(0,0,X,Y),mover(lobo_a_der)) :- \+ peligro(estado(0,0,X,Y)).
movimiento(estado(1,X,1,Y),estado(0,X,0,Y),mover(cabra_a_der)):- \+ peligro(estado(0,X,0,Y)).
movimiento(estado(1,X,Y,1),estado(0,X,Y,0),mover(col_a_der)):- \+ peligro(estado(0,X,Y,0)).
movimiento(estado(1,X,Y,Z),estado(0,X,Y,Z),mover(col_a_der)):- \+ peligro(estado(0,X,Y,Z)).

%mover iz
movimiento(estado(0,0,X,Y),estado(1,1,X,Y),mover(lobo_a_iz)):- \+ peligro(estado(1,1,X,Y)).
movimiento(estado(0,X,0,Y),estado(1,X,1,Y),mover(cabra_a_iz)):- \+ peligro(estado(1,X,1,Y)).
movimiento(estado(0,X,Y,0),estado(1,X,Y,1),mover(col_a_iz)):- \+ peligro(estado(1,X,Y,1)).
movimiento(estado(0,X,Y,Z),estado(1,X,Y,Z),mover(col_a_der)):- \+ peligro(estado(1,X,Y,Z)).



% Encontrar la secuencia de movimientos
puede(Estado,_, []) :- objetivo(Estado).
puede(Estado,Visitados, [Operador|Operadores]) :- movimiento(Estado, Estado2, Operador),\+ member(Estado2, Visitados), puede(Estado2,[Estado2|Visitados], Operadores).

% CONSULTA:
consulta :- inicial(Estado), puede(Estado,[Estado], Operadores),
write('SOLUCION ENCONTRADA sin repeticion de estados: '), nl, write(Operadores).