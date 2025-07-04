% L’anno prossimo si terranno le elezioni per la carica di sindaco nella ridente cittadina di Pasticci Terme, e il primo cittadino in carica ci tiene ad essere rieletto. Pertanto, intende cogliere l’occasione della prossima festa del santo patrono per accattivarsi le simpatie dei concittadini. Ha quindi nominato un comitato con lo scopo di organizzare la più bella festa del circondario, stanziando la maggior quantità possibile di fondi. Si aiuti il comitato organizzatore a decidere come spendere al meglio questi fondi, tenendo in considerazione tutte le richieste del sindaco e i gusti della cittadinanza.
% •	La festa si sviluppa in 3 serate. Per ciascuna serata deve essere prevista almeno una attrazione per ciascuna delle seguenti categorie: spettacolo, gioco, religione.
% •	È chiaro che una stessa attrazione non dovrà essere ripresentata in due serate diverse, pena una brutta figura.
% •	Ogni serata deve durare almeno 5 e non più di 7 ore.
% • Il budget è stabilito dal sindaco e non può essere superato.
% •	I giovani figli dei gentili elettori preferiscono decisamente le attrattive di carattere giocoso: sarebbe 
%  pertanto preferibile massimizzare il loro numero nei 3 giorni.
% • Tuttavia, essendo la festa del santo patrono il parroco insiste perché il numero di attrattive di carattere religioso sia 
%   superiore a quello di tutte le altre nei 3 giorni. Il peso politico del parroco è superiore a quello dei ragazzini, 
%   pertanto la cosa più importante è accontentare lui.

% MODELLO DEI DATI IN INPUT:

    % budget(X)				            ?	l’ammontare del budget
    % serata(1..3).				        ? 	le tre serate da organizzare
	% attrazione(ID,Tipo,Durata,Costo)  ?	l’insieme delle attrazioni disponibili



budget(100).
serata(1..3).

% base di dati di esempio...
attrazione(processione,religione,2,5).
attrazione(veglia,religione,1,2).
attrazione(musicaSacra,religione,3,6).
attrazione(spiritual,religione,2,15).
attrazione(riffa,gioco,1,10).
attrazione(bingo,gioco,3,5).
attrazione(alberoCuccagna,gioco,1,3).
attrazione(corsaCavalli,gioco,3,30).
attrazione(concerto1,spettacolo,2,5).
attrazione(concerto2,spettacolo,1,10).
attrazione(concerto3,spettacolo,3,25).
attrazione(cabaret1,spettacolo,2,20).

attrazioneSerata(ID,S) | nonAttrazioneSerata(ID,S) :- serata(S), attrazione(ID,_,_,_).

% MODELLO DEI VINCOLI NON WEAK:


%% Non è possibile che la stessa attrazione sia presentata in due serate diverse
:- attrazioneSerata(ID,S1), attrazioneSerata(ID,S2), S1 != S2.


%% Categoria 
categoriaProposta(T,S) :- attrazioneSerata(ID,S), attrazione(ID,T,_,_).
categoria(spettacolo). categoria(gioco). categoria(religione).
:- categoria(T), serata(S), not categoriaProposta(T,S).



%% Non è possibile che la durata di una serata non sia compresa tra 5 e 7 ore
:- serata(S), not 5<=#sum{H,ID : attrazioneSerata(ID,S), attrazione(ID,_,H,_)}<=7.

%% Il budget non può essere superato
:- budget(X), #sum{C,ID : attrazioneSerata(ID,S), attrazione(ID,_,_,C)} > X.


%% MODELLO DEI VINCOLI WEAK : 

%% Dobbiamo mettere come livello piu alto il religioso rispetto a quello giocoso

:~ nonAttrazioneSerata(ID, _) , attrazione(ID, religione,_,_ ). [1@2, ID] 
:~ nonAttrazioneSerata(ID, _) , attrazione(ID, gioco, _ ,_ ). [1@1, ID]


