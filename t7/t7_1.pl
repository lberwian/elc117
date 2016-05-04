%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T7_1 - Paradigmas de Programação - Prolog %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*				Combate à Dengue (Iniciação, Nível 2, Fase 1, 2009)

Uma força-tarefa para combater a dengue precisa visitar sete casas em busca de focos do mosquito. As casas
são denominadas F, G, H, L, M, P e T. Deve ser feito um  plano  de  ação  determinando  a  ordem  em  que  as
casas são visitadas. Para isso considera-se as seguintes condições:


*/
% A casa F deve ser uma das tres primeiras a serem visitadas.

regra1(C) :- 
	nth0(Id,C,f),
	Id<3.

% A casa H deve ser visitada imediatamente antes da casa G.

regra2(C) :- nextto(h,g,C).

% A casa L não pode ser a primeira nem a sétima casa a ser visitada.

regra3([C|T]) :- C \= l, not(last(T,l)).

% A casa M deve ser a primeira ou a sétima a ser visitada.

regra4([C|T]) :- C = m; last(T,m).

% A casa P deve ser uma das três últimas a serem visitadas.

regra5(C) :- 
	nth0(Id,C,p),
	Id>3. 

% Regra auxiliar para questão 2, define que T,L,F devem ser visitadas nessa ordem.


emordemTLF(C,X,Y,Z,R) :- 
	nextto(X,Y,C),
	nextto(Y,Z,C),
	nth1(R,C,g).

% Predicado que define as possíveis ordens de visita das casas, seguindo as principais regras.

dengue(C) :-
	C = [_,_,_,_,_,_,_],
	Casas=[f,g,h,l,m,p,t],
	perm(Casas,C),
	regra1(C),
	regra2(C),
	regra3(C),
	regra4(C),
	regra5(C).

perm(List, [H|Perm]) :- delete(H, List, Rest), perm(Rest, Perm).
perm([],[]).
   
delete(X, [X|T], T).
delete(X, [H|T], [H|NT]) :- delete(X, T, NT).


/*

Questão 1.Qual  das  seguintes  operacões  é  uma  lista
completa e correta da ordem que as sete casas devem
ser visitadas?

(A) F, T, H, L, P, G e M.
(B) H, G, F, L, T, P e M.
(C) L, T, F, H G, M e P.
(D) M, F, D, H, L, G e T.
(E) M, L, H, G, F, P e T.

?- dengue([f,t,h,l,p,g,m]).
?- dengue([h,g,f,l,t,p,m]).
?- dengue([l,t,f,h,g,m,p]).
?- dengue([m,f,d,h,l,g,t]).
?- dengue([m,l,h,g,f,p,t]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ?- dengue(X). %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Questão 2.Se em um trecho do percurso visitarmos
as  casas  T,  L  e  F,  exatamente  nesta  ordem,  qual  a
posição que G foi visitada?

(A)Segunda.
(B)Terceira.
(C)Quarta.
(D)Quinta.
(E)Sexta.


?- dengue(A),emordemTLF(A,t,l,f,2).
?- dengue(A),emordemTLF(A,t,l,f,3).
?- dengue(A),emordemTLF(A,t,l,f,4).
?- dengue(A),emordemTLF(A,t,l,f,5).
?- dengue(A),emordemTLF(A,t,l,f,6).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ?- dengue(A),emordemTLF(A,t,l,f,R). %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Questão 3.
Se a casa H é a primeira a ser visitada,
qual a quarta casa a ser visitada?

(A)F.
(B)G.
(C)L.
(D)M.
(E)P.

?- dengue([h,_,_,f,_,_,_]).
?- dengue([h,_,_,g,_,_,_]).
?- dengue([h,_,_,l,_,_,_]).
?- dengue([h,_,_,m,_,_,_]).                            
?- dengue([h,_,_,p,_,_,_]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ?- dengue([h,_,_,X,_,_,_]). %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Questão 4. Se a casa P foi visitada em sexto, a casa
H poderia ser visitada em várias posições exceto:

(A)Primeira.
(B)Segunda.
(C)Terceira.
(D)Quarta.
(E)Quinta.

?- not(dengue([h,_,_,_,_,p,_])).
?- not(dengue([_,h,_,_,_,p,_])).
?- not(dengue([_,_,h,_,_,p,_])).
?- not(dengue([_,_,_,h,_,p,_])).
?- not(dengue([_,_,_,_,h,p,_])).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ? - dengue(A),nth1(6,A,p),nth1(Id,A,h).%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Questão 5.Se exatamente uma casa foi visitada entre
F e P, quais possíveis casas são estas?

(A)G e H.
(B)G e T.
(C)H e M.
(D)L e M.
(E)L e T.

?- dengue([_,_,f,g,p,_,_]),dengue([_,_,f,h,p,_,_]).
?- dengue([_,_,f,g,p,_,_]),dengue([_,_,f,t,p,_,_]).
?- dengue([_,_,f,h,p,_,_]),dengue([_,_,f,m,p,_,_]).
?- dengue([_,_,f,l,p,_,_]),dengue([_,_,f,m,p,_,_]).
?- dengue([_,_,f,l,p,_,_]),dengue([_,_,f,t,p,_,_]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ?- dengue([_,_,f,X,p,_,_]).%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
