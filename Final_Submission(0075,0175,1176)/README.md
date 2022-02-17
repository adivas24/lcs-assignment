#Logic In Computer Science (CS F214) Assignment

##Team:
- Abhinav Ramachandran (2017A7PS1176P)
- Aditya Vasudevan (2017A7PS0175P)
- Jayanth Tummalapenta (2017A7PS0075P)

##Task:
Laws in Indian Penal Code (IPC) are to be encoded in Prolog (as facts and rules).
Write a Prolog program to interpret / apply laws for a given case given a set of laws.
Three member team: Implemented Sections 4-8 of the IPC.

##Submission Contents:

Our assignment submission contains the following:

1. README.md
2. Main code (main.pl)
3. Laws (laws.pl)
4. Database (db.pl)
5. Examples (samples.md)

The 'main.pl' file contains the starter code and is where the main program runs. It contains the commands to load the other files.
The 'laws.pl' file contains most of the predicates pertaining to the IPC. In case new laws need to be added, they can be added to this file.
The 'db.pl' file contains a few facts and an *endprogram* predicate, which clears the facts asserted during the execution of the program. As of now, the facts are very rudimentary. However, this section can be expanded to modify definitions of predicates.
For purposes of illustration, placeholders like someone, anyone and victim have been added. For a specific case, more details will need to be added to the database.
The separation of these files is purely to make the code more compartmentalized and readable, they can technically all be in a single file.
The 'sample.md' contain a few example runs of the program.

##Description of Program:

The program aims to interpret the laws and determine the punishment for a certain offence.
It is interactive and will query the user for inputs, to determine the judgement.
As of now, the program implements the laws described in Chapters IV, V, VA, VI, VII, and VIII of the IPC with the exception of the following laws:

102,105,114,150,157

These laws have not been explicitly made into prolog statements, either because they are very similar to previous laws, or because we did not fully understand them.

After loading test.pl (command is '[\'test\']'), (backslashes in the aforementioned command are to be ignored) to begin execution of the program, execute the following command:

'start.'

The user will be prompted to enter one of three modes:
1. Going through **all** laws one by one.
2. Selecting a **subset of sections**.
3. Selecting a **subset of laws**.

*[Note. In mode 2 and 3, all laws that are not selected, will be suppressed. Hence, if a selected law is dependent on one or more of the suppressed laws, then it might fail to execute properly. Thus, it is important to ensure that all relevant laws are included in your selection.  Similarly, if the inputted crime is 'mutiny', and the laws in the user-inputted selection do not pertain to 'mutiny', then the program will fail to give the appropriate punishment. This is an intended feature, not a bug. End of Note]*

*[Note. The laws in section 5 of the IPC are with regard to abetment. Thus, if section 5 is in the user selection, the program will take the trial for **Abetment** of the specified crime, not for the crime itself.]*

After the above selection is complete, the user will be prompted to enter a name of the suspect on trial, and the nature of the crime. Ensure that the inputs begin with a lowercase letter and are followed by a full-stop.

Following this, testing of the selected laws begins.
The program will sequentially go through the list of laws encoded and will query the user for relevant information in the form of dichotomous questions. Only one character (and no full-stop) needs to be given as input, **else the program will not behave in the expected manner.**
Entering '1.' will be interpreted as an affirmative. **All other inputs will result in negation.**

When the program determines the judgement, it will print it out on the console.  

At the end of judgement, if the decision does not seem correct, it is possible that the relevant laws required for correct judgement may not have been included. Please ensure that all relevant laws are included, when executing, if a specific punishment is expected. It is possible that the values default to pre-determined constants, which act as catch-alls, namely a punishment of 15 years.

Improper termination of the program can result in an unstable state. Please re-run prolog to retry the program.
It is advisable to restart (reload) the program after every execution, for optimum performance.

Although we have attempted to debug the code as far as possible, the extensive nature of the codebase makes it difficult for us to do it exhaustively. We apologise for any unchecked bugs that you may encounter.

This program was tested on:
- Ubuntu 16.04 (64-bit), SWI Prolog version 7.2.3
- Windows 10 (64-bit), SWI Prolog version 7.6.4
