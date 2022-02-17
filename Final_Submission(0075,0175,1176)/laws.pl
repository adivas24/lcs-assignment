
/*
Auxiliary Statements for law evaluation.  In most cases they prompt the user for specific inputs.
The structure of these statements has been designed so that the program need not prompt the user the same query twice.
*/

provide_option :- write('\nPress y for yes anything else for no.\nPlease put only one character, no full-stops.\n'),get(Y),nl,((Y is 89);(Y is 121)).
checked_mistake_of_fact :- false.
mistake_of_fact(X) :- mist_of_fact(X);(not(checked_mistake_of_fact),(write('Is this a case of mistaken fact?'),((provide_option,assert(mist_of_fact(X)));(assert(checked_mistake_of_fact),false)))).
mist_of_fact(_) :- false.

checked_agreement :- false.
agreement(X,Y,Z) :- agrmnt(X,Y,Z);(not(checked_agreement),(write('Was there an agreement between '),write(X),write(' and '),write(Y),write(' to commit the crime '),write(Z),write('?'),((provide_option,assert(agrmnt(X,Y,Z)));(assert(checked_agreement),false)))).
agrmnt(_,_,_) :- false.

checked_believes_bound_by_law :- false.
believes_bound_by_law(X) :- bbbl(X);(not(checked_believes_bound_by_law),(write('Did '),write(X),write(' believe that he/she was bound by law to do so?'),((provide_option,assert(bbbl(X)));(assert(checked_believes_bound_by_law),false)))).
bbbl(_) :- false.

checked_believes_justified_by_law :- false.
believes_justified_by_law(X) :- bjbl(X);(not(checked_believes_justified_by_law),(write('Did '),write(X),write(' believe that he/she was justified by law to do so?'),((provide_option,assert(bjbl(X)));(assert(checked_believes_justified_by_law),false)))).
bjbl(_) :- false.

checked_judge :- false.
judge(X) :- jud(X);(not(checked_judge),(write('Was '),write(X),write(' a judge of the court?'),((provide_option,assert(jud(X)));(assert(checked_judge),false)))).
jud(_) :- false.

checked_following_judgement :- false.
following_judgement(X):- foll_jud(X);(write('Was '),write(X),write(' following the judgement of a court or public servant?'),provide_option,assert(foll_jud(X))).
foll_jud(_) :- false.

checked_accident :- false.
accident(X) :- acc(X);(not(checked_accident),(write('Was this an accident?'),((provide_option,assert(acc(X)));(assert(checked_accident),false)))).
acc(_) :- false.

checked_misfortune :- false.
misfortune(X) :- misf(X);(not(checked_misfortune),(write('Would you classify this as a misfortune?'),((provide_option,assert(misf(X)));(assert(checked_misfortune),false)))).
misf(_) :- false.

checked_intention :- false.
intention(X,Crime) :- inten(X,Crime);(not(checked_intention),(write('Was it the intention of '),write(X),write(' to perform the crime, '),write(Crime),write("?"),((provide_option,assert(inten(X,Crime)));(assert(checked_intention),false)))).
inten(_,_) :- false.

checked_prevent_harm :- false.
prevent_harm(X,Z) :- prev_h(X,Z);(not(checked_prevent_harm),(write('Was '),write(X),write(' trying to save '),write(Z),write('?'),((provide_option,assert(prev_h(X,Z)));(assert(checked_prevent_harm),false)))).
prev_h(_,_) :- false.

checked_under7 :- false.
under7(X) :- u7(X);(not(checked_under7),(write('Is '),write(X),write(' under the age of 7?'),((provide_option,assert(u7(X)));(assert(checked_under7),false)))).
u7(_) :- false.

checked_under12 :- false.
under12(X) :- u12(X);(not(checked_under12),(write('Is '),write(X),write(' under the age of 12?'),((provide_option,assert(u12(X)));(assert(checked_under12),false)))).
u12(_) :- false.

checked_under18 :- false.
under18(X) :- u18(X);(not(checked_under18),(write('Is '),write(X),write(' under the age of 18?'),((provide_option,assert(u18(X)));(assert(checked_under18),false)))).
u18(_) :- false.

checked_immature :- false.
immature(X) :- imm(X);(not(checked_immature),(write('Is '),write(X),write(' not mature enough to comprehend his actions?'),((provide_option,assert(imm(X)));(assert(checked_immature),false)))).
imm(_) :- false.

checked_harms :- false.
harms(X,Y) :- har(X,Y);(not(checked_harms),(write('Did '),write(X),write(' harm '),write(Y),write('?'),((provide_option,assert(har(X,Y)));(assert(checked_harms),false)))).
har(_,_) :- false.

checked_crazy :- false.
crazy(X) :- (insa(X));(not(checked_crazy),((write('Is '),write(X),write(' clinically insane?'),(provide_option),assert(insa(X))))).
insa(_) :- false.

checked_unknowing :- false.
unknowing(X) :- unkn(X);(not(checked_unknowing),(write('Was '),write(X),write(' unanware of the consequences?'),((provide_option,assert(unkn(X)));(assert(checked_unknowing),false)))).
unkn(_) :- false.

checked_intoxicated_against_will :- false.
intoxicated_against_will(X):- inx_a(X);(write('Was '),write(X),write(' intoxicated against his/her will?'),provide_option,assert(inx_a(X))).
inx_a(_) :- false.

checked_intoxicated :- false.
intoxicated(X) :- inx(X);(not(checked_intoxicated),(write('Was '),write(X),write(' intoxicated?'),((provide_option,assert(inx(X)));(assert(checked_intoxicated),false)))).
inx(_) :- false.

checked_fear :- false.
fear(Y) :- fer(Y);(not(checked_fear),victim(Y),(write('Was '),write(Y),write(' forced to give consent due to fear?'),((provide_option,assert(fer(Y)));(assert(checked_fear),false)))).
fer(_) :- false.

checked_consent :- false.
consent(Y) :- cons(Y);(not(checked_consent),(lawmustbechecked(4,90),not(fear(Y);mistake_of_fact(Y);under12(Y);crazy(Y);intoxicated(Y)),not(unknowing(Y)),assert(cons(Y)))).
cons(_) :- false.

checked_offence_ind_of_harm :- false.
offence_ind_of_harm(Y) :- oih(Y);(not(checked_offence_ind_of_harm),(lawmustbechecked(4,91),write('Is '),write(Y),write(' an offense, irrespective of the harm it causes?'),((provide_option,assert(oih(Y)));(assert(checked_offence_ind_of_harm),false)))).
oih(_) :- false.

checked_benefit :- false.
benefit(Y) :- ben(Y);(not(checked_benefit),(write('Was the purpose of the act to benefit '),write(Y),write('?'),((provide_option,assert(ben(Y)));(assert(checked_benefit),false)))).
ben(_) :- false.

checked_guardian :- false.
guardian(X,Y) :- gua(X,Y);(not(checked_guardian),(write('Is '),write(X),write(' the guardian of '),write(Y),write('?'),((provide_option,assert(gua(X,Y)));(assert(checked_guardian),false)))).
gua(_,_) :- false.

checked_save_life :- false.
save_life(Y) :- s_l(Y);(not(checked_save_life),(write('Was the purpose of the act to save the life of '),write(Y),write('?'),((provide_option,assert(s_l(Y)));(assert(checked_save_life),false)))).
s_l(_) :- false.

checked_imp_consent :- false.
imp_consent(Y) :- icons(Y);(not(checked_imp_consent),(write('Was '),write(Y),write(' incapable of giving consent?'),((provide_option,assert(icons(Y)));(assert(checked_imp_consent),false)))).
icons(_) :- false.

checked_communicate :- false.
communicate(X,Z) :- comm(X,Z);(not(checked_communicate),(write('Did '),write(X),write(' communicate some information which harmed '),write(Z),write('?'),((provide_option,assert(comm(X,Z)));(assert(checked_communicate),false)))).
comm(_,_) :- false.

checked_murder :- false.
murder(X) :- mur(X);(not(checked_murder),(write('Was '),write(X),write(' killed?'),((provide_option,assert(mur(X)));(assert(checked_murder),false)))).
mur(_) :- false.


checked_morder :- false.
murder(X,Y) :- mor(X,Y);(not(checked_morder),(write('Did '),write(X),write(' kill '),write(Y),write('?'),((provide_option,assert(mor(X,Y)));(assert(checked_morder),false)))).
mor(_,_) :- false.

checked_death_threat :- false.
death_threat(X) :- d_t(X);(not(checked_death_threat),(write('Was '),write(X),write(' under threat of death?'),((provide_option,assert(d_t(X)));(assert(checked_death_threat),false)))).
d_t(_) :- false.

checked_public_servant :- false.
public_servant(X) :- pub_s(X);(not(checked_public_servant),(write('Was/Is '),write(X),write(' a public servant?'),((provide_option,assert(pub_s(X)));(assert(checked_public_servant),false)))).
pub_s(_) :- false.

checked_rape :- false.
rape(X,Y) :- rpe(X,Y);(not(checked_rape),(write('Did '),write(X),write('attempt to rape '),write(Y),write('?'),((provide_option,assert(rpe(X,Y)));(assert(checked_rape),false)))).
rpe(_,_) :- false.

checked_kidnapping :- false.
kidnapping(X,Y) :- k_nap(X,Y);(not(checked_kidnapping),(write('Did '),write(X),write('attempt to kidnap/abduct '),write(Y),write('?'),((provide_option,assert(k_nap(X,Y)));(assert(checked_kidnapping),false)))).
k_nap(_,_) :- false.

checked_confinement :- false.
confinement(X,Y) :- conf(X,Y);(not(checked_confinement),(write('Did '),write(X),write('attempt to wrongfully confine '),write(Y),write('?'),((provide_option,assert(conf(X,Y)));(assert(checked_confinement),false)))).
conf(_,_) :- false.

checked_acid :- false.
acid(X,Y) :- acd(X,Y);(not(checked_acid),(write('Did '),write(X),write('attempt to throw acid on '),write(Y),write('?'),((provide_option,assert(acd(X,Y)));(assert(checked_acid),false)))).
acd(_,_) :- false.

checked_conspires :- false.
conspires(X,Y) :- consp(X,Y);(not(checked_conspires),(write('Has '),write(X),write(' engaged in a conspiracy with '),write(Y),write(' towards the crime?'),((provide_option,assert(consp(X,Y)));(assert(checked_conspires),false)))).
consp(_,_) :- false.

checked_willful :- false.
willful(X) :- wful(X);(not(checked_willful),(write('Did '), write(X), write(' perform the act of his own will?'),((provide_option,assert(wful(X)));(assert(checked_willful),false)))).
wful(_) :- false.

checked_concealment :- false.
concealment(X,Y) :- conc(X,Y);(not(checked_concealment),(write('Did '), write(X), write(' conceal facts related to the case?'),((provide_option,assert(conc(X,Y)));(assert(checked_concealment),false)))).
conc(_,_) :- false.

checked_misrepresentation :- false.
misrepresentation(X) :- misrep(X);(not(checked_misrepresentation),(write('Has '), write(X), write(' been involved in misrepresentation?'),((provide_option,assert(misrep(X)));(assert(checked_misrepresentation),false)))).
misrep(_) :- false.

checked_is_a_consequence :- false.
is_a_consequence(P,Z) :- consq(P,Z);(not(checked_is_a_consequence),(write('Is '), write(P), write(' a consequence of '), write(Z), write('?'),((provide_option,assert(consq(P,Z)));(assert(checked_is_a_consequence),false)))).
consq(_,_) :- false.

checked_isPresent :- false.
isPresent(X) :- pres(X);(not(checked_isPresent),(write('Was '), write(X), write(' present at the scene at the time?'),((provide_option,assert(pres(X)));(assert(checked_isPresent),false)))).
pres(_) :- false.

checked_success_crime :- false.
success_crime(Z) :- succ_cr(Z);(not(checked_success_crime),(write('Was the crime '), write(Z), write(' successful?'),((provide_option,assert(succ_cr(Z)));(assert(checked_success_crime),false)))).
succ_cr(_) :- false.

checked_misleads :- false.
misleads(X,Y,Z) :- mis(X,Y,Z);(not(checked_misleads),(write('Has '), write(X), write(' misled '), write(Y), write(' in regards to '), write(Z),write('?'),((provide_option,assert(mis(X,Y,Z)));(assert(checked_misleads),false)))).
mis(_,_,_) :- false.

checked_collect_arms :- false.
collect_arms(X, Y) :- coll_arm(X,Y);(write('Has '), write(X), write(' engaged in the collection of arms for the purpose of '), write(Y), write('?'),provide_option,assert(coll_arm(X))).
coll_arm(_,_) :- false.

checked_spread_hatred :- false.
spread_hatred(X) :- spr_h(X);(not(checked_spread_hatred),(write('Has '), write(X), write(' brought or attempted to bring into hatred or contempt, or excited or attempted to excite disaffection towards, the Government established by law?'),((provide_option,assert(spr_h(X)));(assert(checked_spread_hatred),false)))).
spr_h(_) :- false.

checked_receive_plundered_property :- false.
receive_plundered_property(X) :- rpp(X);(not(checked_receive_plundered_property),(write('Has '), write(X), write(' recieved any plundered property?'),((provide_option,assert(rpp(X)));(assert(checked_receive_plundered_property),false)))).
rpp(_) :- false.

checked_escapes :- false.
escapes(Y) :- esc(Y);(not(checked_escapes),(write('Has '), write(Y), write(' escaped from custody?'),((provide_option,assert(esc(Y)));(assert(checked_escapes),false)))).
esc(_) :- false.

checked_custody :- false.
custody(X,Y) :- cust(X,Y);(not(checked_custody),(write('Did '),write(X),write(' have '),write(Y), write(" in custody, or harbour "),write(Y),write("?"),provide_option,assert(cust(X,Y)))).
cust(_,_) :- false.

checked_soldier :- false.
soldier(X) :- sold(X);(not(checked_soldier),(lawmustbechecked(7,139),write('Is '),write(X),write(' a soldier?'),((provide_option,assert(sold(X)));(assert(checked_soldier),false)))).
sold(_) :- false.

checked_size :- false.
size(Assem,Y) :- sz(Assem,Y);(not(checked_size),(write('What is the size of the assembly, '),write(Assem),write('?'),read(Y),assert(sz(Assem,Y)))).
sz(_,_) :- false.

checked_memberof :- false.
memberof(X,Assem) :- memof(X,Assem);(not(checked_memberof),(write('Was '),write(X),write('a member of the assembly'), write(Assem), write("?"),((provide_option,assert(memof(X,Assem)));(assert(checked_memberof),false)))).
memof(_,_) :- false.

checked_violent :- false.
violent(X) :- vio(X);(not(checked_violent),(write('Was '),write(X),write(' violent?'),((provide_option,assert(vio(X)));(assert(checked_violent),false)))).
vio(_) :- false.

checked_publishes_class_traitor :- false.
publishes_class_traitor(X) :- pub_tr(X);(not(checked_publishes_class_traitor),(write('Did '),write(X),write(' publish any imputation that any community of persons cannot bear true faith and allegiance to the Constitution of India or uphold the sovereignty and integrity of India?'),((provide_option,assert(pub_tr(X)));(assert(checked_publishes_class_traitor),false)))).
pub_tr(_) :- false.

checked_publishes_class_inhuman :- false.
publishes_class_inhuman(X) :- pub_in(X);(not(checked_publishes_class_inhuman),(write('Did '),write(X),write(' publish that any community of persons shall be denied or deprived of their rights as citizens of India?'),((provide_option,assert(pub_in(X)));(assert(checked_publishes_class_inhuman),false)))).
pub_in(_) :- false.

checked_publishes_class_disharmony :- false.
publishes_class_disharmony(X) :- pub_di(X);(not(checked_publishes_class_disharmony),(write('Did '),write(X),write(' publish an assertion, counsel, plea or appeal concerning the obligation of any community of persons that causes or is likely to cause disharmony or feelings of enmity or hatred or ill-will between the community and other persons?'),((provide_option,assert(pub_di(X)));(assert(checked_publishes_class_disharmony),false)))).
pub_di(_) :- false.

checked_fight :- false.
fight(X,Y) :- fig(X,Y);(not(checked_fight),(write('Were '),write(X),write(" and "),write(Y),write(' fighting?'),((provide_option,assert(fig(X,Y)));(assert(checked_fight),false)))).
fig(_,_) :- false.

checked_in1 :- false.
in(X) :- ni(X);(not(checked_in1),(write('Did this event take place in '),write(X),write('?'),((provide_option,assert(ni(X)));(assert(checked_in1),false)))).
ni(_) :- false.

checked_in :- false.
in(X,Y) :- ni(X,Y);(not(checked_in),(write('Was '),write(X),write(' in '),write(Y),write(' during the incident?'),((provide_option,assert(ni(X,Y)));(assert(checked_in),false)))).
ni(_,_) :- false.

checked_public_place :- false.
public_place(X) :- pub_p(X);(not(checked_public_place),(write('Is '),write(X),write('a public place?'),((provide_option,assert(pub_p(X)));(assert(checked_public_place),false)))).
pub_p(_) :- false.

checked_disturb_the_peace :- false.
disturb_the_peace(X,Y) :- dist_p(X,Y);(not(checked_disturb_the_peace),(write('Did '),write(X), write("and"), write(Y) ,write(' disturb the peace?'),((provide_option,assert(dist_p(X,Y)));(assert(checked_disturb_the_peace),false)))).
dist_p(_,_) :- false.

checked_assaults :- false.
assaults(X,Y) :- aslt(X,Y);(not(checked_assaults),(write('Did '),write(X),write(' assault '),write(Y),write("?"),((provide_option,assert(aslt(X,Y)));(assert(checked_assaults),false)))).
aslt(_,_) :- false.

checked_superior :- false.
superior(X,Y) :- supri(X,Y);(not(checked_superior),(write('Is '),write(X),write(' the superior of '),write(Y),write("?"),((provide_option,assert(supri(X,Y)));(assert(checked_superior),false)))).
supri(_,_) :- false.

checked_deserted :- false.
deserted(X) :- dstd(X);(not(checked_deserted),(write('Did '),write(X),write('desert the armed forces?'),((provide_option,assert(dstd(X)));(assert(checked_deserted),false)))).
dstd(_) :- false.

checked_husband :- false.
husband(X,Y) :- husb(X,Y);(not(checked_husband),(write('Is '),write(X),write(' the husband of '),write(Y),write("?"),((provide_option,assert(husb(X,Y)));(assert(checked_husband),false)))).
husb(_,_) :- false.

checked_is_ship :- false.
is_ship(X) :- ishp(X);(not(checked_is_ship),(write('Is '),write(X),write('a ship?'),((provide_option,assert(ishp(X)));(assert(checked_is_ship),false)))).
ishp(_) :- false.

checked_owner :- false.
owner(X,Y) :- onr(X,Y);(not(checked_owner),(write('Is '),write(X),write('the owner of '),write(Y),write("?"),((provide_option,assert(onr(X,Y)));(assert(checked_owner),false)))).
onr(_,_) :- false.

checked_unknowing1 :- false.
unknowing(X,Y) :- unkn(X,Y);(not(checked_unknowing1),(write('Was '),write(X),write('unknowing of '),write(Y),write("?"),((provide_option,assert(unkn(X,Y)));(assert(checked_unknowing1),false)))).
unkn(_,_) :- false.

checked_wears_military_token :- false.
wears_military_token(X) :- tok(X);(not(checked_wears_military_token),(write('Did '),write(X),write(' wear a military token?'),((provide_option,assert(tok(X)));(assert(checked_wears_military_token),false)))).
tok(_) :- false.

checked_armed :- false.
armed(X) :- armd(X);(not(checked_armed),(write('Was '),write(X),write('armed or in possesion of a weapon?'),((provide_option,assert(armd(X)));(assert(checked_armed),false)))).
armd(_) :- false.

checked_commanded_to_disperse :- false.
commanded_to_disperse(X) :- disp(X);(not(checked_commanded_to_disperse),(write('Was '),write(X),write(' commanded to disperse?'),((provide_option,assert(disp(X)));(assert(checked_commanded_to_disperse),false)))).
disp(_) :- false.

checked_tried_to_suppress_riot :- false.
tried_to_suppress_riot(X) :- supp_r(X);(not(checked_tried_to_suppress_riot),(write('Did '),write(X),write(' try to surpress a riot?'),((provide_option,assert(supp_r(X)));(assert(checked_tried_to_suppress_riot),false)))).
supp_r(_) :- false.

checked_incite_riot :- false.
incite_riot(X,Y) :- inc_r(X,Y);(not(checked_incite_riot),(write('Did '),write(X),write('try to incite'),write(Y),write("to riot?"),((provide_option,assert(inc_r(X,Y)));(assert(checked_incite_riot),false)))).
inc_r(X,Y) :- always_false(X,Y).

checked_incite_violence :- false.
incite_violence(X) :- inc_v(X);(not(checked_incite_violence),(write('Did '),write(X),write('try to incite violence?'),((provide_option,assert(inc_v(X)));(assert(checked_incite_violence),false)))).
inc_v(_) :- false.

checked_placeOfWorship :- false.
placeOfWorship(X) :- pow(X);(not(checked_placeOfWorship),(write('Is '),write(X),write('a place of worship?'),((provide_option,assert(pow(X)));(assert(checked_placeOfWorship),false)))).
pow(_) :- false.

checked_rioting_happened_in :- false.
rioting_happened_in(X) :- rin(X);(not(checked_rioting_happened_in),(write('Did rioting happen in '),write(X),write('?'),((provide_option,assert(rin(X)));(assert(checked_rioting_happened_in),false)))).
rin(_) :- false.

checked_master :- false.
master(X,Y) :- mast(X,Y);(not(checked_master),(write('Was '),write(X),write(' the master of '),write(Y),write("?"),((provide_option,assert(mast(X,Y)));(assert(checked_master),false)))).
mast(_,_) :- false.

checked_seduce :- false.
seduce(X,Y) :- sed(X,Y);(not(checked_seduce),(write('Did '),write(X),write(' attempt to seduce '),write(Y),write("?"),((provide_option,assert(sed(X,Y)));(assert(checked_seduce),false)))).
sed(_,_) :- false.

checked_hired :- false.
hired(X,Y,Assem) :- hird(X,Y,Assem);(not(checked_hired),(write('Did '),write(X),write(' try to hire '),write(Y),write(" for "), write(Assem), write("?"),((provide_option,assert(hird(X,Y,Assem)));(assert(checked_hired),false)))).
hird(_,_,_) :- false.

checked_didoffence :- false.
didoffence(X,Y) :-  didof(X,Y);(not(checked_didoffence),(write('Did '),write(X),write(' commit an '),write(Y),write("?"),((provide_option,assert(didof(X,Y)));(assert(checked_didoffence),false)))).
didof(_,_) :- false.

checked_didoffence1 :- false.
didoffence(X) :-  didof(X);(not(checked_didoffence1),(write('Did '),write(X),write(' commit an offence?'),((provide_option,assert(didof(X)));(assert(checked_didoffence1),false)))).
didof(_) :- false.

checked_death_penalty :- false.
death_penalty(Z) :- death_pen(Z);(not(checked_death_penalty),(write('Is this offence, '),write(Z),write(' punishable by death?'),((provide_option,assert(death_pen(Z)));(assert(checked_death_penalty),false)))).
death_pen(_) :- false.

checked_didabet :- false.
didabet(X,Y) :- didab(X,Y);(not(checked_didabet),(write('Did '),write(X),write(' abet '),write(Y),write('?'),((provide_option,assert(didab(X,Y)));(assert(checked_didabet),false)))).
didab(_,_) :- false.

unlawful(Assem) :- lawmustbechecked(8,141),size(Assem,Y),(Y >= 5), (intention(Assem,assault);intention(Assem,resist_law);intention(Assem,mischief);intention(Assem,robbery);intention(Assem,abet)).

unlawful_Assem_mem(X,Assem) :-  lawmustbechecked(8,142),is_assem(Assem),memberof(X, Assem),unlawful(Assem).

rioting(X) :-  lawmustbechecked(8,146),violent(Assem),unlawful(Assem),memberof(X,Assem).

incite_class_hatred(X) :-  publishes_class_traitor(X);publishes_class_inhuman(X);publishes_class_disharmony(X).

affray(X,Y) :-  afry(X);(fight(X,Y),in(X,Z),in(Y,Z),public_place(Z),disturb_the_peace(X,Y),assert(afry(X))).
afry(_) :- false.

instigates(X) :- inst(X);(willful(X),(concealment(X,_);misrepresentation(X)),assert(inst(X))).
instigates(X) :- inst(X);(lawmustbechecked(5,107),write('Has '),write(X), write(' instigated anyone to commit the crime?'),provide_option,assert(inst(X))).
inst(_) :- false.


/*
The predicates which follow are the actual encoding of the Indian Penal Code.
In lawmustbechecked(A,B), A refers to the section number, and B the number of the law.
*/

/*
no_offence(suspect,crime).
*/
no_offence(X,Z) :- lawmustbechecked(4,95),person(Y),not(harms(X,Y)),not(offence_ind_of_harm(Z)).
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
no_offence(X,Z) :- lawmustbechecked(4,92),person(Y),benefit(Y),(consent(Y);imp_consent(Y)),not(intention(X, murder)),(unknowing(X);save_life(Y)),not(abetment(_,_,Z)).
no_offence(X,_) :- lawmustbechecked(4,93),person(Y),communicate(X,Y),benefit(Y).
no_offence(X,Z) :- lawmustbechecked(4,94),not(isamurder(Z)),not(death_penalty(Z)),death_threat(X),not(intention(X,Z)).
no_offence(X,_) :- lawmustbechecked(4,96),person(Y),private_def(X,Y).

/*
private_def(Y,X). Y is defending himself or his property from X.
*/
private_def(Y,X) :- lawmustbechecked(4,97),(harms(X,Y);didoffence(X,robbery)),not(cond_for_no_private_defense(X,Y)).
private_def(Y,X) :- lawmustbechecked(4,98),not(didoffence(X)),(under12(X);immature(X);crazy(X);intoxicated(X);mistake_of_fact(X)),not(cond_for_no_private_defense(X,Y)).
private_def(Y,X) :- lawmustbechecked(4,101),murder(Y,X),cond1(X,Y).
private_def(Y,X) :- lawmustbechecked(4,104),not(murder(Y,X)),didoffence(X,Z),prop_theft(Z).

cond1(X,Y) :- ((lawmustbechecked(4,100),(death_threat(Y);rape(X,Y);kidnapping(X,Y);confinement(X,Y);acid(X,Y);(didoffence(X,robbery)))); (lawmustbechecked(4,103),arson(Y))).
cond_for_no_private_defense(X,Y) :- not(harms(X,Y));(lawmustbechecked(4,99),public_servant(X),believes_justified_by_law(X));following_judgement(X);(lawmustbechecked(4,106),murder(Y,X),not(cond1(X,Y))).

/*
abetment(abettor,abetted,crime).
*/
abetment(X,Y,_) :- lawmustbechecked(5,107),instigates(X);(person(Y),conspires(X,Y));not(unknowing(X)).
abetment(X,_,Z) :- lawmustbechecked(5,120),criminal_conspiracy(X,Z), death_penalty(Z).
abetment(X,Z,_) :- lawmustbechecked(5,108),person(Y),didabet(X,Y),anotherperson(Z),didabet(Y,Z).
abetment(X,Y,Z) :- write('Did '),write(X),write(' abet '),write(Y),write(' in commiting the crime '),write(Z),write("?"),provide_option.

abettor(X,Z):-   lawmustbechecked(5,108),not(under7(X)), not(crazy(X)), not(immature(X)), abetment(X,_,Z).

/*
offence(suspect,crime).
*/
offence(X,Z):- lawmustbechecked(5,109),abetment(X,_,Z).
offence(X,Z) :- lawmustbechecked(5,110),abettor(X,Z).
offence(X,Z) :- (lawmustbechecked(5,111);lawmustbechecked(5,112)),someone(Y),abetment(X,Y,Z), is_offence(P),didoffence(Y,P), (P \= Z).
offence(X,P) :- lawmustbechecked(5,113),abetment(X,Y,Z), didoffence(Y,P),is_a_consequence(P,Z), not(unknowing(X)).
offence(X,Z) :- lawmustbechecked(5,113),abettor(X,Z), isPresent(X,Z).
offence(X,Y) :- lawmustbechecked(4,86),intoxicated(X), not(intoxicated_against_will(X)), off_req_intent(Y).
offence(Y,Z) :- lawmustbechecked(8,149),unlawful(Assem),memberof(X,Assem),didoffence(X,Z),memberof(Y,Assem),intention(Assem,Z).
%offence(X,Crime) :- write('Did '),write(X),write(' commit the crime: '),write(Crime),write("?"),provide_option.

/*
abc_imprisonment(suspect,crime).
*/
quart_imprisonment(X,Z) :- lawmustbechecked(5,116),abetment(X,Y,Z), not(success_crime(Z)), not(public_servant(X)), not(public_servant(Y)).
quart_imprisonment(X,Z) :- lawmustbechecked(5,119),person(Y),misleads(X,Y,Z), public_servant(X),not(success_crime(Z)), not(death_penalty(Z)).
quart_imprisonment(X,Z) :- lawmustbechecked(5,120),person(Y),misleads(X,Y,Z), success_crime(Z), not(death_penalty(Z)).

eighth_imprisonment(X,Z) :- lawmustbechecked(5,120),person(Y),misleads(X,Y,Z), not(public_servant(X)), not(success_crime(Z)), not(death_penalty(Z)).

criminal_conspiracy(X,Z) :- lawmustbechecked(5,120),person(Y),agreement(X,Y,Z), intention(X,Z), intention(Y,Z).

half_imprisonment(X,Z) :- lawmustbechecked(5,116),abetment(X,Y,Z), not(success_crime(Z)), (public_servant(X);public_servant(Y)).
half_imprisonment(X,Z) :- lawmustbechecked(5,119),person(Y),misleads(X,Y,Z), public_servant(X), success_crime(Z), not(death_penalty(Z)).


/*
imprisonment(suspect,crime,years,fine).
*/
imprisonment(X,Z,10,0) :- lawmustbechecked(5,113),person(Y),misleads(X,Y,Z), public_servant(X), success_crime(Z), death_penalty(Z).
imprisonment(X,Z,7,0) :- lawmustbechecked(5,115),abetment(X,Y,Z), death_penalty(Z), not(success_crime(Z)), not(harms(Y,_)).
imprisonment(X,Z,14,0) :- lawmustbechecked(5,115),abetment(X,Y,Z), death_penalty(Z), not(success_crime(Z)), harms(Y,_).
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
imprisonment(X, abetment, 200, 0) :- lawmustbechecked(6,128),public_servant(X),someone(Y), custody(X, Y), escapes(Y), intention(X, escape).
imprisonment(X, negligence, 3, 0) :- lawmustbechecked(6,129),public_servant(X),someone(Y), custody(X, Y), escapes(Y), not(intention(X, escape)).
imprisonment(X, abetment, 200, 0) :- lawmustbechecked(6,130),prisoner(Y), (escapes(Y) ; concealment(X,Y)), intention(X, escape).
imprisonment(X, Z, 3, 0) :- lawmustbechecked(5,117),is_assem(Assem),abetment(X,Assem,Z),size(Assem,Y),(Y>10).
imprisonment(X,mutiny,200,0) :- lawmustbechecked(7,131),someone(Y),(abetment(X,Y, mutiny);seduce(X,Y)),soldier(Y),not(success_crime(mutiny)),not(soldier(X)).
imprisonment(X,abetment,3,0) :-  lawmustbechecked(7,133),someone(Y),abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),not(success_crime(assault)),not(soldier(X)).
imprisonment(X,abetment,7,0) :-  lawmustbechecked(7,134),someone(Y),abetment(X,Y, assault),soldier(Y),assaults(Y,Z),superior(Z,Y),success_crime(assault),not(soldier(X)).
imprisonment(X,abetment,2,0) :-  lawmustbechecked(7,135),someone(Y),abetment(X,Y, desertion),soldier(Y),not(soldier(X)).
imprisonment(X,harboring,2,0) :-  lawmustbechecked(7,136),someone(Y),soldier(Y),deserted(Y),custody(X,Y),not(husband(X,Y)),not(soldier(X)).
imprisonment(X,negligence,0,500) :-  lawmustbechecked(7,137),ship(V),owner(X, V),someone(Y),in(Y,V),soldier(Y),deserted(Y),unknowing(X,Y),not(soldier(X)).
imprisonment(X,insubordination,0.5,0) :-  lawmustbechecked(7,138),someone(Y),didabet(X,Y),soldier(Y),success_crime(insubordination),not(soldier(X)).
imprisonment(X,wearing_military_token,0.25,500) :-  lawmustbechecked(8,140),not(soldier(X)),wears_military_token(X).
imprisonment(X,assembling,0.5,0) :-  lawmustbechecked(8,143),is_assem(Assem),unlawful_Assem_mem(X,Assem),not(armed(X)).
imprisonment(X,assembling,2,0)  :-  lawmustbechecked(8,144),is_assem(Assem),unlawful_Assem_mem(X,Assem),armed(X).
imprisonment(X,assembling,2,0) :-  lawmustbechecked(8,145),is_assem(Assem),unlawful_Assem_mem(X,Assem),commanded_to_disperse(Assem).
imprisonment(X,assembling,2,0) :-  lawmustbechecked(8,147),rioting(X).
imprisonment(X,assembling,3,0) :-  lawmustbechecked(8,148),rioting(X),armed(X).
imprisonment(X,assembling,0.5,0) :-  lawmustbechecked(8,151),is_assem(Assem),commanded_to_disperse(Assem),memberof(X, Assem).
imprisonment(X,assembling,3,0) :-  lawmustbechecked(8,152),someone(Y),(assaults(X,Y);threatens_to_assault(X,Y)),public_servant(Y),tried_to_suppress_riot(Y).
imprisonment(Y,inciting_riot,1,0) :-  lawmustbechecked(8,153),someone(X),rioting(X),incite_riot(Y,X).
imprisonment(Y,inciting_riot,0.5,0) :-  lawmustbechecked(8,153),someone(X),not(rioting(X)),incite_riot(Y,X).
imprisonment(X,inciting_hatred,3,0) :-  lawmustbechecked(8,153),(incite_hatred(X); incite_violence(X)),place(Z),not(in(Z)),placeOfWorship(Z).
imprisonment(X,inciting_hatred,5,0) :-  lawmustbechecked(8,153),(incite_hatred(X); incite_violence(X)),place(Z),in(Z),placeOfWorship(Z).
imprisonment(X,being_armed,0.5,2000) :-  lawmustbechecked(8,153),armed(X),is_assem(Assem),memberof(X, Assem).
imprisonment(X,inciting_hatred,0.25,0) :-  lawmustbechecked(8,153),incite_class_hatred(X),place(Z),not(in(Z)),placeOfWorship(Z).
imprisonment(X,inciting_hatred,5,0) :-  lawmustbechecked(8,153),incite_class_hatred(X),place(Z),in(Z),placeOfWorship(Z).
imprisonment(X,allow_riot,0,1000) :-  lawmustbechecked(8,154),place(Z),((is_assem(Assem),unlawful(Assem),in(Assem,Z));lawmustbechecked(7,155),(rioting_happened_in(Z),master(X,Z))),intention(X,allow_Assembly).
imprisonment(Y,allow_riot,0,1000) :- lawmustbechecked(8,156),is_assem(Assem),unlawful(Assem),place(Z),in(Assem,Z),master(X,Z),intention(X,allow_assembly),agent_of(Y,X),not(unknowing(Y,Assem)).
imprisonment(X,harbouring,0.5,0) :-  lawmustbechecked(8,158),someone(Y),custody(Y,X),is_assem(Assem),unlawful_Assem_mem(Y,Assem).
imprisonment(X,hiring_unlawful,0.5,0) :-  lawmustbechecked(8,159),someone(Y),hired(X, Y, unlawful_Assem),not(armed(X)).
imprisonment(X,hiring_unlawful,2,0) :-  lawmustbechecked(8,159),someone(Y),hired(X, Y, unlawful_Assem),armed(X).
imprisonment(X,affray,0.08333,100) :-  lawmustbechecked(8,160),someone(Y),affray(X,Y).
imprisonment(Y,affray,0.08333,100) :-  lawmustbechecked(8,160),someone(X),affray(X,Y).
imprisonment(X, Z, 777, 0) :- half_imprisonment(X,Z).
imprisonment(X, Z, 888, 0) :- quart_imprisonment(X,Z).
imprisonment(X, Z, 999, 0) :- eighth_imprisonment(X,Z).
imprisonment(X, Z, 1111, 0) :- death_penalty(X,Z).
imprisonment(X, Z, 15, 0) :- offence(X,Z).

/*
death_penalty(suspect,crime).
*/
death_penalty(X,war) :- lawmustbechecked(6,121),success_crime(war);(person(Y),abetment(X,Y)).
death_penalty(X,mutiny) :- lawmustbechecked(7,132),person(Y),didabet(X,Y),soldier(Y),success_crime(mutiny),not(soldier(X)).
