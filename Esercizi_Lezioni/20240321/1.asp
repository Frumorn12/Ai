p(Y) | q(Y) :- g(Y,1).

g(1,2).
g(3,1).
g(3,4).
g(4,1).



% Spiegazione del Codice ASP:

% Il frammento di codice fornito è scritto in Answer Set Programming (ASP).
% L'ASP è un paradigma di programmazione dichiarativo utilizzato per risolvere problemi combinatori.
% Analizziamo il codice e forniamo commenti per spiegare ciascuna parte:

% 1. Definizioni delle Regole:
%    - La prima riga definisce una regola con due letterali: p(Y) e q(Y).
%    - La regola afferma che se g(Y,1) è vero (dove Y è una variabile), allora sia p(Y) che q(Y) sono veri.
%    - Ciò significa che se esiste un fatto g(Y,1), deduciamo che p(Y) e q(Y) sono veri.

% 2. Fatti:
%    - Le righe successive forniscono fatti sul predicato g/2.
%    - Questi fatti specificano relazioni tra il primo argomento (Y) e il secondo argomento (1).
%    - Ad esempio:
%      - g(1,2) indica che esiste una relazione tra 1 e 2.
%      - g(3,1) indica una relazione tra 3 e 1.
%      - g(3,4) indica una relazione tra 3 e 4.
%      - g(4,1) indica una relazione tra 4 e 1.




