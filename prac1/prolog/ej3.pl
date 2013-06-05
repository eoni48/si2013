%dd(juan, maria, luis, h).
%dd(jose, laura, pilar, m).
%dd(jose, laura, gorka, h).
%dd(juan,laura,pepe,h).
%dd(luis, pilar, miguel, h).

%dd(manuel,lola,dolores,m).
%dd(manuel,lola,oscar,h).

%casados(juan, laura).
%casados(luis, pilar).
%casados(miguel,paula).

%casados(gorka,dolores).
dd(jose,marta,miguel,h).
dd(miguel,laura,patricia,h).

casados(raul,patricia).


progenitor(X,Y):- dd(X,_,Y,_) ; dd(_,X,Y,_).

hermanastro(X,Y):- dd(P1,M1,X,h) , dd(P2,M2,Y,_) , (casados(P1,M2) ; casados(P2,M1)) , P1 \= P2 , M1 \= M2.

ascendiente(X,Y):- progenitor(X,Z), progenitor(Z,Y).
ascendiente(X,Y):- progenitor(Z,Y) , ascendiente(X,Z).

familiar_politico(X,Y):- casados(X,P) , ascendiente(Y,P). 
