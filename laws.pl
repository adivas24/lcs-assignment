%LAWS

always_false(_) :- false.

provide_option :- write('\nEnter 1. for yes anything else for no.\nRemember to put a full-stop at the end.\n'),read(Y),nl,(Y is 1).

mistake_of_fact(X) :- mist_of_fact(X);(write('Is this a case of mistaken fact?'),provide_option,assert(mist_of_fact(X))).
mist_of_fact(X) :- always_false(X).

agreement(X,Y,Z) :- agrmnt(X,Y,Z);(write('Was there an agreement between '),write(X),write(' and '),write(Y),write(' to commit the crime '),write(Z),write('?'),provide_option,assert(agrmnt(X,Y,Z))).
agrmnt(X,_,_) :- always_false(X).

believes_bound_by_law(X) :- bbbl(X);(write('Did '),write(X),write(' believe that he/she was bound by law to do so?'),provide_option,assert(bbbl(X))).
bbbl(X) :- always_false(X).

believes_justified_by_law(X) :- bjbl(X);(write('Did '),write(X),write(' believe that he/she was justified by law to do so?'),provide_option,assert(bjbl(X))).
bjbl(X) :- always_false(X).

judge(X) :- jud(X);(write('Was '),write(X),write(' a judge of the court?'),provide_option,assert(jud(X))).
jud(X) :- always_false(X).

following_judgement(X):- foll_jud(X);(write('Was '),write(X),write(' following the judgement of a court or public servant?'),provide_option,assert(foll_jud(X))).
foll_jud(X) :- always_false(X).

accident(X) :- acc(X);(write('Was this an accident?'),provide_option,assert(acc(X))).
acc(X) :- always_false(X).

misfortune(X) :- misf(X);(write('Would you classify this as a misfortune?'),provide_option,assert(misf(X))).
misf(X) :- always_false(X).

intention(X,Crime) :- inten(X,Crime);(write('Was it the intention of '),write(X),write(' to perform the crime, '),write(Crime),write("?"),provide_option,assert(inten(X,Crime))).
inten(X,_) :- always_false(X).

prevent_harm(X,Z) :- prev_h(X,Z);(write('Was '),write(X),write(' trying to save '),write(Z),write('?'),provide_option,assert(prev_h(X,Z))).
prev_h(X,_) :- always_false(X).

under7(X) :- u7(X);(write('Is '),write(X),write(' under the age of 7?'),provide_option,assert(u7(X))).
u7(X) :- always_false(X).

under12(X) :- u12(X);(write('Is '),write(X),write(' under the age of 12?'),provide_option,assert(u12(X))).
u12(X) :- always_false(X).

under18(X) :- u18(X);(write('Is '),write(X),write(' under the age of 18?'),provide_option,assert(u18(X))).
u18(X) :- always_false(X).

immature(X) :- imm(X);(write('Is '),write(X),write(' not mature enough to comprehend his actions?'),provide_option,assert(imm(X))).
imm(X) :- always_false(X).

harms(X,Y) :- har(X,Y);(write('Did '),write(X),write(' harm '),write(Y),write('?'),provide_option,assert(har(X,Y))).
har(X,_) :- always_false(X).


checkedinsa :- false.
crazy(X) :- (insa(X));(not(checkedinsa),(write('Is '),write(X),write(' clinically insane?'),(provide_option;assert(checkedinsa)),assert(insa(X)))).
insa(X) :- always_false(X).

unknowing(X) :- unkn(X);(write('Was '),write(X),write(' unanware of the consequences?'),provide_option,assert(unkn(X))).
unkn(X) :- always_false(X).

intoxicated_against_will(X):- inx_a(X);(write('Was '),write(X),write(' intoxicated against his/her will?'),provide_option,assert(inx_a(X))).
inx_a(X) :- always_false(X).

intoxicated(X) :- inx(X);(write('Was '),write(X),write(' intoxicated?'),provide_option,assert(inx(X))).
inx(X) :- always_false(X).

fear(Y) :- fer(Y);victim(Y),(write('Was '),write(Y),write(' forced to give consent due to fear?'),provide_option,assert(fer(Y))).
fer(X) :- always_false(X).

consent(Y) :- cons(Y);(lawmustbechecked(4,90),not(fear(Y);mistake_of_fact(Y);under12(Y);crazy(Y);intoxicated(Y)),not(unknowing(Y)),assert(cons(Y))).
cons(X) :- always_false(X).

offence_ind_of_harm(Y) :- oih(Y);(lawmustbechecked(4,91),write('Is '),write(Y),write(' an offense, irrespective of the harm it causes?'),provide_option,assert(oih(Y))).
oih(X) :- always_false(X).

benefit(Y) :- ben(Y);(write('Was the purpose of the act to benefit '),write(Y),write('?'),provide_option,assert(ben(Y))).
ben(X) :- always_false(X).

guardian(X,Y) :- gua(X,Y);(write('Is '),write(X),write(' the guardian of '),write(Y),write('?'),provide_option,assert(gua(X,Y))).
gua(X,_) :- always_false(X).

save_life(Y) :- s_l(Y);(write('Was the purpose of the act to save the life of '),write(Y),write('?'),provide_option,assert(s_l(Y))).
s_l(X) :- always_false(X).

imp_consent(Y) :- icons(Y);(write('Was '),write(Y),write(' incapable of giving consent?'),provide_option,assert(icons(Y))).
icons(X) :- always_false(X).

communicate(X,Z) :- comm(X,Z);(write('Did '),write(X),write(' communicate some information which harmed '),write(Z),write('?'),provide_option,assert(comm(X,Z))).
comm(X,_) :- always_false(X).

murder(X) :- mur(X);(write('Was '),write(X),write(' killed?'),provide_option,assert(mur(X))).
mur(X) :- always_false(X).

death_threat(X) :- d_t(X);(write('Was '),write(X),write(' under threat of death?'),provide_option,assert(d_t(X))).
d_t(X) :- always_false(X).

public_servant(X) :- pub_s(X);(write('Was/Is '),write(X),write(' a public servant?'),provide_option,assert(pub_s(X))).
pub_s(X) :- always_false(X).

rape(X,Y) :- rpe(X,Y);(write('Did '),write(X),write('attempt to rape '),write(Y),write('?'),provide_option,assert(rpe(X,Y))).
rpe(X,_) :- always_false(X).

kidnapping(X,Y) :- k_nap(X,Y);(write('Did '),write(X),write('attempt to kidnap/abduct '),write(Y),write('?'),provide_option,assert(k_nap(X,Y))).
k_nap(X,_) :- always_false(X).

confinement(X,Y) :- conf(X,Y);(write('Did '),write(X),write('attempt to wrongfully confine '),write(Y),write('?'),provide_option,assert(conf(X,Y))).
conf(X,_) :- always_false(X).

acid(X,Y) :- acd(X,Y);(write('Did '),write(X),write('attempt to throw acid on '),write(Y),write('?'),provide_option,assert(acd(X,Y))).
acd(X,_) :- always_false(X).

instigates(X) :- inst(X);(willful(X),(concealment(X,_);misrepresentation(X)),assert(inst(X))).
instigates(X) :- inst(X);(lawmustbechecked(4,107),write('Has '),write(X), write(' instigated anyone to commit the crime?'),provide_option,assert(inst(X))).
inst(X) :- always_false(X).

conspires(X,Y) :- consp(X,Y);(write('Has '),write(X),write(' engaged in a conspiracy with '),write(Y),write(' towards the crime?'),provide_option,assert(consp(X,Y))).
consp(X) :- always_false(X).

willful(X) :- wful(X);(write('Did '), write(X), write(' perform the act of his own will?'),provide_option,assert(wful(X))).
wful(X) :- always_false(X).

concealment(X,Y) :- conc(X,Y);(write('Did '), write(X), write(' conceal facts related to the case?'),provide_option,assert(conc(X,Y))).
conc(X,_) :- always_false(X).

misrepresentation(X) :- misrep(X);(write('Has '), write(X), write(' been involved in misrepresentation?'),provide_option,assert(misrep(X))).
misrep(X) :- always_false(X).

is_a_consequence(P,Z) :- consq(P,Z);(write('Is '), write(P), write(' a consequence of '), write(Z), write('?'),provide_option,assert(consq(P,Z))).
consq(X,_) :- always_false(X).

isPresent(X) :- pres(X);(write('Was '), write(X), write(' present at the scene at the time?'),provide_option,assert(pres(X))).
pres(X) :- always_false(X).

success_crime(Z) :- succ_cr(Z);(write('Was the crime '), write(Z), write(' successful?'),provide_option,assert(succ_cr(Z))).
succ_cr(X) :- always_false(X).

misleads(X,Y,Z) :- mis(X,Y,Z);(write('Has '), write(X), write(' misled '), write(Y), write(' in regards to '), write(Z),write('?'),provide_option,assert(mis(X,Y,Z))).
mis(X,_,_) :- always_false(X).

collect_arms(X, Y) :- coll_arm(X,Y);(write('Has '), write(X), write(' engaged in the collection of arms for the purpose of '), write(Y), write('?'),provide_option,assert(coll_arm(X))).
coll_arm(X,_) :- always_false(X).

spread_hatred(X) :- spr_h(X);(write('Has '), write(X), write(' brought or attempted to bring into hatred or contempt, or excited or attempted to
excite disaffection towards, the Government established by law?'),provide_option,assert(spr_h(X))).
spr_h(X) :- always_false(X).

receive_plundered_property(X) :- rpp(X);(write('Has '), write(X), write(' received any plundered property?'),provide_option,assert(rpp(X))).
rpp(X) :- always_false(X).

escapes(Y) :- esc(Y);(write('Has '), write(Y), write(' escaped from custody?'),provide_option,assert(esc(Y))).
esc(X) :- always_false(X).

custody(X,Y) :- ccust(X,Y);(write('Did '),write(X),write(' have '),write(Y), write(" in custody, or harbour "),write(Y),write("?"),provide_option,assert(cust(X,Y))).
cust(X,_) :- always_false(X).


soldier(X) :- sold(X);(lawmustbechecked(7,139),write('Is '),write(X),write(' a soldier?'),provide_option,assert(sold(X))).
sold(X) :- always_false(X).

size(Assem,Y) :- sz(Assem,Y);(write('What is the size of the assembly, '),write(Assem),write('?'),read(Y),assert(sz(Assem,Y))).
sz(X,_) :- always_false(X).

memberof(X,Assem) :- memof(X,Assem);(write('Was '),write(X),write('a member of the assembly'), write(Assem), write("?"),provide_option,assert(memof(X,Assem))).
memof(X,_) :- always_false(X).

violent(X) :- vio(X);(write('Was '),write(X),write(' violent?'),provide_option,assert(vio(X))).
vio(X) :- always_false(X).

publishes_class_traitor(X) :- pub_tr(X);(write('Did '),write(X),write(' publish any imputation that any community of persons cannot bear true faith and allegiance to the Constitution of India or uphold the sovereignty and integrity of India?'),provide_option,assert(pub_tr(X))).
pub_tr(X) :- always_false(X).

publishes_class_inhuman(X) :- pub_in(X);(write('Did '),write(X),write(' publish that any community of persons shall be denied or deprived of their rights as citizens of India?'),provide_option,assert(pub_in(X))).
pub_in(X) :- always_false(X).

publishes_class_disharmony(X) :- pub_di(X);(write('Did '),write(X),write(' publish an assertion, counsel, plea or appeal concerning the obligation of any community of persons that causes or is likely to cause disharmony or feelings of enmity or hatred or ill-will between the community and other persons?'),provide_option,assert(pub_di(X))).
pub_di(X) :- always_false(X).

fight(X,Y) :- fig(X,Y);(write('Were '),write(X),write(" and "),write(Y),write(' fighting?'),provide_option,assert(fig(X,Y))).
fig(X,_) :- always_false(X).

in(X) :- ni(X);(write('Did this event take place in '),write(X),write('?'),provide_option,assert(ni(X))).
ni(X) :- always_false(X).

in(X,Y) :- ni(X,Y);(write('Was '),write(X),write(' in '),write(Y),write(' during the incident?'),provide_option,assert(ni(X,Y))).
ni(X,_) :- always_false(X).

public_place(X) :- pub_p(X);(write('Is '),write(X),write('a public place?'),provide_option,assert(pub_p(X))).
pub_p(X) :- always_false(X).

disturb_the_peace(X,Y) :- dist_p(X,Y);(write('Did '),write(X), write("and"), write(Y) ,write(' disturb the peace?'),provide_option,assert(dist_p(X,Y))).
dist_p(X,_) :- always_false(X).

assaults(X,Y) :- aslt(X,Y);(write('Did '),write(X),write(' assault '),write(Y),write("?"),provide_option,assert(aslt(X,Y))).
aslt(X,_) :- always_false(X).

superior(X,Y) :- supri(X,Y);(write('Is '),write(X),write(' the superior of '),write(Y),write("?"),provide_option,assert(supri(X,Y))).
supri(X,_) :- always_false(X).

deserted(X) :- dstd(X);(write('Did '),write(X),write('desert the armed forces?'),provide_option,assert(dstd(X))).
dstd(X) :- always_false(X).

husband(X,Y) :- husb(X,Y);(write('Is '),write(X),write(' the husband of '),write(Y),write("?"),provide_option,assert(husb(X,Y))).
husb(X,_) :- always_false(X).

is_ship(X) :- ishp(X);(write('Is '),write(X),write('a ship?'),provide_option,assert(ishp(X))).
ishp(X) :- always_false(X).

owner(X,Y) :- onr(X,Y);(write('Is '),write(X),write('the owner of '),write(Y),write("?"),provide_option,assert(onr(X,Y))).
onr(X,_) :- always_false(X).

unknowing(X,Y) :- unkn(X,Y);(write('Was '),write(X),write('unknowing of '),write(Y),write("?"),provide_option,assert(unkn(X,Y))).
unkn(X,_) :- always_false(X).

wears_military_token(X) :- tok(X);(write('Did '),write(X),write(' wear a military token?'),provide_option,assert(tok(X))).
tok(X) :- always_false(X).

armed(X) :- armd(X);(write('Was '),write(X),write('armed or in possesion of a weapon?'),provide_option,assert(armd(X))).
armd(X) :- always_false(X).

commanded_to_disperse(X) :- disp(X);(write('Was '),write(X),write(' commanded to disperse?'),provide_option,assert(disp(X))).
disp(X) :- always_false(X).

tried_to_suppress_riot(X) :- supp_r(X);(write('Did '),write(X),write(' try to surpress a riot?'),provide_option,assert(supp_r(X))).
supp_r(X) :- always_false(X).

incite_riot(X,Y) :- inc_r(X,Y);(write('Did '),write(X),write('try to incite'),write(Y),write("to riot?"),provide_option,assert(inc_r(X,Y))).
inc_r(X,_) :- always_false(X).

incite_violence(X) :- inc_v(X);(write('Did '),write(X),write('try to incite violence?'),provide_option,assert(inc_v(X))).
inc_v(X) :- always_false(X).

placeOfWorship(X) :- pow(X);(write('Is '),write(X),write('a place of worship?'),provide_option,assert(pow(X))).
pow(X) :- always_false(X).

rioting_happened_in(X) :- rin(X);(write('Did rioting happen in '),write(X),write('?'),provide_option,assert(rin(X))).
rin(X) :- always_false(X).

master(X,Y) :- mast(X,Y);(write('Was '),write(X),write(' the master of '),write(Y),write("?"),provide_option,assert(mast(X,Y))).
mast(X,_) :- always_false(X).

seduce(X,Y) :- sed(X,Y);(write('Did '),write(X),write(' attempt to seduce '),write(Y),write("?"),provide_option,assert(sed(X,Y))).
sed(X,_) :- always_false(X).

hired(X,Y,Assem) :- hird(X,Y,Assem);(write('Did '),write(X),write(' try to hire '),write(Y),write(" for "), write(Assem), write("?"),provide_option,assert(hird(X,Y,Assem))).
hird(X,_,_) :- always_false(X).

didoffence(X,Y) :-  didof(X,Y);(write('Did '),write(X),write(' commit an '),write(Y),write("?"),provide_option,assert(didof(X,Y))).
didof(X,_) :- always_false(X).

didoffence(X) :-  didof(X);(write('Did '),write(X),write(' commit an offence?'),provide_option,assert(didof(X))).
didof(X) :- always_false(X).

unlawful(Assem) :- lawmustbechecked(8,141),is_assem(Assem),size(Assem,Y),(Y >= 5), (intention(Assem,assault);intention(Assem,resist_law);intention(Assem,mischief);intention(Assem,robbery);intention(Assem,abet)).

unlawful_Assem_mem(X,Assem) :-  lawmustbechecked(8,142),is_assem(Assem),memberof(X, Assem),unlawful(Assem).

rioting(X) :-  lawmustbechecked(8,146),violent(Assem),unlawful(Assem),memberof(X,Assem).

incite_class_hatred(X) :-  publishes_class_traitor(X);publishes_class_inhuman(X);publishes_class_disharmony(X).

affray(X,Y) :-  afry(X);(fight(X,Y),in(X,Z),in(Y,Z),public_place(Z),disturb_the_peace(X,Y),assert(afry(X))).
afry(X) :- always_false(X).

checkeddeath :- false.
death_penalty(Z) :- (death_pen(Z));(not(checkeddeath)),(write('Is this offence, '),write(Z),write(' punishable by death?'),(provide_option;assert(checkeddeath)),assert(death_pen(Z))).
death_pen(X) :- always_false(X).

checkedabet :- false.
didabet(X,Y) :- (didab(X,Y));(not(checkedabet)),(write('Did '),write(X),write(' abet '),write(Y),write('?'),(provide_option;assert(checkedabet)),assert(didab(X,Y))).
didab(X,_) :- always_false(X).


no_offence(X,_) :- lawmustbechecked(4,76),mistake_of_fact(X),((lawmustbechecked(4,76),believes_bound_by_law(X));
(lawmustbechecked(4,79),believes_justified_by_law(X))).
no_offence(X,_) :- lawmustbechecked(4,77),judge(X), believes_justified_by_law(X).
no_offence(X,_) :- lawmustbechecked(4,78),following_judgement(X).
no_offence(X,K) :- lawmustbechecked(4,80),(accident(X); misfortune(X)), not(intention(X,K)).
no_offence(X,K) :- lawmustbechecked(4,81),person(Y),person(Z), harms(X,Y), not(intention(X,K)), prevent_harm(X,Z).
no_offence(X,_) :- (lawmustbechecked(4,82),under7(X));(lawmustbechecked(4,83),(under12(X), immature(X))).
no_offence(X,_) :- lawmustbechecked(4,84),crazy(X), unknowing(X).
no_offence(X,Y) :- lawmustbechecked(4,85),intoxicated_against_will(X), (off_req_intent(Y);unknowing(X)).
no_offence(X,Z) :- lawmustbechecked(4,87),not(intention(X,Z)),victim(Y), harms(X,Y), consent(Y), not(under18(Y)), not(offence_ind_of_harm(Z)).
no_offence(X,Z) :- lawmustbechecked(4,88),not(intention(X, murder)),consent(Y),benefit(Y), not(offence_ind_of_harm(Z)).
no_offence(X,Z) :- lawmustbechecked(4,89),person(Y),benefit(Y),(under12(X);crazy(X)),consent(Z),guardian(Z,Y),not(intention(X, murder);not(unknowing(X));abetment(X,Y,_),not(save_life(Y))), not(offense_ind_of_harm(Z)).
no_offence(X,Z) :- lawmustbechecked(4,92),person(Y),(consent(Y);imp_consent(Y)),not(intention(X, murder)),(unknowing(X);save_life(Y)),not(abetment(_,_,Z)).
no_offence(X,_) :- lawmustbechecked(4,93),person(Y),communicate(X,Y),benefit(Y).
no_offence(X,Z) :- lawmustbechecked(4,94),not(isamurder(X)),not(death_penalty(Z)),death_threat(X),not(intention(X,Z)).
no_offence(X,_) :- lawmustbechecked(4,95),person(Y),not(harms(X,Y)).
no_offence(X,_) :- lawmustbechecked(4,96),person(Y),private_def(X,Y).

private_def(Y,X) :- lawmustbechecked(4,97),(harms(X,Y);didoffence(X,robbery)),not(cond_for_no_private_defense(X,Y)).
private_def(Y,X) :- lawmustbechecked(4,98),not(didoffence(X)),(under12(X);immature(X);crazy(X);intoxicated(X);mistake_of_fact(X)),not(cond_for_no_private_defense(X,Y)).
private_def(Y,X) :- lawmustbechecked(4,101),murder(Y,X),cond1(X,Y).
private_def(Y,X) :- lawmustbechecked(4,104),not(murder(Y,X)),didoffence(X,Z),prop_theft(Z).

cond1(X,Y) :- ((lawmustbechecked(4,100),(death_threat(Y);rape(X,Y);kidnapping(X,Y);confinement(X,Y);acid(X,Y);(didoffence(X,robbery)))); (lawmustbechecked(4,103),arson(Y))).
cond_for_no_private_defense(X,Y) :- not(harms(X,Y));(lawmustbechecked(4,99),public_servant(X),believes_justified_by_law(X));following_judgement(X);(lawmustbechecked(4,106),murder(Y,X),not(cond1(X,Y))).

abetment(X,Y,_) :- lawmustbechecked(5,107),instigates(X);(person(Y),conspires(X,Y));not(unknowing(X)).
abetment(X,_,Z) :- lawmustbechecked(5,120),criminal_conspiracy(X,Z), death_penalty(Z).
abetment(X,_,Z) :- lawmustbechecked(5,108),abetment(Y,_,Z), abetment(X,Y,_).
abetment(X,Y,Z) :- write('Did '),write(X),write(' abet '),write(Y),write(' in commiting the crime '),write(Z),write("?"),provide_option.

abettor(X,Z):-   lawmustbechecked(5,108),not(under7(X)), not(crazy(X)), not(immature(X)), abetment(X,_,Z).

offence(X,Z):- lawmustbechecked(5,109),abetment(X,_,Z).
offence(X,Z) :- lawmustbechecked(5,110),abettor(X,Z).
offence(X,Z) :- (lawmustbechecked(5,111);lawmustbechecked(5,112)),person(Y),abetment(X,Y,Z), is_offence(P),didoffence(Y,P), (P \= Z).
offence(X,P) :- lawmustbechecked(5,113),abetment(X,Y,Z), didoffence(Y,P),is_a_consequence(P,Z), not(unknowing(X)).
offence(X,Z) :- lawmustbechecked(5,113),abettor(X,Z), isPresent(X,Z).
offence(X,Z) :- offence_ind_of_harm(Z),not(no_offense(X,Z)).
offence(X,Y) :- intoxicated(X), not(intoxicated_against_will(X)), off_req_intent(Y).
offence(Y,Z) :- lawmustbechecked(8,149),unlawful(Assem),person(X),memberof(X,Assem),didoffence(X,Z),memberof(Y,Assem),intention(Assem,Z).
offence(X,Crime) :- write('Did '),write(X),write('commit the crime: '),write(Crime),write("?"),provide_option.

quart_imprisonment(X,Z) :- lawmustbechecked(5,116),person(Y),abetment(X,Y,Z), not(success_crime(Z)), not(public_servant(X)), not(public_servant(Y)).
quart_imprisonment(X,Z) :- lawmustbechecked(5,119),person(Y),misleads(X,Y,Z), public_servant(X),not(success_crime(Z)), not(death_penalty(Z)).
quart_imprisonment(X,Z) :- lawmustbechecked(5,120),person(Y),misleads(X,Y,Z), success_crime(Z), not(death_penalty(Z)).

eighth_imprisonment(X,Z) :- lawmustbechecked(5,120),person(Y),misleads(X,Y,Z), not(public_servant(X)), not(success_crime(Z)), not(death_penalty(Z)).

criminal_conspiracy(X,Z) :- lawmustbechecked(5,120),person(Y),agreement(X,Y,Z), intention(X,Z), intention(Y,Z).

half_imprisonment(X,Z) :- lawmustbechecked(5,116),victim(Y),abetment(X,Y,Z), not(success_crime(Z)), (public_servant(X);public_servant(Y)).
half_imprisonment(X,Z) :- lawmustbechecked(5,119),person(Y),misleads(X,Y,Z), public_servant(X), success_crime(Z), not(death_penalty(Z)).

imprisonment(X,Z,10,0) :- lawmustbechecked(5,113),person(Y),misleads(X,Y,Z), public_servant(X), success_crime(Z), death_penalty(Z).
imprisonment(X,Z,7,0) :- lawmustbechecked(5,115),person(Y),abetment(X,Y,Z), death_penalty(Z), not(success_crime(Z)), not(harms(Y,_)).
imprisonment(X,Z,14,0) :- lawmustbechecked(5,115),person(Y),abetment(X,Y,Z), death_penalty(Z), not(success_crime(Z)), harms(Y,_).
imprisonment(X,Z,7,0) :- lawmustbechecked(5,118),person(Y),misleads(X,Y,Z), death_penalty(Z), success_crime(Z).
imprisonment(X,Z,3,0) :- lawmustbechecked(5,118),person(Y),misleads(X,Y,Z), death_penalty(Z), not(success_crime(Z)).
imprisonment(X,Z,0.5,0) :- lawmustbechecked(5,120),criminal_conspiracy(X,Z), not(death_penalty(Z)).
imprisonment(X,war,200,0) :- lawmustbechecked(6,121),criminal_conspiracy(X, war).
imprisonment(X,war,200,0) :- lawmustbechecked(6,122),collect_arms(X, war), intention(X, war).
imprisonment(X,war, 10, 0) :- lawmustbechecked(6,123),intention(Y, war), concealment(X,Y).
imprisonment(X,assault, 7, 0) :- lawmustbechecked(6,124),assault(X, vip), intention(X, restrain).
imprisonment(X,sedition, 200, 0) :- lawmustbechecked(6,124),spread_hatred(X).
imprisonment(X,abetment , 200, 0) :- lawmustbechecked(6,125),abetment(X,_, war_with_asiatic_country).
imprisonment(_,war_with_friend_country, 7, 0) :- lawmustbechecked(6,126),success_crime(war_with_friend_country).
imprisonment(X, Z, 7, 0) :- lawmustbechecked(6,127),receive_plundered_property(X), isRobbery(Z).
imprisonment(X, abetment, 200, 0) :- lawmustbechecked(6,128),prisoner(Y),public_servant(X), custody(X, Y), escapes(Y), intention(X, escape).
imprisonment(X, negligence, 3, 0) :- lawmustbechecked(6,129),prisoner(Y),public_servant(X), custody(X, Y), escapes(Y), not(intention(X, escape)).
imprisonment(X, abetment, 200, 0) :- lawmustbechecked(6,130),prisoner(Y), (escapes(Y) ; concealment(X,Y)), intention(X, escape).
imprisonment(X, Z, 3, 0) :- lawmustbechecked(5,117),is_assem(Assem),abetment(X,Assem,Z),size(Assem,Y),(Y>10).
imprisonment(X,mutiny,200,0) :- lawmustbechecked(7,131),person(Y),(abetment(X,Y, mutiny);seduce(X,Y)),soldier(Y),not(success_crime(mutiny)),not(soldier(X)).
imprisonment(X,abetment,3,0) :-  lawmustbechecked(7,133),person(Y),abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),not(success_crime(assault)),not(soldier(X)).
imprisonment(X,abetment,7,0) :-  lawmustbechecked(7,134),person(Y),abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),success_crime(assault),not(soldier(X)).
imprisonment(X,abetment,2,0) :-  lawmustbechecked(7,135),person(Y),abetment(X,Y, desertion),soldier(Y),not(soldier(X)).
imprisonment(X,harboring,2,0) :-  lawmustbechecked(7,136),person(Y),soldier(Y),deserted(Y),custody(Y,X),not(husband(X,Y)),not(soldier(X)).
imprisonment(X,negligance,0,500) :-  lawmustbechecked(7,137),is_ship(V),owner(X, V),in(Y,V),soldier(Y),deserted(Y),unknowing(X,Y),not(soldier(X)).
imprisonment(X,insubordination,0.5,0) :-  lawmustbechecked(7,138),abetment(X,Y, insubordination),soldier(Y),success_crime(insubordination),not(soldier(X)).
imprisonment(X,wearing_military_token,0.25,500) :-  lawmustbechecked(8,140),not(soldier(X)),wears_military_token(X).
imprisonment(X,assembling,0.5,0) :-  lawmustbechecked(8,143),is_assem(Assem),unlawful_Assem_mem(X,Assem),not(armed(X)).
imprisonment(X,assembling,2,0)  :-  lawmustbechecked(8,144),is_assem(Assem),unlawful_Assem_mem(X,Assem),armed(X).
imprisonment(X,assembling,2,0) :-  lawmustbechecked(8,145),is_assem(Assem),unlawful_Assem_mem(X,Assem),commanded_to_disperse(Assem).
imprisonment(X,assembling,2,0) :-  lawmustbechecked(8,147),rioting(X).
imprisonment(X,assembling,3,0) :-  lawmustbechecked(8,148),rioting(X),armed(X).
imprisonment(X,assembling,0.5,0) :-  lawmustbechecked(8,151),is_assem(Assem),commanded_to_disperse(Assem),memberof(X, Assem).
imprisonment(X,assembling,3,0) :-  lawmustbechecked(8,152),(person(Y),assaults(X,Y);threatens_to_assault(X,Y)),victim(Y),public_servant(Y),tried_to_suppress_riot(Y).
imprisonment(Y,inciting_riot,1,0) :-  lawmustbechecked(8,153),rioting(X),person(Y),incite_riot(Y,X).
imprisonment(Y,inciting_riot,0.5,0) :-  lawmustbechecked(8,153),not(rioting(X)),person(Y),incite_riot(Y,X).
imprisonment(X,inciting_hatred,3,0) :-  lawmustbechecked(8,153),(incite_hatred(X); incite_violence(X)),placeOfWorship(Z),not(in(Z)).
imprisonment(X,inciting_hatred,5,0) :-  lawmustbechecked(8,153),(incite_hatred(X); incite_violence(X)),placeOfWorship(Z),in(Z).
imprisonment(X,being_armed,0.5,2000) :-  lawmustbechecked(8,153),armed(X),is_assem(Assem),memberof(X, Assem).
imprisonment(X,inciting_hatred,0.25,0) :-  lawmustbechecked(8,153),incite_class_hatred(X),placeOfWorship(Z),not(in(Z)).
imprisonment(X,inciting_hatred,5,0) :-  lawmustbechecked(8,153),incite_class_hatred(X),placeOfWorship(Z),in(Z).
imprisonment(X,allow_riot,0,1000) :-  lawmustbechecked(8,154),place(Z),((is_assem(Assem),unlawful(Assem),in(Assem,Z));lawmustbechecked(7,155),(rioting_happened_in(Z),master(X,Z))),intention(X,allow_Assembly).
imprisonment(Y,allow_riot,0,1000) :- lawmustbechecked(8,156),is_assem(Assem),unlawful(Assem),in(Assem,Z),master(X,Z),intention(X,allow_assembly),agent_of(Y,X),not(unknowing(Y,Assem)).
imprisonment(X,harbouring,0.5,0) :-  lawmustbechecked(8,158),person(Y),custody(Y,X),is_assem(Assem),unlawful_Assem_mem(Y,Assem).
imprisonment(X,hiring_unlawful,0.5,0) :-  lawmustbechecked(8,159),person(Y),hired(X, Y, unlawful_Assem),not(armed(X)).
imprisonment(X,hiring_unlawful,2,0) :-  lawmustbechecked(8,159),person(Y),hired(X, Y, unlawful_Assem),armed(X).
imprisonment(X,affray,0.08333,100) :-  lawmustbechecked(8,160),person(Y),affray(X,Y).
imprisonment(Y,affray,0.08333,100) :-  lawmustbechecked(8,160),person(X),affray(X,Y).
imprisonment(X, Z, 777, 0) :- half_imprisonment(X,Z).
imprisonment(X, Z, 888, 0) :- quart_imprisonment(X,Z).
imprisonment(X, Z, 999, 0) :- eighth_imprisonment(X,Z).
imprisonment(X, Z, 15, 0) :- offence(X,Z).
imprisonment(X, Z, 1111, 0) :- death_penalty(X,Z).

death_penalty(X,war) :- lawmustbechecked(6,121),abetment(X,_,war) ; success_crime(war).
death_penalty(X,mutiny) :- lawmustbechecked(7,132),abetment(X,Y, mutiny),soldier(Y),success_crime(mutiny),not(soldier(X)).

