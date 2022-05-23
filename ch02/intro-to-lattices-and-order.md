# Ordered Sets

Formalising things like 'this before that' and 'bigger than'.

## 1.1 Order

Order is not a property of an object in isolation: it's about taking
two objects and comparing them in some way.

> a binary relation on a set of objects

What's special about an ordering relation?

First, it's **transitive**: if `a -> b` and `b -> c`, then `a -> c` (`->` being some relation).
For example, if `a` is less than `b` and `b` less than `c`, then `a` is less than `c`.

Visually, if you have an arrow-path between two objects in the set, transitivity means that there
is also a direct arrow between the two, like so:

```
     . ---> .                        . ---> .
            |                         \     |
            |         --->             \    |
            v                           \   v
            .                            -> .
```

An order must also be **antisymmetric**: if a is more than b, b cannot be more than a.
Visually this means that if there is an arrow between two objects, there cannot be another
arrow in the inverse direction.

Ordering relations can either be **strict** or **non-strict** - an example of the difference is
`less than` vs `less than or equal to`.

Another concept is **non-comparability**: although `less than` is applicable to any two natural numbers,
not all ordered relations display this property - an example being `is a descendant of`. This simply
means that the set of relations for `is a descendant of` does not have an entry for every single pairing
of two objects being compared.

## 1.2 Definitions

Let `P` be a set.

An **order** (or **partial order**) is a binary relation `≤` on P if for x,y,z ∈ P:

- x ≤ x                              (reflexivity)
- x ≤ y and y ≤ x implies x = y      (anti-symmetry)
- x ≤ y and y ≤ z implies x ≤ z      (transitivity)

If a set P has an order relation ≤, then it is said to be an **ordered** (or **partially-ordered**) set.

A relation on a set that is reflexive and transitive but not necessarily antisymmetric is known as a
**qusi-order** or **pre-order**.

If x ≤ y and x ≠ y, then we have strict inequality (<).

The double pipe (||) means non-comparability. so we write `x || y` if x is not less than y and y is not
less than x or rather the two are not comparable.

A subset of an ordered set is itself an ordered set in the same way as its superset. The fancy way of saying
this is that the subset has the **induced order**, or the order **inherited**.

## 1.3 Chains and Antichains

If any pair of elements of a set are comparable, then the order is a **chain**. Other names are **linearly**
ordered or **totally** ordered.

An antichain is a set in which any two elements cannot be compared.

## 1.4 Ordered isomorphisms

Given two sets (P and Q), they are isomorphic with respect to order if there exists a mapping f between the two
such that if x,y ∈ P and x ≤ y, then f(x) ≤ f(y), and both are elements of Q.
This must be bijective - which means that there must be an inverse function from Q to P.

## 1.5 Number systems

Real, Natural, Integers, Rational numbers all have a 'natural' order that form a chain.
Also, their arithmetic maintains that order, for example, the sum of two elements greater than zero is also
greater than zero.

## 1.6 Families of sets

The power set of any set, is ordered by inclusion.

For example, given the set {1,2,3}, its powerset is {{}, {1}, {2}, {3}, {1,2}, {2,3}, {1,3}, {1,2,3}}.
The inclusion order means 'being a subset of', which exists between any two elements of the powerset above.

## 1.21 Bottom and Top

In an ordered set, if there is an element that is ≤ any other element, than we call this bottom. Top is the
same thing reversed.

For both bottom and top, if they exist, they are unique.

Within the 'is a subset of' order of a powerset, the empty set is the bottom, whereas the base set is top.

A finite chain always has bottom and top, but in an infinite one this is not necessarily so.

In the context of information ordering, bottom represents 'no information' (~ maybe this is why it's
Haskell's undefined?)

