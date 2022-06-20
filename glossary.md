# Glossary

## Term
A phrase that describes a computation.
Terms can be combined together according to the rules of the language (the syntax)

## Syntax
The rules of how terms can be combined together to form a program.
These are often expressed with a grammar, which lists all possible combinations of
terms.

## Semantics
What terms 'mean'. Interestingly, the first book's description is

> how terms are evaluated

which I like as it's very pragmatic, though we should define what 'evaluation' means

## Evaluation
The process of taking a term and applying evaluation rules to produce another term.
See Semantics.

## Value
A term that cannot be evaluated further, as there are no evaluation rules that apply.
This is also known as *normal form*

## Well-Typed
A term for which exists a type T such that t : T. In other words, given a typing relation
T based on typing rules, the given term t belongs to that relation.
Or, less formally, a term that passes type checking.

