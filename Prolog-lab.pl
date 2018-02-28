/*************
 * Project 2
 * Exersice 3
 *
 * precipitation :- raining.
 * precipitation :- snowing.
 * snowing :- freezing, precipitation.
 * raining :- \+freezing, precipitation.
 * snowing.
 *
 * Results:
 * freezing. = true
 * raining. = 'out of local stack'
 *
 * A better way to code for better results
 * is the following.
 */
:- dynamic precipitation/0, raining/0, snowing/0, freezing/0.
precipitation :- snowing.
precipitation :- raining.
snowing.
snowing :- freezing, precipitation.
raining :- \+ freezing, precipitation.
freezing :- snowing.


/*******************************************
 * Results:
 * freezing. = true
 * raining. = false
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

/* Prolog can derive that a horse has four legs */

/*********************************************
 Exersice 5: Write prolog clauses to express
 the following relationsip, given the parent
 relationship: grandparent, sibling, cousin.

 Bill - parent of Jill and Sarah, grandparent of
	Sam, Ana, Jan, Smith.
 Jill - parent of Sam and Ana.
 Sarah - parent of Jan and Smith

*********************************************/

:- discontiguous parent/2.
/* function(name, X) */
/* parent(Child, Parent) */

parent(jill, bill).
parent(sarah, bill).
parent(sam, jill).
parent(ana, jill).
parent(jan, sarah).
parent(smith, sarah).

grandparent(X, Y) :- parent(X,Z), parent(Z,Y).
siblings(X, Y) :- parent(X,Z), parent(Y,Z), X \= Y.
cousins(X, Y) :-  findall(Z, (parent(X,M), parent(Z,N), siblings(M,N), M\=N), Y).

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



