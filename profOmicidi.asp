
guy(artist). guy(butler). guy(dentist). guy(plumber). guy(solicitor).
victim(cousin). victim(friend). victim(mother). victim(partner). victim(sister).
place(brighton). place(dunoon). place(fishguard). place(grantham). place(halifax).
cause(blackmail). cause(inheritance). cause(love). cause(power). cause(revenge).

murder(X,cousin) | murder(X,friend) | murder(X,mother) | murder(X,partner) | murder(X,sister) :- guy(X).
location(X,brighton) | location(X,dunoon) | location(X,fishguard) | location(X,grantham) | location(X,halifax) :- guy(X).
reason(X,blackmail) | reason(X,inheritance) | reason(X,love) | reason(X,power) | reason(X,revenge) :- guy(X).

% per ciascun omicidio uno ed un solo colpevole, una ed una sola vittima, uno ed un solo luogo, uno ed un solo movente
murdered(V) :- murder(_,V).
:- victim(V), not murdered(V).

placed(P) :- location(_,P).
:- place(P), not placed(P).

moved(M) :- reason(_,M).
:- cause(M), not moved(M).


:- location(butler,brighton).
:- location(plumber,brighton).
:- location(X,brighton), not reason(X,inheritance).


:- location(X,fishguard), reason(X,revenge).
:- location(X,dunoon), reason(X,revenge).

:- murder(artist,partner).
:- murder(X,partner), reason(X,revenge).
:- murder(X,partner), reason(X,power).

murder(dentist,cousin).
location(dentist,halifax).
:- reason(dentist,revenge).
:- reason(dentist,love).

:- location(X,brighton), murder(X,sister).
:- location(X,fishguard), murder(X,sister).
:- location(X,fishguard), reason(X,love).

:- murder(butler,partner).

reason(solicitor,power).
:- murder(solicitor,friend).

