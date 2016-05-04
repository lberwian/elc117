%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T7_1 - Paradigmas de Programação - Prolog %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*	
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

% Regra auxiliar paras as questões 23 e 25, 
% lista de possíveis combinações de nado abaixo da posíção testada de um específico nadador, 
% caso não existir é False.

regraMaisCedoPossivel(C,A,Iv) :-
			nth1(X,C,A),
			X<Iv.

% Regra auxiliar para as questões 22 e 25,
% define que um certo nadador A deve nadar qualquer posição antes de nadador D.

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


perm(List, [H|Perm]) :- delete(H, List, Rest), perm(Rest, Perm).
perm([],[]).
   
delete(X, [X|T], T).
delete(X, [H|T], [H|NT]) :- delete(X, T, NT).


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

?- revezamento(C),regraMaisCedoQue(silvia,julia,C),regraMaisCedoPossivel(C,julia,3).
?- revezamento(C),regraMaisCedoQue(silvia,julia,C),regraMaisCedoPossivel(C,julia,4).
?- revezamento(C),regraMaisCedoQue(silvia,julia,C),regraMaisCedoPossivel(C,julia,5).
?- revezamento(C),regraMaisCedoQue(silvia,julia,C),regraMaisCedoPossivel(C,julia,6).
?- revezamento(C),regraMaisCedoQue(silvia,julia,C),regraMaisCedoPossivel(C,julia,7).

EU SEI QUE PRECISO APENAS FAZER 3 QUESTÕES, MAS VOU DEIXAR ISSO AQUI COMO VERGONHA =(
OS RESULTADOS DAS CONSULTAS DÃO AS RESPOSTAS MAS NÃO TÃO BEM COMO SE ESPERA.

SE FOR O CASO DE SER NECESSÁRIO DESCARTAR QUESTÕES, PODE DESCARTAR ESSA E A 23 TAMBÉM, APESAR DE 
FORNECER A RESPOSTA, NÃO DEVOLVE TRUE COMO SE ESPERA DA PERGUNTA.


*/


	
