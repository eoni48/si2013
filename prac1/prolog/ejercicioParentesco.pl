% Author: Luis Valero Mart�n , �scar Crespo Salazar
% Date: 03/04/2013
%
dd(juan, maria, rosa, m).
dd(juan, maria, luis, h).
dd(jose, laura, pilar, m).
dd(luis, pilar, miguel, h).

padre(X,Y):- dd(X,_,Y,_).
madre(X,Y):- dd(_,X,Y,_).

hijo(X,Y):- dd(Y,_,X,h);dd(_,Y,X,h).
hija(X,Y):- dd(Y,_,X,m);dd(_,Y,X,m).

hermano(X,Y):- dd(Z,Q,X,h),dd(Z,Q,Y,_),(X \= Y).
hermana(X,Y):- dd(Z,Q,X,m),dd(Z,Q,Y,_),(X \= Y).

abuelo(X,Y):- padre(X,Z),(padre(Z,Y);madre(Z,Y)).
abuela(X,Y):- madre(X,Z),(padre(Z,Y);madre(Z,Y)).

antepasado(X,Y):- padre(X,Y).
antepasado(X,Y):- madre(X,Y).
antepasado(X,Y):- padre(X,Z), antepasado(Z,Y).
antepasado(X,Y):- madre(X,Z), antepasado(Z,Y).
