%["abetment", "soldier", "success_crime", "size", "intention", "memberof", "violent", "offence", "publishes_class_traitor", "fight", "in", "public_place", "disturb_the_peace", "assaults", "superior", "deserted", "custody", "husband", "is_ship", "owner", "unknowing", "wears_military_token", "armed", "commanded_to_disperse", "public_servant", "tried_to_suppress_riot", "incite_riot", "incite_violence", "placeOfWorship", "rioting_happened_in", "master", "hired"]

%switch this to get
provide_option :- nl,write('Press 1. for yes anything else for no.'),nl,write('**Note: a fullstop at the end of your input is necessary.'),nl,read(Y),nl,(Y is 1).

%THE_CRIME
abetment(X,Y,Z) :- write('Did '),write(X),write(' abet '),write(Y),write(' in commiting the crime '),write(Z),write("?"),provide_option.
soldier(X) :- write('Is '),write(X),write(' a soldier?'),provide_option.
%THE_CRIME
success_crime(Crime) :- write('Was the crime '),write(Crime),write(' successful?'),provide_option.

%SIZE
size(Assem,Y) :- write('....'),write(X),write('.......................................?'),provide_option.

%THE_CRIME
intention(X,Crime) :- write('Was it the intention of '),write(X),write(' to perform this crime: '),write(Crime),write("?"),provide_option.

memberof(X,Assem) :- write('Was '),write(X),write('a member of the assembly'), write(Assem), write("?"),provide_option.
violent(X) :- write('Was '),write(X),write(' violent?'),provide_option.
offence(X,Crime) :- write('Did '),write(X),write('commit the crime: '),write(Crime),write("?"),provide_option.
publishes_class_traitor(X) :- write('Did '),write(X),write(' publish any imputation that any community of persons cannot bear true faith and allegiance to the Constitution of India or uphold the sovereignty and integrity of India?'),provide_option.

publishes_class_inhuman(X) :- write('Did '),write(X),write(' publish that any community of persons shall be denied or deprived of their rights as citizens of India?'),provide_option.

publishes_class_disharmony(X) :- write('Did '),write(X),write(' publish an assertion, counsel, plea or appeal concerning the obligation of any community of persons that causes or is likely to cause disharmony or feelings of enmity or hatred or ill-will between the community and other persons?'),provide_option.

fight(X,Y) :- write('Were '),write(X),write(" and "),write(Y),write(' fighting?'),provide_option.

in(X) :- write('Did this event take place in '),write(X),write('?'),provide_option.

in(X,Y) :- write('Was '),write(X),write(' in '),write(Y),write(' during the incident?'),provide_option.

public_place(X) :- write('Is '),write(X),write('a public place?'),provide_option.

disturb_the_peace(X,Y) :- write('Did '),write(X), write("and"), write(Y) ,write(' disturb the peace?'),provide_option.

assaults(X,Y) :- write('Did '),write(X),write(' assault '),write(Y),write("?"),provide_option.

superior(X,Y) :- write('Is '),write(X),write(' the superior of '),write(Y),write("?"),provide_option.

deserted(X) :- write('Did '),write(X),write('desert the armed forces?'),provide_option.

custody(X,Y) :- write('Did '),write(X),write(' have '),write(Y), write(" in custody, or harbour "),write(Y),write("?"),provide_option.

husband(X,Y) :- write('Is '),write(X),write(' the husband of '),write(Y),write("?"),provide_option.

is_ship(X) :- write('Is '),write(X),write('a ship?'),provide_option.

owner(X,Y) :- write('Is '),write(X),write('the owner of '),write(Y),write("?"),provide_option.

unknowing(X,Y) :- write('Was '),write(X),write('unknowing of '),write(Y),write("?"),provide_option.

wears_military_token(X) :- write('Did '),write(X),write(' wear a military token?'),provide_option.

armed(X) :- write('Was '),write(X),write('armed or in possesion of a weapon?'),provide_option.

commanded_to_disperse(X) :- write('Was '),write(X),write(' commanded to disperse?'),provide_option.

public_servant(X) :- write('Is '),write(X),write(' a public servant?'),provide_option.

tried_to_suppress_riot(X) :- write('Did '),write(X),write(' try to surpress a riot?'),provide_option.

incite_riot(X,Y) :- write('Did '),write(X),write('try to incite'),write(Y),write("to riot?"),provide_option.

incite_violence(X) :- write('Did '),write(X),write('try to incite violence?'),provide_option.

placeOfWorship(X) :- write('Is '),write(X),write('a place of worship?'),provide_option.

rioting_happened_in(X) :- write('Did rioting happen in '),write(X),write('?'),provide_option.

master(X,Y) :- write('Was '),write(X),write(' the master of '),write(Y),write("?"),provide_option.

hired(X,Y,Assem) :- write('Did '),write(X),write(' try to hire '),write(Y),write(" for "), write(Assem), write("?"),provide_option.


%soldier

death_penalty(X) :- abetment(X,Y, mutiny),soldier(Y),success_crime(mutiny),not(soldier(X)).


death_penalty(X) :- (abetment(X,Y, mutiny);seduce(X,Y)),soldier(Y),not(success_crime(mutiny)),not(soldier(X)).

unlawful(Assem) :- size(Assem,Y),Y >= 5, (intention(Assem,assault);intention(Assem,resist_law);intention(Assem,mischief);intention(Assem,robbery);intention(Assem,abet)).

unlawful_Assem_mem(X) :-  memberof(X, Assem),unlawful(Assem).

rioting(X) :-  violent(Assem),unlawful(Assem),memberof(X,Assem).

offense(Y,Z) :-  unlawful(Assem),memberof(X,Assem),offence(X,Z),memberof(Y,Assem),intention(Assem,Z).

incite_class_hatred(X) :-  publishes_class_traitor(X);publishes_class_inhuman(X);publishes_class_disharmony(X).

affray(X,Y) :-  fight(X,Y),in(X,Z),in(Y,Z),public_place(Z),disturb_the_peace(X,Y).

imprisonment(X,abetment,3,_) :-  abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),not(success_crime(assault)),not(soldier(X)).

imprisonment(X,abetment,7,_) :-  abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),success_crime(assault),not(soldier(X)).

imprisonment(X,abetment,2,_) :-  abetment(X,Y, desertion),soldier(Y),not(soldier(X)).

imprisonment(X,harbor,2,_) :-  soldier(Y),deserted(Y),custody(Y,X),not(husband(X,Y)),not(soldier(X)).

imprisonment(X,negligance,0,500) :-  is_ship(V),owner(X, V),in(Y,V),soldier(Y),deserted(Y),unknowing(X,Y),not(soldier(X)).

imprisonment(X,insubordination,0.5,_) :-  abetment(X,Y, insubordination),soldier(Y),success_crime(insubordination),not(soldier(X)).

imprisonment(X,wearingmilitarytoken,0.25,500) :-  not(soldier(X)),wears_military_token(X).

imprisonment(X,assembling,0.5,_) :-  unlawful_Assem_mem(X),not(armed(X)).

imprisonment(X,assembling,2,_)  :-  unlawful_Assem_mem(X),armed(X).

imprisonment(X,assembling,2,_) :-  unlawful_Assem_mem(X),commanded_to_disperse(Assem).

imprisonment(X,assembling,2,_) :-  rioting(X).

imprisonment(X,assembling,3,_) :-  rioting(X),armed(X).

imprisonment(X,assembling,0.5,_) :-  commanded_to_disperse(Assem),memberof(X, Assem).

imprisonment(X,assembling,0.25,_) :-  (assaults(X,Y);threatens_to_assault(X,Y)),public_servant(Y),tried_to_suppress_riot(Y).

imprisonment(Y,inciting_riot,1,_) :-  rioting(X),incite_riot(Y,X).

imprisonment(Y,inciting_riot,0.5,_) :-  not(rioting(X)),incite_riot(Y,X).

imprisonment(X,inciting,3,_) :-  (incite_hatred(X); incite_violence(X)),not(in(Z)),placeOfWorship(Z).

imprisonment(X,inciting,5,_) :-  (incite_hatred(X); incite_violence(X)),in(Z),placeOfWorship(Z).

imprisonment(X,being_armed,0.5,2000) :-  armed(X),in(X, Assem).

imprisonment(X,incitehatred,0.25,_) :-  incite_class_hatred(X),not(in(Z)),placeOfWorship(Z).

imprisonment(X,incite_hatred,5,_) :-  incite_class_hatred(X),in(Z),placeOfWorship(Z).

imprisonment(X, allow_riot,0,1000) :-  ((unlawful(Assem),in(Assem,Z));(rioting_happened_in(Z),master(X,Z))),intention(X,allow_Assembly).

imprisonment(X,harbouring,0.5,_) :-  custody(Y,X),unlawful_Assem_mem(Y).

imprisonment(X,hired_unlawful,0.5,_) :-  hired(X, Y, unlawful_Assem),not(armed(X)).

imprisonment(X,hired_unlawful,2,_) :-  hired(X, Y, unlawful_Assem),armed(X).

imprisonment(X,affray,0.8333,100) :-  affray(X,Y).

imprisonment(Y,affray,0.8333,100) :-  affray(X,Y).

outcome( :- imprisonment(X,_,_,_), death_penalty(X)
