% 1. Pertenece.Verificar si un elemento pertenece a una lista dada.
pertenece(X,[X|L]).
pertenece(X,[Y|L]):- pertenece(X,L).


% 2 tamaño de una lisata
size([],0).
size([_|XS],U):- size(XS,T), U is T+1.


%3._Obtener la concatenación de 2 listas dadas..
concatena([], L, L).
concatena([X|L1], L2, [X|L3]) :- concatena(L1, L2, L3).


%4._Eliminar.Verificar si un elemento pertenece a una lista dada.
borrar(_,[ ],[ ]).
borrar(X,[X|C],M) :- ! , borrar(X,C,M).
borrar(X,[Y|L1],[Y|L2]) :- borrar(X,L1,L2).


%5._Agregar un elemento a una lista.
agregar(E,L,[E|L]).
agregar(E,[X|Y],[X|Z]):-agregar(E,Y,Z)


%6SepararUnaListaEn2Listas(pares e impares)
separar([],[],[]).
    separar([X|XS],[X|T1],T2):- X mod 2 =:= 0,separar(XS,T1,T2).
    separar([X|XS],T1,[X|T2]):-separar(XS,T1,T2).

% 7 ascendente: Verifica si una lista se encuentra de manera ascendente.
ascendente([X]).
    ascendente([X1,X2|TAIL]):- X1 =< X2, ascendente([X2|TAIL]).


% 8 descendete: Verifica si una lista se encuentra de manera descendete.
descendente([X]).
    descendente([X1,X2|TAIL]):- X1 >= X2, descendente([X2|TAIL]).


% 9._aplanar(L, A), donde L es en general una lista de listas
% tan compleja en su anidamiento como queramos imaginar, y A es
% la lista que resulta	de reorganizar los elementos contenidos
% en las listas anidadas en un único nivel.
aplanar([],[]).
aplanar([X|R],[X|P]):-atomic(X),aplanar(R,P).
aplanar([X|R],P):-not atomic(X),aplanar(X,P-X),
        aplanar(R,P-R),append(P-X,P-R,P).


% 10 menorHead: Obtener una lista con elementos menores que el elemento HEAD.
menorHead([],[]).
menorHead([_],[]).
menorHead([X1,X2|Tail],[X2|L]):-X1>X2, menorHead([X1|Tail],L).
menorHead([X1,X2|Tail],L):- X1<X2, menorHead([X1|Tail],L).


% 11 mayorHead: Obtener una lista con elementos mayores que el elemento HEAD.
mayorHead([],[]).
mayorHead([_],[]).
mayorHead([X1,X2|Tail],[X2|L]):-X1<X2, mayorHead([X1|Tail],L).
mayorHead([X1,X2|Tail],L):- X1>X2, mayorHead([X1|Tail],L).


% 12._Obtener una lista con los elementos invertidos.
% invertir(L,I), I es la lista que resulta de invertir L
invertir([],[]).
invertir([H|T],L) :- invertir(T,Z), append(Z,[H],L).
