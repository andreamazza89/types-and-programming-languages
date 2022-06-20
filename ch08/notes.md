# 8 Typed Arithmetic Expressions

## The Typing Relation

New rules and syntactic forms are introduced to describe types.
Formally, the typing relation is the smallest set between terms and types according to the
given rules.

> A term t is *typable* (or *well typed*) if there is some T such that t : T.

~ This is very similar to how we have an evaluation relation that maps terms to other terms, that is,
~ actually running the computation. However, the syntax allows for programs that are valid syntactically but
~ not semantically (i.e. a 'stuck' term, one for which no evaluation relation exists).
~ The new mapping (terms to types) is kind of a way to check whether the program is valid semantically without
~ having to run it. This is great cause it means catching invalid programs much more easily than if we just
~ 'shipped' software and waited for something to go wrong.

The 'inversion of the typing relation' lemma rearranges the typing rules to the form

  if t has type R, then R must be T

for example

  if true : R, then R must be Bool

~ Not sure why this way of rearranging things is important, maybe it supports proofs later on.

Much like we did for arith and evaluation derivations (a tree of evaluation rules instances for a specific
term - kinda like a worked example basically), we have typing derivations.
In the typing relation T, each pair (t,T) is justified by one of these trees.

(Theorem) In the arith language, if a term has a type, then this is unique, as is the derivation tree.
These properties will both be relaxed in more complex systems.

## 8.3 Safety = Progress + Preservation

The main property of any type system is safety, meaning that terms don't get stuck.
As mentioned above, the typing relation means that if a term is well-typed, it will not get stuck.
We now prove this, using two theorems:

progress: a well-typed term is either a value or it can be evaluated further
preservation: taking an evaluation step with a well-typed term gives us a well-typed term

