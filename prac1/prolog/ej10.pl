
inicial(estado(1,1,1,h1)).
objetivo(estado(0,0,0,_)).

movimiento(estado(1,X,Y,h1),estado(0,X,Y,h1),aspira(h1)).
movimiento(estado(X,1,Y,h2),estado(X,0,Y,h2),aspira(h2)).
movimiento(estado(X,Y,1,h3),estado(X,Y,0,h3),aspira(h3)).

movimiento(estado(0,X,Y,h1),estado(0,X,Y,h2),mover(h1,h2)):- X \= 0 ; Y \=0.
movimiento(estado(X,0,Y,h2),estado(X,0,Y,h1),mover(h2,h1)):- X \= 0 ; Y \=0.
movimiento(estado(X,0,Y,h2),estado(X,0,Y,h3),mover(h2,h3)):- X \= 0 ; Y \=0.
movimiento(estado(X,Y,0,h3),estado(X,Y,0,h2),mover(h3,h2)):- X \= 0 ; Y \=0.




% Encontrar la secuencia de movimientos
puede(Estado,_, []) :- objetivo(Estado).
puede(Estado,Visitados, [Operador|Operadores]) :- movimiento(Estado, Estado2, Operador),\+ member(Estado2, Visitados), puede(Estado2,[Estado2|Visitados], Operadores).

% CONSULTA:
consulta :- inicial(Estado), puede(Estado,[Estado], Operadores),
write('SOLUCION ENCONTRADA sin repeticion de estados: '), nl, write(Operadores).