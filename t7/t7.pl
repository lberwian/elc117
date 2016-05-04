
perm(List, [H|Perm]) :- delete(H, List, Rest), perm(Rest, Perm).
perm([],[]).
   
delete(X, [X|T], T).
delete(X, [H|T], [H|NT]) :- delete(X, T, NT).


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


dengue(A),emordemTLF(A,t,l,f,2).
dengue(A),emordemTLF(A,t,l,f,3).
dengue(A),emordemTLF(A,t,l,f,4).
dengue(A),emordemTLF(A,t,l,f,5).
dengue(A),emordemTLF(A,t,l,f,6).


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

not(dengue([h,_,_,_,_,p,_])).
not(dengue([_,h,_,_,_,p,_])).
not(dengue([_,_,h,_,_,p,_])).
not(dengue([_,_,_,h,_,p,_])).
not(dengue([_,_,_,_,h,p,_])).


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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




			
		Revezamento - OBI 2014(Iniciação, Nível 2, Fase 1)

Oito alunos – Beto, Dulce, Guto, Júlia, Kelly, Neto, Silvia e Vivian decidiram tentar quebrar o recorde
da tradicional prova de revezamento e resistência de natação que acontece todos os anos na escola.
Nessa prova, cada um dos oito competidores da equipe deve nadar mil metros, em estilo livre, na
forma de revezamento: cada nadador cai na piscina para nadar apenas uma vez, um de cada vez. O
objetivo é que todos nadem no menor tempo possível.  Depois de muita discussão, os competidores
decidiram que a ordem em que cairão na piscina deve obedecer às seguintes condições:
*/

% Silvia não nada por último.

regra_1(C) :- not(last(C,silvia)).

% Vivian nada após Júlia e Neto nadarem.

regra_2(C) :- nth0(Ij,C,julia),nth0(In,C,neto),nth0(Iv,C,vivian),Ij<Iv,In<Iv.

% O primeiro a nadar é ou Beto ou Dulce.

regra_3([beto|_]).
regra_3([dulce|_]).

% Guto nada antes de Júlia, com exatamente uma pessoa nadando entre eles

regra_4(C) :- nth0(Id,C,guto),X is Id + 2, nth0(X,C,julia).

% Kelly nada antes de Neto, com exatamente duas pessoas nadando entre eles.

regra_5(C) :- nth0(Id,C,kelly),X is Id + 3, nth0(X,C,neto).

% Regra auxiliar paras as questões 23 e 25, lista de possíveis combinações de nado abaixo da posíção testada de um específico nadador, caso não existir é False.

regraMaisCedoPossivel(_,_,0).
regraMaisCedoPossivel(C,A,Iv) :-
			nth1(X,C,A),
			X<Iv.

% Regra auxiliar para as questões 22 e 25, define que um certo nadador A deve nadar qualquer posição antes de nadador D.

regraMaisCedoQue(A,D,C) :- nth0(Iv,C,A),nth0(Ib,C,D),Iv<Ib.

% Predicado que define as ordens de nado de acordo com as principais regras.

revezamento(C) :-
	C = [_,_,_,_,_,_,_,_],
	Nomes=[beto,dulce,guto,julia,kelly,neto,silvia,vivian],
	perm(Nomes,C),
	regra_1(C),
	regra_2(C),
	regra_3(C),
	regra_4(C),
	regra_5(C).
/*
		
	Questões e Soluções.

Questão 21. Qual  das  seguintes  alternativas  é
uma possível lista completa e correta dos nada-
dores do primeiro para o último?

(A)Dulce, Kelly, Silvia, Guto, Neto, Beto, Júlia, Vivian
(B)Dulce, Silvia, Kelly, Guto, Neto, Júlia, Beto, Vivian
(C)Beto,  Kelly,  Silvia,  Guto,  Neto,  Júlia,  Vivian, Dulce
(D)Beto,  Guto,  Kelly,  Júlia,  Dulce,  Neto,  Vivian, Silvia
(E)Beto,  Silvia,  Dulce,  Kelly,  Vivian,  Guto, Neto, Júlia

?- revezamento([dulce,kelly,silvia,guto,neto,beto,julia,vivian]).
?- revezamento([dulce,silvia,kelly,guto,neto,julia,beto,vivian]).
?- revezamento([beto,kelly,silvia,guto,neto,julia,vivian,dulce]).
?- revezamento([beto,guto,kelly,julia,dulce,neto,vivian,silvia]).
?- revezamento([beto,silvia,dulce,kelly,vivian,guto,neto,julia]).

Questão 22. Se Vivian nada antes de Beto, então
qual dos seguintes pode ser o segundo a nadar?

(A)Silvia
(B)Júlia
(C)Neto
(D)Guto
(E)Dulce

?- revezamento(C),regraMaisCedoQue(vivian,beto,C),nth1(2,C,silvia).
?- revezamento(C),regraMaisCedoQue(vivian,beto,C),nth1(2,C,julia).
?- revezamento(C),regraMaisCedoQue(vivian,beto,C),nth1(2,C,neto).
?- revezamento(C),regraMaisCedoQue(vivian,beto,C),nth1(2,C,guto).
?- revezamento(C),regraMaisCedoQue(vivian,beto,C),nth1(2,C,dulce).

3.

Questão 23.Qual  das  seguintes  alternativas  é
necessariamente verdadeira?

(A)O mais cedo que Vivian pode nadar é em oitavo lugar.
(B)O mais cedo que Júlia  pode nadar é em quinto lugar.
(C)O mais cedo que Kelly pode nadar é em terceiro lugar.
(D)O mais cedo que Silvia pode nadar é em terceiro lugar.
(E)O mais cedo que Neto pode nadar é em quinto lugar.


?- revezamento(C),regraMaisCedoPossivel(C,vivian,8).
?- revezamento(C),regraMaisCedoPossivel(C,julia,5).
?- revezamento(C),regraMaisCedoPossivel(C,kelly,3).
?- revezamento(C),regraMaisCedoPossivel(C,silvia,3).
?- revezamento(C),regraMaisCedoPossivel(C,neto,5).

QUANDO RESULTADO É FALSE A ALTERNATIVA ESTÁ CORRETA, POIS NÃO NÃO EXISTE POSIÇÃO DE NADO MENOR DO QUE A TESTADA.


Questão 24.Guto pode nadar em qualquer das
ordens abaixo, exceto:

(A)sexto lugar
(B)quinto lugar
(C)quarto lugar
(D)terceiro lugar
(E)segundo lugar

?- not(revezamento([_,_,_,_,_,guto,_,_])).
?- not(revezamento([_,_,_,_,guto,_,_,_])).
?- not(revezamento([_,_,_,guto,_,_,_,_])).
?- not(revezamento([_,_,guto,_,_,_,_,_])).
?- not(revezamento([_,guto,_,_,_,_,_,_])).

Questão 25.Se Silvia nada antes de Júlia, então o
mais cedo que Júlia pode nadar é em:

(A)segundo lugar
(B)terceiro lugar
(C)quarto lugar
(D)quinto lugar
(E)sexto lugar

?- revezamento(C),regraMaisCedoQue(silva,julia,C),regraMaisCedoPossivel(C,julia,3).
?- revezamento(C),regraMaisCedoQue(silva,julia,C),regraMaisCedoPossivel(C,julia,4).
?- revezamento(C),regraMaisCedoQue(silva,julia,C),regraMaisCedoPossivel(C,julia,5).
?- revezamento(C),regraMaisCedoQue(silva,julia,C),regraMaisCedoPossivel(C,julia,6).
?- revezamento(C),regraMaisCedoQue(silva,julia,C),regraMaisCedoPossivel(C,julia,7).


*/
