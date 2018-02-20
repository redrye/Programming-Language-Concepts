
/*************
 * Project 2
 * 
 * Exersice 3
 * 
:- dynamic percipitation, freezing, snowing, freezing.
precipitation :- raining.
precipitation :- snowing.
snowing :- freezing, precipitation.
raining :- \+freezing, precipitation.
snowing.

 * Results:
 * freezing. = false
 * raining. = 'out of local stack'
 * 
 * A better way to code for better results
 * is the following.
 */
:- dynamic percipitation, freezing, snowing, freezing.
precipitation :- snowing.
precipitation :- raining.
snowing :- freezing, precipitation.
snowing.
raining :- \+freezing, precipitation.

/*******************************************
 * Results:
 * freezing. = false
 * raining. = true
 ******************************************/

/*******************************************
 * Exersice 4: Write the following statments
 * as Prolog clauses:
 * 
 * 1) Mammals have four legs and no arms, or two
 *  arms and two legs
 * 2) A horse is a mammal.
 * 3) A horse hase no arms.
 * ******************************************/
:- dynamic mammal/1, legs/2, arms/2.
mammal(X) :- legs(X,4), arms(X,0).
mammal(X) :- legs(X,4), arms(X,0).
legs(X,4) :- arms(X,0).
mammal(horse).
arms(horse,0).

/* Prolog cannot derive that a horse hase four legs */

/*********************************************
 Exersice 5: Write prolog clauses to express
 the following relationsip, given the parent
 relationship: grandparent, sibling, cousin.
 
 Bill---------------Jill-------Sam
 			|				|--Ana
            |-------Sarah------Jan
            				|--Smith
                            
*********************************************/

:- discontiguous parent/2.
/* function(X, name) */

parent(bill,jill).
parent(bill,sarah).
parent(jill,sam).
parent(jill,ana).
parent(sarah,jan).
parent(sarah,smith).

grandparent(X,Y) :- parent(X,Somebody),parent(Somebody,Y).
siblings(X,Y) :- parent(Par,X),parent(Par,Y), X \= Y.
cousins(Y,X) :-  findall(I, (parent(M,X), parent(D,I), siblings(M,D), M\=D), Y).

/* Exersise 6 Function to find the gcd of 2 numbers
 * INPUT: gcd(10, 20, X).
 * OUTPUT: X = 10
 * */
gcd(0, X, X) :-!.
gcd(X, 0, X) :-!.
gcd(X, X, X) :-!.
gcd(X, Y, Z) :- X > Y, N is X-Y, gcd(Y, N, Z).
gcd(X, Y, Z) :- X < Y, N is Y-X, gcd(N, X, Z).


/* Exersise 7 Function to find the last element in a list
 * INPUT: last([1,2,3,4,5,6], X).
 * OUTPUT: X = 6
 * */

last([X],X).
last([_|Y],X) :- last(Y,X).



