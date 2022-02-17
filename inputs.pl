

start :- write('What laws do you want to check?'),nl,
write('Please enter a number between 76 and 160 (inclusive)'),nl,
write('**Note: Inputs need to end with a fullstop'),nl,nl,
read(X),nl,(((X>75),(X<161),more([X]));
write('Invalid law. Please restart program'),!).

more(List) :- write('Do you want to add one more?'),nl,
write('Please enter a number between 76 and 160 (inclusive)'),nl,
write('Enter 0 if you have finished choosing.'),nl,
write('**Note: Inputs need to end with a fullstop'),nl,nl,
read(X),nl,(((X>75),(X<161),more([X|List]));((X is 0),write(List),outcome(List));
write('Invalid input. Exiting. Execute start. to restart the program.'),!).

outcome([]) :- write('End of list').
 
