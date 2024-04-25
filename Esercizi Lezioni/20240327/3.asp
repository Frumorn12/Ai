% ==============================================================================
% Esercizio 3. 
% Quattro amici, nonostante generalmente vadano molto d’accordo, hanno gusti 
% completamente diversi riguardo i programmi televisivi preferiti. Infatti, 
% ognuno di loro ha come suo programma preferito un programma diverso da 
% quello degli altri tre amici. Inoltre tali programmi vengono tutti 
% trasmessi in giorni ed orari tra loro differenti.  Scrivere un programma 
% DLV che, utilizzando gli indizi seguenti, individui per ogni amico: il titolo 
% del suo programma preferito, il giorno della settimana e l’orario in cui 
% viene trasmesso.

% Indizi:

% 1.	La serie “CSI” non viene trasmessa di domenica.
% 2.	Il programma “Ulisse”, trasmesso alle 7 di sera, non è quello preferito da Michele.
% 3.	“Stranamore” non è il programma preferito di Alberto.
% 4.	Il programma preferito di Roberto viene trasmesso alle 10 di sera ma non di mercoledì.
% 5.	Il programma trasmesso martedì sera è “XFactor”.
% 6.	Michele non guarda mai la televisione alle 9 di sera, mentre Giorgio non la guarda mai di domenica.
% 7.	“Stranamore” viene trasmesso un’ora dopo rispetto all’orario di inizio del programma preferito di Giorgio, 
%       ma un’ora prima rispetto al programma trasmesso di lunedì.

% Amici:     		Alberto, Giorgio, Michele, Roberto
% Programmi : 	CSI, Stranamore, Ulisse, XFactor
% Giorni:     		domenica, lunedì, martedì, mercoledì
% Orari inizio:    	7, 8, 9, 10 (PM).

% ==============================================================================

preferito(A , csi) | preferito(A , stranamore) | preferito(A , ulisse) | preferito(A , xfactor) :- amico(A).
:- preferito(A1, P) , preferito(A2, P) , A1 != A2 . 
:- preferito(giorgio, stranamore).
:- preferito(alberto, stranamore).

%:- preferito(roberto, P) , not trasmissione(P, G, 10).

trasmissione(P, G, O) :- programma(P) , giorno(G) , orario(O).


% Definizione dei giorni della settimana
giorno(domenica).
giorno(lunedi).
giorno(martedi).
giorno(mercoledi).

% Definizione degli orari di trasmissione
orario(7).
orario(8).
orario(9).
orario(10).

% Definizione dei programmi televisivi
programma(csi).
programma(stranamore).
programma(ulisse).
programma(xfactor).

% Definizione degli amici
amico(alberto).
amico(giorgio).
amico(michele).
amico(roberto).