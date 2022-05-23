# Chapter 2

This is just a series of definitions around sets, sequences and induction, so I am not going
to take exhaustive notes, however will jot some thoughts.

A Relation is a set that includes elements from 2 or more sets, thus relating them to each other.
For example, you could have a set of people P, a set of animals A and a set of pet relations R,
which would contain tuples like (p, a), where p ∈ P and a ∈ A, showing which animals are
which person's pet.

A function is simply a relation between a domain and a codomain. If there are entries for all domain
elements, then the function is total, otherwise it's partial. (what if there are multiple entries
for the same domain element?)

In a partial function, an member of the domain is defined when there is an entry in the function
relation, and undefined when there is not. For example (integer division), given the set of natural
numbers and the function '5 divided by n', where n ∈ N, a number of arguments are undefined,
for example 6.

There is a difference between undefined and failure. Total functions may fail, which is represented as
the relation `S to T ∪ {fail}`, where fail does not belong to T.

~ going to read the first chapter of 'Introduction to Lattices and Order' to hopefully help understand
~ ordered sets - will put my notes in a separate file.

----
Structural induction is like mathematical induction, but rather than operating over numbers, it operates on
data structures. For example, you can prove that the number of vertices on a binary tree is equal to the
number of vertices + 1 by having a base case of a 1-node tree, and then working on the induction step.
