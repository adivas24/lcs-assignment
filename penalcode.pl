%CHAPTER IV
%GENERAL EXCEPTIONS

/*
76. Act done by a person bound, or by mistake of fact believing himself bound, by law.—
Nothing is an offence which is done by a person who is, or who by reason of a mistake of fact and not by
reason of a mistake of law in good faith believes himself to be, bound by law to do it.
79. Act done by a person justified, or by mistake of fact believing himself, justified, by law.—
Nothing is an offence which is done by any person who is justified by law, or who by reason of a mistake
of fact and not by reason of a mistake of law in good faith, believes himself to be justified by law, in
doing it.
*/
#######  mistake_of_fact and not mistake_of_law and believes (bound_law(X) or justified_law(X)) -> not offense.

/*
77. Act of Judge when acting judicially.—Nothing is an offence which is done by a Judge when
acting judicially in the exercise of any power which is, or which in good faith he believes to be, given to
him by law.
*/
#######    judge(X), justified_law(X) -> not offense.

/*
78. Act done pursuant to the judgment or order of Court.—Nothing which is done in pursuance
of, or which is warranted by the judgment or order of, a Court of Justice; if done whilst such judgment or
order remains in force, is an offence, notwithstanding the Court may have had no jurisdiction to pass such
judgment or order, provided the person doing the act in good faith believes that the Court had such
jurisdiction.
*/
#######    following_judgement(X) -> not offense.

/*
80. Accident in doing a lawful act.—Nothing is an offence which is done by accident or misfortune,
and without any criminal intention or knowledge in the doing of a lawful act in a lawful manner by lawful
means and with proper care and caution.
*/
#######    accident or misfortune  and not intention(X)-> not offense.


/*81. Act likely to cause harm, but done without criminal intent, and to prevent other harm.—
Nothing is an offence merely by reason of its being done with the knowledge that it is likely to cause
harm, if it be done without any criminal intention to cause harm, and in good faith for the purpose of
preventing or avoiding other harm to person or property.
*/
######     harm and not intention(X) and prevent_harm -> not offense.

/*
82. Act of a child under seven years of age.—Nothing is an offence which is done by a child under
seven years of age.
*/
######     under7(X) -> not offense.

/*
83. Act of a child above seven and under twelve of immature understanding.—Nothing is an
offence which is done by a child above seven years of age and under twelve, who has not attained
sufficient maturity of understanding to judge of the nature and consequences of his conduct on that
occasion.
*/
######      not under7(X) and under12(X) and immature(X) -> not offense.

/*
84. Act of a person of unsound mind.—Nothing is an offence which is done by a person who, at the
time of doing it, by reason of unsoundness of mind, is incapable of knowing the nature of the act, or that
he is doing what is either wrong or contrary to law.
*/
######      crazy(X) and unknowing(X) -> not offense.

/*
85. Act of a person incapable of judgment by reason of intoxication caused against his will.—
Nothing is an offence which is done by a person who, at the time of doing it, is, by reason of intoxication,
incapable of knowing the nature of the act, or that he is doing what is either wrong, or contrary to
law: provided that the thing which intoxicated him was administered to him without his knowledge or
against his will.
*/
######       intoxicated_against_will(X) and unknowing(X) -> not offense.

/*
86. Offence requiring a particular intent or knowledge committed by one who is intoxicated.—
In cases where an act done is not an offence unless done with a particular knowledge or intent, a person
who does the act in a state of intoxication shall be liable to be dealt with as if he had the same knowledge
as he would have had if he had not been intoxicated, unless the thing which intoxicated him was
administered to him without his knowledge or against his will.
*/
######       if(intention -> offense and not intention -> not offense) and intoxicated -> offense unless intoxicated_against_will(X) -> not offense

/*
87. Act not intended and not known to be likely to cause death or grievous hurt, done by
consent.—Nothing which is not intended to cause death, or grievous hurt, and which is not known by the
doer to be likely to cause death or grievous hurt, is an offence by reason of any harm which it may cause,
or be intended by the doer to cause, to any person, above eighteen years of age, who has given consent,
whether express or implied, to suffer that harm; or by reason of any harm which it may be known by the
doer to be likely to cause to any such person who has consented to take the risk of that harm.
*/
######     not harm(Y) and unknowing(X) or consent(Y) and not under18(Y) -> not offense

/*
88. Act not intended to cause death, done by consent in good faith for person's benefit.—
Nothing, which is not intented to cause death, is an offence by reason of any harm which it may cause, or
be intended by the doer to cause, or be known by the doer to be likely to cause, to any person for whose
benefit it is done in good faith, and who has given a consent, whether express or implied, to suffer that
harm, or to take the risk of that harm.
*/
######      not death_intention and consent(Y)-> not offense.

/*
89. Act done in good faith for benefit of child or insane person, by or by consent of guardian.—
Nothing which is done in good faith for the benefit of a person under twelve years of age, or of unsound
mind, by or by consent, either express or implied, of the guardian or other person having lawful charge of
that person, is an offence by reason of any harm which it may cause, or be intended by the doer to cause
or be known by the doer to be likely to cause to that person: Provided—
Provisos. First.—That this exception shall not extend to the intentional causing of death, or to the
attempting to cause death;
Secondly.—That this exception shall not extend to the doing of anything which the person doing
it knows to be likely to cause death, for any purpose other than the preventing of death or grievous
hurt, or the curing of any grievous disease or infirmity;
Thirdly.—That this exception shall not extend to the voluntary causing of grievous hurt, or to the
attempting to cause grievous hurt, unless it be for the purpose of preventing death or grievous hurt, or
the curing of any grievous disease or infirmity;
Fourthly.—That this exception shall not extend to the abetment of any offence, to the committing
of which offence it would not extend.
*/
######      benefit(Y) and (under12(Y) or crazy(Y)) and consent(guardian(Y)) -> not offense.
######      unless (death_intention or not unknowing(X) or abetment(offense)) and not save_life(Y).

/*
90. Consent known to be given under fear or misconception.—A consent is not such a consent as
is intended by any section of this Code, if the consent is given by a person under fear of injury, or under a
misconception of fact, and if the person doing the act knows, or has reason to believe, that the consent
was given in consequence of such fear or misconception; or
Consent of insane person.—if the consent is given by a person who, from unsoundness of mind, or
intoxication, is unable to understand the nature and consequence of that to which he gives his consent; or
Consent of child.—unless the contrary appears from the context, if the consent is given by a person
who is under twelve years of age.
*/
######      (consent(Y) and (fear(Y) or mistake_of_fact)) or under12(Y) or crazy(Y) or intoxicated(Y) -> not consent(Y)

/*
91. Exclusion of acts which are offences independently of harm cause.—The exceptions in
sections 87, 88 and 89 do not extend to acts which are offences independently of any harm which they
may cause, or be intended to cause, or be known to be likely to cause, to the person giving the consent, or
on whose behalf the consent is given.
*/
######       offense_ind_of_harm -> offense

/*
92. Act done in good faith for benefit of a person without consent.—Nothing is an offence by
reason of any harm which it may cause to a person for whose benefit it is done in good faith, even without
that person's consent, if the circumstances are such that it is impossible for that person to signify consent,
or if that person is incapable of giving consent, and has no guardian or other person in lawful charge of
him from whom it is possible to obtain consent in time for the thing to be done with benefit: Provided—
Provisos. First.—That this exception shall not extend to the intentional causing of death, or the
attempting to cause death;
Secondly.—That this exception shall not extend to the doing of anything which the person doing it
knows to be likely to cause death, for any purpose other than the preventing of death or grievous hurt, or
the curing of any grievous disease or infirmity;
Thirdly.—That this exception shall not extend to the voluntary causing of hurt, or to the attempting to
cause hurt, for any purpose other than the preventing of death or hurt;
Fourthly.—That this exception shall not extend to the abetment of any offence, to the committing of
which offence it would not extend.
*/
######       benefit(Y) and if(imp_consent(Y) -> not consent(Y)) and not death_intention and not intention(X) and not abetment(offense)-> not offense

/*
93. Communication made in good faith.—No communication made in good faith is an offence by
reason of any harm to the person to whom it is made, if it is made for the benefit of that person.
*/
######      communicate(X,Y) and benefit(Y) -> not offense


/*
94. Act to which a person is compelled by threats.—Except murder, and offences against the State
punishable with death, nothing is an offence which is done by a person who is compelled to do it by
threats, which, at the time of doing it, reasonably cause the apprehension that instant death to that person
will otherwise be the consequence: Provided the person doing the act did not of his own accord, or from a
reasonable apprehension of harm to himself short of instant death, place himself in the situation by which
he became subject to such constraint.
*/
######      not murder(X,Y) and not death_penalty(X) and death_threat(X) and not intention(X) -> not offense

/*
95. Act causing slight harm.—Nothing is an offence by reason that it causes, or that it is intended to
cause, or that it is known to be likely to cause, any harm, if that harm is so slight that no person of
ordinary sense and temper would complain of such harm.
*/
######      not harm  -> not offense

%Of the Right of Private Defence
/*
96. Things done in private defence.—Nothing is an offence which is done in the exercise of the
right of private defence.
*/
######      private_def(Y) -> not offense

/*
97. Right of private defence of the body and of property.—Every person has a right, subject to the
restrictions contained in section 99, to defend—
First.—His own body, and the body of any other person, against any offence affecting the human
body;
Secondly.—The property, whether movable or immovable, of himself or of any other person, against
any act which is an offence falling under the defintion of theft, robbery, mischief or criminal trespass, or
which is an attempt to commit theft, robbery, mischief or criminal trespass.
*/
######      offense and harm or prop_theft -> private_def(Y)

/*
98. Right of private defence against the act of a person of unsound mind, etc.—When an act,
which would otherwise be a certain offence, is not that offence, by reason of the youth, the want of
maturity of understanding, the unsoundness of mind or the intoxication of the person doing that act, or by
reason of any misconception on the part of that person, every person has the same right of private defence
against that act which he would have if the act were that offence.
*/
######      not offense and (under12(X) or immature(X) or crazy(X)) -> private_def(Y)

/*
99. Acts against which there is no right of private defence.—There is no right of private defence
against an act which does not reasonably cause the apprehension of death or of grievous hurt, if done, or
attempted to be done, by a public servant acting in good faith under colour of his office, though that act,
may not be strictly justifiable by law.
There is no right of private defence against an act which does not reasonably cause the apprehension
of death or of grievous hurt, if done, or attempted to be done, by the direction of a public servant acting in
good faith under colour of his office, though that direction may not be strictly justifiable by law.
There is no right of private defence in cases in which there is time to have recourse to protection of
the public authorities.
Extent to which the right may be exercised.—The right of private defence in no case extends to the
inflicting of more harm than it is necessary to inflict for the purpose of defence.
Explanation 1.—A person is not deprived of the right of private defence against an act done, or
attempted to be done, by a public servant, as such, unless he knows or has reason to believe, that the
person doing the act is such public servant.
Explanation 2.—A person is not deprived of the right of private defence against an act done, or
attempted to be done, by the direction of a public servant, unless he knows, or has reason to believe, that
the person doing the act is acting by such direction, or unless such person states the authority under which
he acts, or if he has authority in writing, unless he produces such authority, if demanded.
*/
######      not harm(Y) or (public_servant(X) and benefit(Y)) -> not private_def(Y)

/*
100. When the right of private defence of the body extends to causing death.—The right of
private defence of the body extends, under the restrictions mentioned in the last preceding section, to the
voluntary causing of death or of any other harm to the assailant, if the offence which occasions the
exercise of the right be of any of the descriptions hereinafter enumerated, namely:—
First.—Such an assault as may reasonably cause the apprehension that death will otherwise be the
consequence of such assault;
Secondly.—Such an assault as may reasonably cause the apprehension that grievous hurt will
otherwise be the consequence of such assault;
Thirdly.—An assault with the intention of committing rape;
Fourthly.—An assault with the intention of gratifying unnatural lust;
Fifthly.—An assault with the intention of kidnapping or abducting;
Sixthly.—An assault with the intention of wrongfully confining a person, under circumstances which
may reasonably cause him to apprehend that he will be unable to have recourse to the public authorities
for his release.
Seventhly.—An act of throwing or administering acid or an attempt to throw or administer acid
which may reasonably cause the apprehension that grievous hurt will otherwise be the consequence of
such act
*/
######      murder(Y,X) and (death_threat(Y) or rape(X,Y) or kidnapping or confinement or acid(X,Y)) -> private_def(Y)

/*
101. When such right extends to causing any harm other than death.—If the offence be not of
any of the descriptions enumerated in the last preceding section, the right of private defence of the body
does not extend to the voluntary causing of death to the assailant, but does extend, under the restrictions
mentioned in section 99, to the voluntary causing to the assailant of any harm other than death.
*/
######      murder(Y,X) not (death_threat(Y) or rape(X,Y) or kidnapping or confinement or acid(X,Y)) -> not private_def(Y)

/*
102. Commencement and continuance of the right of private defence of the body.—The right of
private defence of the body commences as soon as a reasonable apprehension of danger to the body arises
from an attempt or threat to commit the offence though the offence may not have been committed; and it
continues as long as such apprehension of danger to the body continues.
*/
######      Requires temporal system

/*
103. When the right of private defence of property extends to causing death.—The right of
private defence of property extends, under the restrictions mentioned in section 99, to the voluntary
causing of death or of any other harm to the wrong-doer, if the offence, the committing of which, or the
attempting to commit which, occasions the exercise of the right, be an offence of any of the descriptions
hereinafter enumerated, namely:—
First.—Robbery;
Secondly.—House-breaking by night;
Thirdly.—Mischief by fire committed on any building, tent or vessel, which building, tent or vessel is
used as a human dwelling, or as a place for the custody of property;
Fourthly.—Theft, mischief, or house-trespass, under such circumstances as may reasonably cause
apprehension that death or grievous hurt will be the consequence, if such right of private defence is not
exercised.
*/
######      murder(Y,X) and prop_theft and arson -> private_def(Y)

/*
104. When such right extends to causing any harm other than death.—If the offence, the
committing of which, or the attempting to commit which occasions the exercise of the right of private
defence, be theft, mischief, or criminal trespass, not of any of the descriptions enumerated in the last
preceding section, that right does not extend to the voluntary causing of death, but does extend, subject to
the restrictions mentioned in section 99, to the voluntary causing to the wrong-doer of any harm other
than death.
*/
######      not murder(Y,X) and prop_theft -> private_def(Y)

/*
105. Commencement and continuance of the right of private defence of property.—The right of
private defence of property commences when a reasonable apprehension of danger to the property commences.
The right of private defence of property against theft continues till the offender has effected his retreat
with the property or either the assistance of the public authorities is obtained, or the property has been recovered.
The right of private defence of property against robbery continues as long as the offender causes or
attempts to cause to any person death or hurt or wrongful restraint or as long as the fear of instant death or
of instant hurt or of instant personal restraint continues.
The right of private defence of property against criminal trespass or mischief continues as long as the
offender continues in the commission of criminal trespass or mischief.
The right of private defence of property against house-breaking by night continues as long as the
house-trespass which has been begun by such house-breaking continues.
*/
######      Temporal model required

/*
106. Right of private defence against deadly assault when there is risk of harm to innocent
person.—If in the exercise of the right of private defence against an assault which reasonably causes the
apprehension of death, the defender be so situated that he cannot effectually exercise that right without
risk of harm to an innocent person, his right of private defence extends to the running of that risk.
Illustration
A is attacked by a mob who attempt to murder him. He cannot effectually exercise his right of private defence without firing
on the mob, and he cannot fire without risk of harming young children who are mingled with the mob. A commits no offence if
by so firing he harms any of the children.
*/
######      murder(Y,Z) and innocent(Z) and death_threat(Y) -> private_def(Y)

%CHAPTER V
%OF ABETMENT
/*
107. Abetment of a thing.—A person abets the doing of a thing, who—
First.—Instigates any person to do that thing; or
Secondly.—Engages with one or more other person or persons in any conspiracy for the doing of that
thing, if an act or illegal omission takes place in pursuance of that conspiracy, and in order to the doing of
that thing; or
Thirdly.—Intentionally aids, by any act or illegal omission, the doing of that thing.
Explanation 1.—A person who, by wilful misrepresentation, or by wilful concealment of a material
fact which he is bound to disclose, voluntarily causes or procures, or attempts to cause or procure, a thing
to be done, is said to instigate the doing of that thing.
Illustration
A, a public officer, is authorised by a warrant from a Court of Justice to apprehend Z, B, knowing that fact and also that C is
not Z, wilfully represents to A that C is Z, and thereby intentionally causes A to apprehend C. Here B abets by instigation the
apprehension of C.
Explanation 2.—Whoever, either prior to or at the time of the commission of an act, does anything in
order to facilitate the commission of that act, and thereby facilitates the commission thereof, is said to aid
the doing of that act.
*/
######      instigation or conspiracy or not unknowing -> abetment(_)
######      wilful and (misrepresentation or concealment) -> instigation

/*
108. Abettor.—A person abets an offence, who abets either the commission of an offence, or the
commission of an act which would be an offence, if committed by a person capable by law of committing
an offence with the same intention or knowledge as that of the abettor.
Explanation 1.—The abetment of the illegal omission of an act may amount to an offence although
the abettor may not himself be bound to do that act.
Explanation 2.—To constitute the offence of abetment it is not necessary that the act abetted should
be committed, or that the effect requisite to constitute the offence should be caused.
Explanation 3.—It is not necessary that the person abetted should be capable by law of committing an
offence, or that he should have the same guilty intention or knowledge as that of the abettor, or any guilty
intention or knowledge.
Explanation 4.—The abetment of an offence being an offence, the abetment of such an abetment is
also an offence.
Explanation 5.—It is not necessary to the commission of the offence of abetment by conspiracy that
the abettor should concert the offence with the person who commits it. It is sufficient if he engages in the
conspiracy in pursuance of which the offence is committed.
108A. Abetment in India of offences outside India.—A person abets an offence within the
meaning of this Code who, in India, abets the commission of any act without and beyond India
which would constitute an offence if committed in India.
*/
######      not under7(X) and not crazy(X) and not immature(X) and abetment(X) -> abettor(X)
######      not offense and abetment -> offense
######      abetment -> offense
######      abetment(abetment) -> abetment

/*
109. Punishment of abetment if the act abetted is committed in consequence and where no
express provision is made for its punishment.—Whoever abets any offence shall, if the act abetted is
committed in consequence of the abetment, and no express provision is made by this Code for the
punishment of such abetment, be punished with the punishment provided for the offence.
Explanation.—An act or offence is said to be committed in consequence of abetment, when it is
committed in consequence of the instigation, or in pursuance of the conspiracy, or with the aid which
constitutes the abetment.
*/
######      abettor(X) -> offense

/*
110. Punishment of abetment if person abetted does act with different intention from that of
abettor.—Whoever abets the commission of an offence shall, if the person abetted does the act with a
different intention or knowledge from that of the abettor, be punished with the punishment provided for
the offence which would have been committed if the act had been done with the intention or knowledge
of the abettor and with no other.
*/
#######

/*
111. Liability of abettor when one act abetted and different act done.—When an Act is abetted
and a different act is done, the abettor is liable for the act done, in the same manner and to the same extent
as if he had directly abetted it:
Provided the act done was a probable consequence of the abetment, and was committed under the
influence of the instigation, or with the aid or in pursuance of the conspiracy which constituted the
abetment.
*/
######      abetment(X) and Y and (abetment(X) -> Y) -> abetment(Y)

/*
112. Abettor when liable to cumulative punishment for act abetted and for act done.—If the act
for which the abettor is liable under the last preceding section is committed in addition to the act abetted,
and constitute a distinct offence, the abettor is liable to punishment for each of the offences.
*/
######      I think this is covered in the previous point

/*
113. Liability of abettor for an effect caused by the act abetted different from that intended by
the abettor.—When an act is abetted with the intention on the part of the abettor of causing a particular
effect, and an act for which the abettor is liable in consequence of the abetment, causes a different effect
from that intended by the abettor, the abettor is liable for the effect caused, in the same manner and to the
same extent as if he had abetted the act with the intention of causing that effect, provided he knew that the
act abetted was likely to cause that effect.
*/
######      abetment(X) and abettor(Z) and (X-> Y) and not unknowing(Z)-> abetment(X and Y)

/*
114. Abettor present when offence is committed.—Whenever any person, who is absent would be
liable to be punished as an abettor, is present when the act or offence for which he would be punishable in
consequence of the abetment is committed, he shall be deemed to have committed such act or offence.
*/
######      abettor(X) and isPresent(X) -> offense not abetment

/*
115. Abetment of offence punishable with death or imprisonment for life.—if offence not
committed.—Whoever abets the commission of an offence punishable with death or imprisonment for
life, shall, if that offence be not committed in consequence of the abetment, and no express provision is
made by this Code for the punishment of such abetment, be punished with imprisonment of either
description for a term which may extend to seven years, and shall also be liable to fine;
if act causing harm be done in consequence.—and if any act for which the abettor is liable in
consequence of the abetment, and which causes hurt to any person, is done, the abettor shall be liable to
imprisonment of either description for a term which may extend to fourteen years, and shall also be liable
to fine.
*/
######      abettor(X) and death_penalty(X) and not offense and not harm-> imprisonment_7-fine(X)
######      abettor(X) and death_penalty(X) and not offense and harm-> imprisonment_14-fine(X)

/*
116. Abetment of offence punishable with imprisonment—if offence be not committed.—
Whoever abets an offence punishable with imprisonment shall, if that offence be not committed in
consequence of the abetment, and no express provision is made by this Code for the punishment of such
abetment, be punished with imprisonment of any description provided for that offence for a term which
may extend to one-fourth part of the longest term provided for that offence; or with such fine as is
provided for that offence, or with both;
if abettor or person abetted be a public servant whose duty it is to prevent offence.—and if the
abettor or the person abetted is a public servant, whose duty it is to prevent the commission of such
offence, the abettor shall be punished with imprisonment of any description provided for that offence, for
a term which may extend to one-half of the longest term provided for that offence, or with such fine as is
provided for the offence, or with both.
*/

#######       abettor(X) and abetted(Y) and not offense and not public_servant(X) and not public-servant(Y)-> quart-fine(X)
#######       abettor(X) and abetted(Y) and not offense and public_servant(X) or public_servant(Y)-> half-fine(X)

/*
117. Abetting commission of offence by the public or by more than ten persons.—Whoever abets
the commission of an offence by the public generally or by any number or class of persons exceeding ten,
shall be punished with imprisonment of either description for a term which may extend to three years, or
with fine, or with both.
*/
######      abettor(X) and abetted(List[Y]) and Y > 10 -> imprisonment_3-fine(X)

/*
118. Concealing design to commit offence punishable with death or imprisonment for life.—
Whoever intending to facilitate or knowing it to be likely that he will thereby facilitate the commission of
an offence punishable with death or imprisonment for life, voluntarily conceals by any act or illegal
omission, or by the use of encryption or any other information hiding tool, the existence of a design to
commit such offence or makes any representation which he knows to be false respecting such design,
if offence be committed; if offence be not committed.—shall, if that offence be committed, be
punished with imprisonment of either description for a term which may extend to seven years, or, if the
offence be not committed, with imprisonment of either description, for a term which may extend to three
years; and in either case shall also be liable to fine.
Illustration
A, knowing that dacoity is about to be committed at B, falsely informs the Magistrate that a dacoity is about to be committed
at C, a place in an opposite direction, and thereby misleads the Magistrate with intent to facilitate the commission of the offence.
The dacoity is committed at B in pursuance of the design. A is punishable under this section.
*/
######  abettor(X) and misleading and offense and death_penalty(X)-> imprisonment_7-fine(X).
######  abettor(X) and misleading and not offense and death_penalty(X) -> imprisonment_3-fine(X).

/*
119. Public servant concealing design to commit offence which it is his duty to prevent.—
Whoever, being a public servant intending to facilitate or knowing it to be likely that he will thereby
facilitate the commission of an offence which it is his duty as such public servant to prevent,
voluntarily conceals, by any act or illegal omission or by the use of encryption or any other
information hiding tool, the existence of a design to commit such offence, or makes any representation
which he knows to be false respecting such design,
if offence be committed.—shall, if the offence be committed, be punished with imprisonment of any
description provided for the offence, for a term which may extend to one-half of the longest term of such
imprisonment, or with such fine as is provided for that offence, or with both;
if offence be punishable with death, etc.—or, if the offence be punishable with death or
imprisonment for life, with imprisonment of either description for a term which may extend to ten
years;
if offence be not committed.—or, if the offence be not committed, shall be punished with
imprisonment of any description provided for the offence for a term which may extend to one-fourth part
of the longest term of such imprisonment or with such fine as is provided for the offence, or with both.
*/
######      abettor(X) and public_servant(X) and misleading and offense and not death_penalty(X) -> half-fine(X)
######      abettor(X) and public_servant(X) and misleading and offense and death_penalty(X) -> imprisonment_10-fine(X)
######      abettor(X) and public_servant(X) and misleading and not offense and not death_penalty(X) -> quart-fine(X)

/*
120. Concealing design to commit offence punishable with imprisonment.—Whoever, intending
to facilitate or knowing it to be likely that he will thereby facilitate the commission of an offence
punishable with imprisonment,
voluntarily conceals, by any act or illegal omission, the existence of a design to commit such offence, or
makes any representation which he knows to be false respecting such design,
if offence be committed; if offence be not committed.—shall, if the offence be committed, be
punished with imprisonment of the description provided for the offence, for a term which may extend to
one-fourth, and, if the offence be not committed, to one-eight, of the longest term of such imprisonment,
or with such fine as is provided for the offence, or with both.
*/
#######     abettor(X) and misleading and not death_penalty(X) and offense-> quart-fine(X).
#######     abettor(X) and misleading and not death_penalty(X) and not offense -> eighth-fine(X)



%CHAPTER VA
%CRIMINAL CONSPIRACY
/*
120A. Definition of criminal conspiracy.—When two or more persons agree to do, or cause to be
done,—
(1) an illegal act, or
(2) an act which is not illegal by illegal means, such an agreement is designated a criminal
conspiracy:
Provided that no agreement except an agreement to commit an offence shall amount to a criminal
conspiracy unless some act besides the agreement is done by one or more parties to such agreement in
pursuance thereof.
Explanation.—It is immaterial whether the illegal act is the ultimate object of such agreement, or is
merely incidental to that object.
*/
######      agreement(X,Y) and intention(X) and intention(Y) -> criminal_conspiracy

/*
120B. Punishment of criminal conspiracy.—(1) Whoever is a party to a criminal conspiracy to
commit an offence punishable with death, imprisonment for life or rigorous imprisonment for a term of
two years or upwards, shall, where no express provision is made in this Code for the punishment of such a
conspiracy, be punished in the same manner as if he had abetted such offence.
(2) Whoever is a party to a criminal conspiracy other than a criminal conspiracy to commit an offence
punishable as aforesaid shall be punished with imprisonment of either description for a term not
exceeding six months, or with fine or with both.
*/
######      criminal_conspiracy and death_penalty(X) -> abetment(X)
######      criminal_conspiracy and not death_penalty(X) -> imprisonment_6m-fine(X)



%CHAPTER VI
%OF OFFENCES AGAINST THE STATE
/*
121. Waging, or attempting to wage war, or abetting waging of war, against the Government of
India.—Whoever wages war against the Government of India, or attempts to wage such war, or abets
the waging of such war, shall be punished with death, or imprisonment for life and shall also be liable
to fine.
*/
######      waging_war(X, india) and not criminal_conspiracy-> death_penalty(X)

/*
121A. Conspiracy to commit offences punishable by section 121.—Whoever within or without
India conspires to commit any of the offences punishable by section 121, or conspires to
overawe, by means of criminal force or the show of criminal force, the Central Government or any
State Government , shall be punished with imprisonment for life, or with imprisonment of
either description which may extend to ten years, and shall also be liable to fine.
Explanation.—To constitute a conspiracy under this section, it is not necessary that any act or illegal
omission shall take place in pursuance thereof.
*/
######      waging war(X, india) and criminal_conspiracy -> life_imprisonment(X)

/*
122. Collecting arms, etc., with intention of waging war against the Government of India.—
Whoever collects men, arms or ammunition or otherwise prepares to wage war with the intention of either
waging or being prepared to wage war against the Government of India, shall be punished with
imprisonment for life or imprisonment of either description for a term not exceeding ten years, and
shall also be liable to fine.
*/
######      intent_waging_war(X, india) -> life_imprisonment(X)

/*
123. Concealing with intent to facilitate design to wage war.—Whoever by any act, or by any
illegal omission, conceals the existence of a design to wage war against the Government of India,
intending by such concealment to facilitate, or knowing it to be likely that such concealment will
facilitate, the waging of such war, shall be punished with imprisonment of either description for a term
which may extend to ten years, and shall also be liable to fine.
*/
######      intent_waging_war(Y, india) and concealment(X,Y) -> imprisonment_10-fine(X)

/*
124. Assaulting President, Governor, etc., with intent to compel or restrain the exercise of any
lawful power.—Whoever, with the intention of inducing or compelling the President of India, or
Governor of any State, to exercise or refrain from exercising in any manner any
any of the lawful powers of such President or Governor 6,
assaults or wrongfully restrains, or attempts wrongfully to restrain, or overawes, by means of criminal
force or the show of criminal force, or attempts so to overawe, such President or Governor 6,
shall be punished with imprisonment of either description for a term which may extend to seven
years, and shall also be liable to fine.
*/
######      assault(X,Y) and vvvip(Y) and intention(X) -> imprisonment_7-fine(X)

/*
124A. Sedition.—Whoever by words, either spoken or written, or by signs, or by visible
representation, or otherwise, brings or attempts to bring into hatred or contempt, or excites or attempts to
excite disaffection towards, the Government established by law in, shall be punished
with imprisonment for life, to which fine may be added, or with imprisonment which may extend to
three years, to which fine may be added, or with fine.
Explanation 1.—The expression “disaffection” includes disloyalty and all feelings of enmity.
Explanation 2.—Comments expressing disapprobation of the measures of the Government with a
view to obtain their alteration by lawful means, without exciting or attempting to excite hatred, contempt
or disaffection, do not constitute an offence under this section.
Explanation 3.—Comments expressing disapprobation of the administrative or other action of the
Government without exciting or attempting to excite hatred, contempt or disaffection, do not constitute an
offence under this section.
*/
######      intention(X) and spread_hatred(X) -> life_imprisonment(X)

/*
125. Waging war against any Asiatic Power in alliance with the Government of India.—
Whoever wages war against the Government of any Asiatic Power in alliance or at peace with the
Government of India or attempts to wage such war, or abets the waging of such war, shall be punished
with imprisonment for life, to which fine may be added, or with imprisonment of either description for
a term which may extend to seven years, to which fine may be added, or with fine.
*/
######      waging_war(X,Y) and asiatic_alliance(Y,india) -> life_imprisonment(X)

/*
126. Committing depredation on territories of Power at peace with the Government of India.—
Whoever commits depredation, or makes preparations to commit depredation, on the territories of any
Power in alliance or at peace with the Government of India, shall be punished with imprisonment of
either description for a term which may extend to seven years, and shall also be liable to fine and to
forfeiture of any property used or intended to be used in committing such depredation, or acquired by
such depredation.
*/
######      waging_war(X,Y) and atPeace(Y, india) -> imprisonment_7-fine(X)

/*
127. Receiving property taken by war or depredation mentioned in sections 125 and 126.—
Whoever receives any property knowing the same to have been taken in the commission of any of the
offences mentioned in sections 125 and 126, shall be punished with imprisonment of either description
for a term which may extend to seven years, and shall also be liable to fine and to forfeiture of the
property so received.
*/
######      receive_plundered_property(X) -> imprisonment_7-fine(X)

/*
128. Public servant voluntarily allowing prisoner of state or war to escape.—Whoever, being a
public servant and having the custody of any State prisoner or prisoner of war, voluntarily allows such
prisoner to escape from any place in which such prisoner is confined, shall be punished with
imprisonment for life, or imprisonment of either description for a term which may extend to ten years,
and shall also be liable to fine.
*/
######      public_servant(X) and custody(X,Y) and prisoner(Y) and escapes(Y) and intention(X) -> life_imprisonment(X)

/*
129. Public servant negligently suffering such prisoner to escape.—Whoever, being a public
servant and having the custody of any State prisoner or prisoner of war, negligently suffers such prisoner
to escape from any place of confinement in which such prisoner is confined, shall be punished with
simple imprisonment for a term which may extend to three years, and shall also be liable to fine.
*/
######      public_servant(X) and custody(X,Y) and prisoner(Y) and escapes(Y) and not intention(X) -> imprisonment_3-fine(X)

/*
130. Aiding escape of, rescuing or harbouring such prisoner.—Whoever knowingly aids or assists
any State prisoner or prisoner of war in escaping from lawful custody, or rescues or attempts to rescue
any such prisoner, or harbours or conceals any such prisoner who has escaped from lawful custody, or
offers or attempts to offer any resistance to the recapture of such prisoner, shall be punished with
imprisonment for life, or with imprisonment of either description for a term which may extend to ten
years, and shall also be liable to fine.
Explanation.—A State prisoner or prisoner of war, who is permitted to be at large on his parole
within certain limits in India, is said to escape from lawful custody if he goes beyond the limits within
which he is allowed to be at large.
*/
######      (escapes(X) or concealment(Y,X)) and prisoner(X) and intention(Y) -> life_imprisonment


%CHAPTER VII
%OF OFFENCES RELATING TO THE ARMY, NAVY AND AIR FORCE

/*
131. Abetting mutiny, or attempting to seduce a soldier, sailor or airman from his duty.—
Whoever abets the committing of mutiny by an officer, soldier, sailor or airman, in the Army, Navy
or Air Force of the Government of India or attempts to seduce any such officer, soldier, sailor or
airman from his allegiance or his duty, shall be punished with imprisonment for life, or with
imprisonment of either description for a term which may extend to ten years, and shall also be liable to
fine.
Explanation.—In this section the words “officer”, “soldier”, “sailor” and “airman” include any
any person subject to the Army Act, the Army Act, 1950 (46 of 1950), the Naval Discipline Act, the
the Indian Navy (Discipline) Act,1934 (34 of 1934) the Air Force Act or the Air Force Act,
1950 (45 of 1950), as the case may be.
*/
######      (abetment(X,Y, mutiny) or seduce(X,Y)) and soldier(Y) and not mutiny_happens and not soldier(X)-> life_imprisonment(X).

/*
132. Abetment of mutiny, if mutiny is committed in consequence thereof.—Whoever abets the
committing of mutiny by an officer, soldier, sailor or airman, in the Army, Navy or Air Force of the
Government of India, shall, if mutiny be committed in consequence of that abetment, be punished with
death or with imprisonment for life, or imprisonment of either description for a term which may
extend to ten years, and shall also be liable to fine.
*/
######      abetment(X,Y, mutiny) and soldier(Y) and mutiny_happens  and not soldier(X) -> death_penalty(X).

/*
133. Abetment of assault by soldier, sailor or airman on his superior officer, when in execution
of his office.—Whoever abets an assault by an officer, soldier, sailor or airman, in the Army, Navy or
Air Force of the Government of India, on any superior officer being in the execution of his office,
shall be punished with imprisonment of either description for a term which may extend to three years, and
shall also be liable to fine.
*/
######      abetment(X,Y, assault_superior) and soldier(Y) and not assault_superior_happens  and not soldier(X) -> imprisonment_3-fine(X)

/*
134. Abetment of such assault, if the assault committed.—Whoever abets an assault by an officer,
soldier, sailor or airman, in the Army, Navy or Air Force of the Government of India, on any
superior officer being in the execution of his office, shall, if such assault be committed in consequence of
that abetment be punished with imprisonment of either description for a term which may extend to seven
years, and shall also be liable to fine.
*/
######      abetment(X,Y, assault_superior) and soldier(Y) and assault_superior_happens and not soldier(X) -> imprisonment_7-fine(X)

/*
135. Abetment of desertion of soldier, sailor or airman.—Whoever, abets the desertion of any
officer, soldier, sailor or airman, in the Army, Navy or Air Force of the Government of India,
shall be punished with imprisonment of either description for a term which may extend to two years, or
with fine, or with both.
*/
######      abetment(X,Y, desertion) and soldier(Y) and not soldier(X) -> imprisonment_2-fine(X)

/*
136. Harbouring deserter.—Whoever, except as hereinafter excepted, knowing or having reason to
believe that an officer, soldier, sailor or airman, in the Army, Navy or Air Force of the
Government of India, has deserted, harbours such officer, soldier, sailor or airman, shall be
punished with imprisonment of either description for a term which may extend to two years, or with fine
or with both.
Exception.—This provision does not extend to the case in which the harbour is given by a wife to her
husband.
*/
######      soldier(X) and deserted(X) and custody(Y,X) and not husband(X,Y) and not soldier(X) -> imprisonment_2-fine(X)

/*
137. Deserter concealed on board merchant vessel through negligence of master.—The master or
person in charge of a merchant vessel, on board of which any deserter from the Army, Navy or Air
Force of the Government of India is concealed, shall, though ignorant of such concealment, be liable
to a penalty not exceeding five hundred rupees, if he might have known of such concealment but for some
neglect of his duty as such master or person in charge, or but for some want of discipline on board of the
vessel.
*/
######      master(V, X) and in(Y,V) and soldier(Y) and deserted(Y) and unknowing(X) and not soldier(X) -> fine500(X)

/*
138. Abetment of act of insubordination by soldier, sailor or airman.—Whoever abets what he
knows to be an act of insubordination by an officer, soldier, sailor or airman, in the Army, Navy or air
Force, of the Government of India, shall, if such act of insubordination be committed in consequence
of that abetment, be punished with imprisonment of either description for a term which may extend to six
months, or with fine, or with both.
*/

######      abetment(X,Y, insubordination) and soldier(Y) and insubordination_happened and not soldier(X) -> imprisonment_6m-fine(X)

/*
139. Persons subject to certain Acts.—No person subject to the Army Act, the Army Act, 1950
(46 of 1950), the Naval Discipline Act, the Indian Navy (Discipline) Act, 1934 (34 of 1934),
the Air Force Act or the Air Force Act, 1950 (45 of 1950), is subject to punishment under this Code
Code for any of the offences defined in this Chapter.
*/
######      Added not soldier to all rules above

/*
140. Wearing garb or carrying token used by soldier, sailor or airman.—Whoever, not being a
soldier, sailor or airman in the Military, Naval or Air service of the Government of India, wears
any garb or carries any token resembling any garb or token used by such a soldier, sailor or airman with
the intention that it may be believed that he is such a soldier, sailor or airman, shall be punished with
imprisonment of either description for a term which may extend to three months, or with fine which may
extend to five hundred rupees, or with both.
*/
######       not soldier(X) and wears_military_token(X) -> imprisonment_3m-fine(X)


%CHAPTER VIII
%OF OFFENCES AGAINST THE PUBLIC TRANQUILLITY

/*
141. Unlawful assembly.—An assembly of five or more persons is designated an “unlawful
assembly”, if the common object of the persons composing that assembly is—
First.—To overawe by criminal force, or show of criminal force, the Central or any State
Government or Parliament or the Legislature of any State, or any public servant in the exercise of the
lawful power of such public servant; or
Second.—To resist the execution of any law, or of any legal process; or
Third.—To commit any mischief or criminal trespass, or other offence; or
Fourth.—By means of criminal force, or show of criminal force, to any person, to take or obtain
possession of any property, or to deprive any person of the enjoyment of a right of way, or of the use of
water or other incorporeal right of which he is in possession or enjoyment, or to enforce any right or
supposed right; or
Fifth.—By means of criminal force, or show of criminal force, to compel any person to do what he is
not legally bound to do, or to omit to do what he is legally entitled to do.
Explanation.—An assembly which was not unlawful when it assembled, may subsequently become
an unlawful assembly.
*/
######      assem.length >= 5 and (assault or resist_law or mischief or robbery or abetment(X, _, Crime)) -> unlawful(assem)

/*
142. Being member of unlawful assembly.—Whoever, being aware of facts which render any
assembly an unlawful assembly, intentionally joins that assembly, or continues in it, is said to be a
member of an unlawful assembly.
*/
######      member(X, assem) and unlawful(assem) -> unlawful_assem_mem(X)

/*
143. Punishment.—Whoever is a member of an unlawful assembly, shall be punished with
imprisonment of either description for a term which may extend to six months, or with fine, or with both.
*/
######      unlawful_assem_mem(X) and not armed(X) -> imprisonment_6m-fine(X)

/*
144. Joining unlawful assembly armed with deadly weapon.—Whoever, being armed with any
deadly weapon, or with anything which, used as a weapon of offence, is likely to cause death, is a
member of an unlawful assembly, shall be punished with imprisonment of either description for a term
which may extend to two years, or with fine, or with both.
*/
######      unlawful_assem_mem(X) and armed(X) -> imprisonment_2-fine(X)

/*
145. Joining or continuing in unlawful assembly, knowing it has been commanded to
disperse.—Whoever joins or continues in an unlawful assembly, knowing that such unlawful assembly
has been commanded in the manner prescribed by law to disperse, shall be punished with imprisonment
of either description for a term which may extent to two years, or with fine, or with both.
*/
######      unlawful_assem_mem(X) and commanded_to_disperse(assem) -> imprisonment_2-fine(X)

/*
146. Rioting.—Whenever force or violence is used by an unlawful assembly, or by any member
thereof, in prosecution of the common object of such assembly, every member of such assembly is guilty
of the offence of rioting.
*/
######      violence(assem) and unlawful(assem) and member(X,assem) -> rioting(X)

/*
147. Punishment for rioting.—Whoever is guilty of rioting, shall be punished with imprisonment of
either description for a term which may extend to two years, or with fine, or with both.
*/
######      rioting(X) -> imprisonment_2-fine(X)

/*
148. Rioting, armed with deadly weapon.—Whoever is guilty of rioting, being armed with a deadly
weapon or with anything which, used as a weapon of offence, is likely to cause death, shall be punished
with imprisonment of either description for a term which may extend to three years, or with fine, or with
both.
*/
######      rioting(X) and armed(X) -> imprisonment_3-fine(X)

/*
149. Every member of unlawful assembly guilty of offence committed in prosecution of common
object.—If an offence is committed by any member of an unlawful assembly in prosecution of the
common object of that assembly, or such as the members of that assembly knew to be likely to be
committed in prosecution of that object, every person who, at the time of the committing of that offence,
is a member of the same assembly, is guilty of that offence.
*/
######      unlawful_assem_mem(X) and offence(X) and unlawful_assem_mem(Y) and intention(Y) -> offense(Y)

/*
150. Hiring, or conniving at hiring, of persons to join unlawful assembly.—Whoever hires or
engages, or employs, or promotes, or connives at the hiring, engagement or employment of any person to
join or become a member of any unlawful assembly, shall be punishable as a member of such unlawful
assembly, and for any offence which may be committed by any such person as a member of such
unlawful assembly in pursuance of such hiring, engagement or employment, in the same manner as if he
had been a member of such unlawful assembly, or himself had committed such offence.
*/
######      I did not understand this law.

/*
151. Knowingly joining or continuing in assembly of five or more persons after it has been
commanded to disperse.—Whoever knowingly joins or continues in any assembly of five or more
persons likely to cause a disturbance of the public peace, after such assembly has been lawfully
commanded to disperse, shall be punished with imprisonment of either description for a term which may
extend to six months, or with fine, or with both.
Explanation.—If the assembly is an unlawful assembly within the meaning of section 141, the
offender will be punishable under section 145.
*/
######      commanded_to_disperse(assem) and member(X, assem) and not unlawful(assem)-> imprisonment_6m-fine(X)

/*
152. Assaulting or obstructing public servant when suppressing riot, etc.—Whoever assaults or
threatens to assault, or obstructs or attempts to obstruct, any public servant in the discharge of his duty as
such public servant, in endeavouring to disperse an unlawful assembly, or to suppress a riot or affray, or
uses, or threatens, or attempts to use criminal force to such public servant, shall be punished with
imprisonment of either description for a term which may extend to three years, or with fine, or with both.
*/
######      assaults(X,Y) and public_servant(Y) and suppress_riot(Y) -> imprisonment_3-fine(X)

/*
153. Wantonly giving provocation with intent to cause riot—if rioting be committed; if not
committed.—Whoever malignantly, or wantonly by doing anything which is illegal, gives provocation to
any person intending or knowing it to be likely that such provocation will cause the offence of rioting to
be committed, shall, if the offence of rioting be committed in consequence of such provocation, be
punished with imprisonment of either description for a term which may extend to one year, or with fine,
or with both; and if the offence of rioting be not committed, with imprisonment of either description for a
term which may extend to six months, or with fine, or with both.
*/
######      rioting(X) and incite_riot(Y,X) -> imprisonment_1-fine(Y)
######      not rioting(X) and incite_riot(Y,X) -> imprisonment_6m-fine(Y)

/*
153A. Promoting enmity between different groups on ground of religion, race, place of birth,
residence, language, etc., and doing acts prejudicial to maintenance of harmony.—(1) Whoever—
(a) by words, either spoken or written, or by signs or by visible representations or otherwise,
promotes or attempts to promote, on grounds of religion, race, place of birth, residence, language,
caste or community or any other ground whatsoever, disharmony or feelings of enmity, hatred or illwill
between different religious, racials, language or regional groups or castes or communities, or
(b) commits any act which is prejudicial to the maintenance of harmony between different
religious, racial, language or regional groups or castes or communities, and which disturbs or is likely
to disturb the public tranquillity, or
(c) organizes any exercise, movement, drill or other similar activity intending that the
participants in such activity shall use or be trained to use criminal force or violence or knowing it to
be likely that the participants in such activity will use or be trained to use criminal force or violence,
or participates in such activity intending to use or be trained to use criminal force or violence or
knowing it to be likely that the participants in such activity will use or be trained to use criminal force
or violence, against any religious, racial, language or regional group or caste or community and such
activity for any reason whatsoever causes or is likely to cause fear or alarm or a feeling of insecurity
amongst members of such religious, racial, language or regional group or caste or community,
shall be punished with imprisonment which may extend to three years, or with fine, or with both.
(2) Offence committed in place of worship, etc.—Whoever commits an offence specified in
sub-section (1) in any place of worship or in any assembly engaged in the performance of religious
worship or religious ceremonies, shall be punished with imprisonment which may extend to five years
and shall also be liable to fine.
*/
######      incite_hatred(X) or incite_violence(X) and not in(Z) and placeOfWorship(Z)-> imprisonment_3-fine(X)
######      incite_hatred(X) or incite_violence(X) and in(Z) and placeOfWorship(Z) -> imprisonment_5-fine(X)

/*
153AA. Punishment for knowingly carrying arms in any procession or organising, or holding
or taking part in any mass drill or mass training with arms.—Whoever knowingly carries arms in any
procession or organizes or holds or takes part in any mass drill or mass training with arms in any public
place in contravention of any public notice or order issued or made under section 144A of the Code of
Criminal Procedure, 1973 (2 of 1974) shall be punished with imprisonment for a term which may extend
to six months and with fine which may extend to two thousand rupees.
Explanation.—“Arms” means articles of any description designed or adapted as weapons for offence
or defence and includes firearms, sharp edged weapons, lathis, dandas and sticks.
*/
######      armed(X) and in(X, assem) -> imprisonment_6m-fine(X)

/*
153B. Imputations, assertions prejudicial to national integration.—(1) Whoever, by words
either spoken or written or by signs or by visible representations or otherwise,—
(a) makes or publishes any imputation that any class of persons cannot, by reason of their being
members of any religious, racial, language or regional group or caste or community, bear true faith
and allegiance to the Constitution of India as by law established or uphold the sovereignty and
integrity of India, or
(b) asserts, counsels, advises, propagates or publishes that any class of persons shall, by reason of
their being members of any religious, racial, language or regional group or caste or community, be
denied, or deprived of their rights as citizens of India, or
(c) makes or publishes and assertion, counsel, plea or appeal concerning the obligation of any
class of persons, by reason of their being members of any religious, racial, language or regional group
or caste or community, and such assertion, counsel, plea or appeal causes or is likely to cause
disharmony or feelings of enmity or hatred or ill-will between such members and other persons,
shall be punished with imprisonment which may extend to three years, or with fine, or with both.
(2) Whoever commits an offence specified in sub-section (1) in any place of worship or in any
assembly engaged in the performance of religious worship or religious ceremonies, shall be punished with
imprisonment which may extend to five years and shall also be liable to fine.
*/
######      publishes_class_traitor(X) or publishes_class_inhuman(X) or publishes_class_disharmony(X) -> incite_class_hatred(X)
######      incite_class_hatred(X) and not in(Z) and placeOfWorship(Z)-> imprisonment_3-fine(X)
######      incite_class_hatred(X) and in(Z) and placeOfWorship(Z) -> imprisonment_5-fine(X)

/*
154. Owner or occupier of land on which an unlawful assembly is held.—Whenever any unlawful
assembly or riot takes place, the owner or occupier of the land upon which such unlawful assembly is
held, or such riot is committed, and any person having or claiming an interest in such land, shall be
punishable with fine not exceeding one thousand rupees, if he or his agent or manager, knowing that such
offence is being or has been committed, or having reason to believe it is likely to be committed, do not
give the earliest notice thereof in his or their power to the principal officer at the nearest police-station,
and do not, in the case of his or their having reason to believe that it was about to be committed, use all
lawful means in his or their power to prevent it and, in the event of its taking place, do not use all lawful
means in his or their power to disperse or suppress the riot or unlawful assembly.
*/
######      unlawful_assem_mem(Y) or rioting_happened and in(Z) and master(X,Z) and intention(X) -> fine100(X)

/*
155. Liability of person for whose benefit riot is committed.—Whenever a riot is committed for
the benefit or on behalf of any person who is the owner or occupier of any land respecting which such riot
takes place or who claims any interest in such land, or in the subject of any dispute which gave rise to the
riot, or who has accepted or derived any benefit therefrom, such person shall be punishable with fine, if
he or his agent or manager, having reason to believe that such riot was likely to be committed or that the
unlawful assembly by which such riot was committed was likely to be held, shall not respectively use all
lawful means in his or their power to prevent such assembly or riot from taking place, and for suppressing
and dispersing the same.
*/
######      Same as above


/*
156. Liability of agent of owner or occupier for whose benefit riot is committed.—Whenever a
riot is committed for the benefit or on behalf of any person who is the owner or occupier of any land
respecting which such riot takes place, or who claims any interest in such land, or in the subject of any
dispute which gave rise to the riot, or who has accepted or derived any benefit therefrom,
the agent or manager of such person shall be punishable with fine, if such agent or manager, having
reason to believe that such riot was likely to be committed, or that the unlawful assembly by which such
riot was committed was likely to be held, shall not use all lawful means in his power to prevent such riot
or assembly from taking place and for suppressing and dispersing the same.
*/
######      Same as above

/*
157. Harbouring persons hired for an unlawful assembly.—Whoever harbours, receives or
assembles, in any house or premises in his occupation or charge, or under his control any persons
knowing that such persons have been hired, engaged or employed, or are about to be hired, engaged or
employed, to join or become members of an unlawful assembly, shall be punished with imprisonment of
either description for a term which may extend to six months, or with fine, or with both.
*/
######      custody(X,Y) and unlawful_assem_mem(Y) -> imprisonment_6m-fine(X)

/*
158. Being hired to take part in an unlawful assembly or riot.—Whoever is engaged, or hired, or
offers or attempts to be hired or engaged, to do or assist in doing any of the acts specified in section 141,
shall be punished with imprisonment of either description for a term which may extend to six months, or
with fine, or with both,
or to go armed.—and whoever, being so engaged or hired as aforesaid, goes armed, or engages or
offers to go armed, with any deadly weapon or with anything which used as a weapon of offence is likely
to cause death, shall be punished with imprisonment of either description for a term which may extend to
two years, or with fine, or with both.
*/
######      abetment(X, Y, unlawful_assem) and not armed(X)-> imprisonment_6m-fine(X)
######      abetment(X, Y, unlawful_assem) and armed(X) -> imprisonment_2-fine(X)

/*
159. Affray.—When two or more persons, by fighting in a public place, disturb the public peace, they
are said to “commit an affray”.
*/
######      fight(X,Y) and in(Z) and public_place(Z) -> affray(X,Y)

/*
160. Punishment for committing affray.—Whoever commits an affray, shall be punished with
imprisonment of either description for a term which may extend to one month, or with fine which may
extend to one hundred rupees, or with both.
*/
######      affray(X,Y) -> imprisonment_1m-fine(X)
######      affray(X,Y) -> imprisonment_1m-fine(Y)
