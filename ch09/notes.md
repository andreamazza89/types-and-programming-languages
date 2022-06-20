# Simply Typed Lambda Calculus

## 9.1 Function Types

We want to add types for the lambda calculus + booleans, which means showing progress+preservation.
We also want the typing to not be too conservative. Being conservative means that `if true 0 else false`
fails type checking even though evaluation does not get stuck.

One issue we have is that since lamdba calculus is Turing Complete, we cannot have *exact* type analysis.
This is because a program could in theory never terminate, in which case type checking would as well.

The function type is `T1 --> T2`

## 9.2 The Typing Relation

The first issue is that with variables, we don't know what their type should be, for which there are 2
approaches: either all types are expected to be annotated, or they need to be inferred. This book
focuses on explicit typing (i.e. when they are annotated).

For lambda abstraction we don't need to also annotate the return type, because this is just going to be
the type of the body, where the bound variable has whatever type was stated.

Because lambda abstractions can contain other abstractions, we need a context to keep track of typing
information for all variables 'visited'.

## 9.4 The Curry-Howard Correspondence

There two ways to categorise typing rule around the function type:

- introduction rules | where elements of a certain type are *created*
- elimination rules | where elements of a certain type are *used*

There is a correspondence between the type theory and constructive logic.
I am not going to dig too deep into this, but it sounds cool, and as well as being able to use type systems
to support logic, advances in each of these fields can be (and have been) transposed into the other.

# Erasure and Typability

The type information that populates the new typed syntax is only necessary when we type check. For actual
evaluation, this is unnecessary and many systems actually get rid of it after type checking.
This process is called *erasure* and consists in mapping typed terms into the corresponding untyped version.

We expect that the type information makes no difference to evaluation and actually prove it.

Typability simply refers to how an untyped term is said to be *typable* if there is a context and type such
that there's a typed term it's equal to once erased.

