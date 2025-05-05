%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% X CASA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5 scrittori hanno pubblicato i loro nuovi romanzi gialli. Un appassionato li ha 
% letti, e vuole rovinarvi la sorpresa facendovi indovinare i finali di ciascuno. 
% I 5 assassini (1 per romanzo) sono: maggiordomo, artista, dentista, idraulico, 
% avvocato. I 5 luoghi (1 per romanzo) sono: Roma, Milano, Falerna, Napoli, 
% Lamezia Terme. Le 5 vittime (1 per romanzo) sono: cugino, amico, madre, partner, 
% sorella. I 5 moventi (1 per romanzo) sono: ricatto, eredità, amore, potere, 
% vendetta. Dovete quindi ricostruire i finali (cioè quale assassino ha ucciso 
% quale vittima, dove lo ha fatto e quale era il movente). Gli indizi che vi 
% fornisce sono i seguenti:

% 1. Né il maggiordomo, né l’idraulico hanno ucciso a Roma. 
% 
% 2. L’omicidio avvenuto a Roma aveva come movente l’eredità. 
% 
% 3. L’omicidio avvenuto per vendetta non è stato perpetrato né a Falerna né a 
% Milano. L’artista non ha ucciso il partner (il quale a sua volta non è stato 
% ucciso né per vendetta né per potere). 
% 
% 4. Il dentista ha ucciso un cugino a Lamezia Terme, ma non per vendetta, né per 
% amore. 
% 
% 5. La sorella non è stata uccisa a Roma, né a Falerna; e la vittima di Falerna 
% non è stata uccisa per amore. Il maggiordomo non ha ucciso la partner. 
% 
% 6. Nel romanzo in cui l’assassino è l’avvocato il  movente è il potere, ma la 
% vittima non è un amico.

%Assassini
assassino(artista). assassino(avvocato). assassino(dentista). assassino(idraulico). assassino(maggiordomo). 
%Luoghi
luogo(roma). luogo(milano). luogo(falerna). luogo(napoli). luogo(lamezia_terme).
%Vittime
vittima(cugino). vittima(amico). vittima(madre). vittima(partner). vittima(sorella).
%Moventi
movente(ricatto). movente(eredita). movente(amore). movente(potere). movente(vendetta).

% X è un assassino che ha ucciso una determinata vittima
omicidio(X,cugino) | omicidio(X,amico) | omicidio(X,madre) | omicidio(X,partner) | omicidio(X,sorella) :- assassino(X). 
% X è un assassinp che ha ucciso in quella c
luogoOmicidio(X,roma) | luogoOmicidio(X,milano) | luogoOmicidio(X,falerna) | luogoOmicidio(X,napoli) | luogoOmicidio(X,lamezia_terme) :- assassino(X).

% X è un assassino che ha ucciso per quel movente
moventeOmicidio(X,ricatto) | moventeOmicidio(X,eredita) | moventeOmicidio(X,amore) | moventeOmicidio(X,potere) | moventeOmicidio(X,vendetta) :- assassino(X).

% per ciascun omicidio, esiste un ed una sola vittima  e un solo carnefice
uccisa(X) :- omicidio(_, X).
:- vittima(X), not uccisa(X). % ogni vittima è stata uccisa 

% per ciascun omicidio, esiste un solo luogo 
zona(X) :- luogoOmicidio(_, X). 
:- luogo(X), not zona(X). % ogni omicidio è avvenuto in un luogo 

% per ciascun omicidio, esiste un solo movente
motivo(X) :- moventeOmicidio(_, X).
:- movente(X), not motivo(X). % ogni omicidio ha un movente 


% Punto 1
% I luoghi di omicidio del maggiordomo e dell'idraulico non sono Roma
:- luogoOmicidio(maggiordomo, roma).
:- luogoOmicidio(idraulico, roma). 

% Punto 2 
% Se esiste un omicidio a Roma, il movente non puo che essere l'eredità, X è l'assassino
:- luogoOmicidio(X, roma), not moventeOmicidio(X, eredita).

% Punto 3
% Se il movente è vendetta, il luogo non può essere Falerna o Milano, X è l'assassino
:- moventeOmicidio(X, vendetta), luogoOmicidio(X, falerna).
:- moventeOmicidio(X, vendetta), luogoOmicidio(X, milano).

%Punto 4
% Il dentista ha ucciso un cugino a Lamezia Terme, ma non per vendetta, né per amore
omicidio(dentista, cugino).
luogoOmicidio(dentista, lamezia_terme). 
:- moventeOmicidio(dentista, vendetta).
:- moventeOmicidio(dentista, amore). 

% Punto 5
% La sorella non è stata uccisa a Roma, né a Falerna; e la vittima di Falerna non è stata uccisa per amore
:- omicidio(X, sorella), luogoOmicidio(X, roma). 
:- omicidio(X, sorella), luogoOmicidio(X, falerna).
:- luogoOmicidio(X, falerna), moventeOmicidio(X, amore). 

% Punto 6
% Nel romanzo in cui l'assassino è l'avvocato il  movente è il potere, 
% ma la vittima non è un amico 

moventeOmicidio(avvocato,potere).
:- omicidio(avvocato, amico). 