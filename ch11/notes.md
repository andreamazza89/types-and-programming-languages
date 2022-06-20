# 11 Simple Extensions

## 11.1 Base Types

All languages provide base types - these are things like numbers, booleans, strings. All these things
do not have structure to them.

For our purposes, rather than give a specific type to each of these, we just use 'A' to mean one
of these base types.

## 11.2 Unit Type

Not much to report here - it's the type with one inhabitant

# 11.3 Derived Forms: Sequencing and Wildcards

Sequencing is when you evaluate a term and discard its result (so that the only reason for this would be to
perform a side effect) and then evaluate another term.

Derived form basically means syntactic sugar. Sequencing is either defined by adding the new evaluation and
typing rules, or by considering the new form an *abbreviation* of a term.

The biggest advantage of derived forms is that the increase the 'surface syntax' (the language that the developer
is exposed to) without changing the core language. This means that any properties existing in the core language
are maintained, whereas if we added the new syntax to the core language, we'd have to re-prove all properties.

Another derived form is a wildcard (`_`), which is when we want a placeholder for a variable that is never
used in the body of an abstraction.

## 11.4 Ascription

This means adding an assertion that a certain term is of a certain type, like `true as Bool`.

## 11.5 Let Bindings

The interesting thing here is that because the let syntax does not include type information, the derived form
(λx:T1.t2) t1 cannot be directly derived, at least not for typing.

## 11.6 Pairs

Pairs are the most basic kind of structure to build compound data structures. They are a specialisation of
Tuples - a 2-long Tuple is basically a Pair.

Nothing too exotic in the new rules here.

## 11.7 Tuples

This is pretty much the same as pairs, but the number of elements in the structure are generalised to be
between 1 and n.

## 11.8 Records

Records are yet another form of generalisation over Tuples, as they can be seen as tuples with a label. Or
rather, you could redefine Tuples as Records where the labels are just natural numbers.

Different languages differ in how they treat the order of the record fields. Specifically, does the a record
and another one with the same fields rearranged equal each other? It's up to the language - the one in this
chapter treats them as different.

## 11.9 Sums

~ Nothing surprising here, cool to see the syntax/rules spelled out.

The sum type introduces an interesting problem: the new typing rules 'break' the uniqueness of types property.
Meaning that it is no longer true that any given term has only one type. This is due to the typing rules for

in[l|r] v

where the rules go to T1+T2, but only check one of the two types, effectively leaving the other side as some kind of
*any* type.

The main implication here is that it complicates the typechecking algorithm, as we cannot just go about type checking
from the bottom up, as these rules now have infinite many types that satisfy it.

To make this concrete, think about the term `inl true` - using the T-INL rule, we get Bool+T2, where we have no information
about T2, so it could be any type.

There are three potential routes to go over this hurdle:

1. Leaving the type as somehow undetermined (or making a guess) and then later reconstructing what it should have been.
2. Refine the language of types to allow all possible values for T2. ~I think this just means adding support for
   polymorphism?
3. Extend the language syntax such that the programmer has to specify the type (aka. removing the issue rather than
   solving it).

## 11.10 Variants

Similar to what we did with Pairs/Tuples/Records, Variants generalise Sums

~ The book then introduces how the Optional type can be built from Variants. Not sure I love the examples given, but hey.

~ Similarly for Enums

~ And single-field variants, which I guess are like NewType s in Haskell?

## 11.11 General Recursion

Unfortunately it is impossible to have typing rules that actually terminate for recursion with only simple types.
This is why at this point we actually introduce a new syntactical construct to support it.

## 11.12 Lists

~ Nothing too surprising here


