
%1.

zeroInit(L) :- L = [C|_], C=0.

%2.

has5([_ | T]) :-
	T = [_ | YS],
	YS = [_ | ZS],
	ZS = [_ | US],
	US = [_ | []].

%3.

hasN(L,N) :- length(L,N).

%4.

potN0(-1,[]).
potN0(N,[C | T]) :-
     	N > -1,
        N1 is N - 1,
	potN0(N1,T),
        C is 2 ^ N.

%5.

zipmult([],[],[]).
zipmult([X|XS],[Y|YS],[Z|ZS]) :-
	zipmult(XS,YS,ZS),
 	Z is X * Y.

%6.

potencias(N,L) :- aux(N,N,L).	

aux(_,0,[]).
aux(N,N1,L) :-
        N1 >0,
	L=[C|T],
	X is N - N1,	
	N2 is N1 - 1,
	aux(N,N2,T), 
	C is 2 ^ X.

%7.

positivos([],[]).
positivos([X|XS],L2) :- 
	L2=[Y|YS],
	X>0,
	Y = X,
	positivos(XS,YS);
	positivos(XS,L2).

%8.

mesmaPosicao(A,[X|XS],[Y|YS]) :-
	A=X,
	X=Y;
	mesmaPosicao(A,XS,YS).

%9.

comissao(NP,L1,L2) :-
       length(L1,A),
       NP<A,
       auxCom(NP,L1,L2).

auxCom(0,[],[]).
auxCom(NP,[X|XS],L2) :-
	NP>0,
	L2=[Y|YS],
	X = Y,
        N1 is NP -1,
	auxCom(N1,XS,YS);
	auxCom(NP,XS,L2).

%10.

azulejos(NA,NQ) :- N = 0,auxAzu(NA,N,NQ).

auxAzu(1,NQ,X) :- X is NQ + 1.
auxAzu(0,NQ,NQ).		
auxAzu(NA,N,NQ) :- 
	NA > 1,
	NA > 0,
    	X is floor(sqrt(NA)),
	OP1 is NA - (X ^ 2),
	N1 is N + 1,
	auxAzu(OP1,N1,NQ).

	


