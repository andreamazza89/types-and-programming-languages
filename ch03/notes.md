# 3 Untyped Arithmetic Expressions

This chapter establishes a very small language made up of numbers and booleans that sets the basis
for having precise, mathematical tools to talk about the syntax and semantics of programs, which
will then allow us to talk about type systems.

## 3.1 Introduction

We are going to introduce a very simple language, where we have booleans, the number 0, the predicate
`isZero`, `succ`/`prec` to create more numbers and conditionals (if t then t else t).

The grammar given describes the abstract syntax of the language. Each 'line' in the grammar is a `term`.
Right now 'term' and 'expression' means the same, but later we will specialise the latter to term/type/kind
expressions, whereas terms represent computations.

Notice that within the grammar we have *metavariables*, e.g. the second t in `t ::= succ t`. This is
fairly intuitive and simply means any possible term, so a term that is syntactically valid is `succ 0`
but also `succ true`.

Evaluating terms reduces them to either booleans or numbers.

## 3.2 Syntax

The grammar given in the previous section could be expressed using sets, inductively, where the 'base case'
is the set of `{0,true,false}` and the other rules are defined in terms of this set.

Notice how the set of terms is a set of trees; parentheses is how we resolve ambiguity when writing sets
'flattened'.

Another way to express the grammar uses the two-dimensional *inference rule* used in "natural deduction style"

~ (I wanna look into what 2D inference rules are and what natural deduction style is)

The notation that looks like a rational number is like 'if the thing/s above (premises) are true, then so are the ones
below (conclusions)'.

Statements that are just a given are called *axioms*.

To be pedantic, this second representation should actually be called *rules schema* rather than *inference rules*;
this is because metavariables are present in the definition, which yields an infinite set of *concrete rules*.

The final representation of the grammar is a "recipe" for generating the element of the set which makes it *concrete*.

~ This seems obvious and I probably already knew this, but reading this chapter and working through the exercise makes
~ me realise a couple of things:
~ 1. grammars define what is valid syntax, but not all valid 'phrases' have a meaning. Interestingly (or maybe
~    unsurprisingly), this is true in human language too. In programming languages type systems help fill this void.
~    I wonder if there is a reason why languages have this shortcoming or whether there are some where it's impossible
~    to write nonsense. Phantom types can help with preventing nonesense - lol which is meta, because there we use types
~    to create a DSL that prevents clients from writing invalid phrases; still needs a type system though!

~ 2. given a finite set of possible terms, languages have an infinite number of programs one could
~    write. This is kinda interesting philosophically, like one way to look at programming is to find the right program
~    amongst this huge set of syntactically valid ones - kinda trippy!

## 3.3 Induction on Terms

The fact that T (inductive/inference definition of the language syntax) and S (the generative one) are the same has
some implications that we'll explore

~? I am not sure I see how this is the case? Maybe it'll be clearer once I finish the chapter. The main insight
~? seems to be around the fact that the metavariable `t1` in a term like `succ t1` is a *smaller* term.
~? Which makes sense, but I'm not sure I see why we need S = T to infer this?
~? Also, I guess *smaller* means a shallower tree?

Anyways, because of this 'getting smaller', we can give *inductive definitions* of functions in the set of terms
and  *inductive proofs* of properties of terms.

3.3.1 is an inductive definition of a function that gives you the set of constants used on any given term `t`,
which is kinda like a recursive function to keep going up the syntax tree until we get to a constant.

Similarly, you can get the *size* (3.3.2) of a term by working up the tree, adding 1 every step until you get to a constant:

> size(true)    = 1
> size(succ t1) = size(t1) + 1
> ...

Very similar, you can get the *depth* of a term. (in this one we take the max of the if/then rather than the sum).

In 3.3.3 we prove (inductively) a property that relates the number of constants in a term to its size (being
less than or equal to).

## Semantic Styles
Now we move on to the semantics of the language, that is, how terms are evaluated.

There are 3 ways to formalise semantics:

1. *Operational semantics* - which is when we define a simple *abstract machine* for the language. It's *abstract* because
instead of relating terms to actual machine code to control a real machine, it instead uses the terms as 'machine code'.
It basically starts with some *state* t (the program, which is the initial term) and keeps simplifying the term to
a 'simpler' term until it halts, at which point the *meaning* of t (the initial term) is whatever the final state we
are left with, which is itself a term.

~ ok, kinda makes sense: if any program is just a term, then its meaning is based on a series of simplification steps,
~ at the end of which we are left with a term; this is the meaning of the original term.
~ so this abstract machine just describes the rule for simplifying terms, with constants as the base cases.
~? my question is - if the result of the abstract machine is a term, then how do we represent meaningless programs?
~? (e.g. `iszero true`) - perhaps the simplification process either yields a term or an error?

In this category, sometimes you'll see an abstract description that is very close to the abstract language the programmer
writes in, and then another one that can actually be executed. You then need to prove that the two are equivalent, i.e.
the correctness of the implementation.

2. *Denotational semantics* this is more abstract than the previous one (is not directly related to the execution of
the program), which lets you derive powerful laws around programs to prove things like two different programs having
the same behaviour.
You can also prove program properties and make it obvious that certain 'things' are possible or impossible in the language.

The idea is that the meaning of a term is a mathematical object and you have a collection of *semantic domains* and a
mapping function (*interpretation*) that goes `term->semantic_domain`

3. *Axiomatic semantics* in this one, rather than giving meaning via operational or denotational semantics to then
derive laws, it starts for the laws as the definition of the language.
> The meaning of a term is just what can be proved about it.

~ 🙃 - I think I kinda get it, but not really, maybe an example would help - gonna look online a bit.
~      ...still confused - gonna move on and accept some vague understanding of this.

Throughout the years operational semantics have prevailed, given how they are pragmatic and how research on how
formal reasoning that exists with the other 'styles' can be applied to this one too. This book uses operational semantics.

## 3.5 Evalutation

~ Interesting - no definition given for what evaluation is, just jumps straight it assuming we know.
~ I guess in this context evaluation is the process of simplifying terms described by operational semantics?

Values are a subset of terms that are possible final results of evaluation.

The *evaluation relation* is how given a certain term, we simplify it to the next one. If thinking about the abstract
machine, this is how we move from one state to the next one.

~ interesting that the rules given do not include the constants true/false. Or at least a mention that the program is
~ finished when we are left with a constant.
~ ... ha - the book mentions that this is implicit: because they don't evaluate to anything, they do not appear

Notice that the rules include an order of evaluation, meaning that the if guard is first evaluated until we reach
true/false and only then do we continue evaluating either the then or else branches.
In a way, this makes the 'leaf' rules (ones where the predicate is a boolean) the ones that actually evaluate, whereas
the other one is more of a control-flow one. Because of this, the former ones are referred to as *computation rules* as
opposed to *congruence rules*.

There are a few formal terms around evaluation rules:

- an *instance* of a rule is when you replace metavariables with terms, effectively writing a program
- a rule is *satisfied* by a relation (guessing a binary relation within the infinite set of terms) if for each instance of
  the rule either the conclusion is in the relation or one of the premises is not.
- the *one-step evaluation* relation is the smallest binary relation that satisfy all rules of evaluation. any pair in this
  relation is called *derivable*.


There is such thing as a *derivation tree*, which evaluates a term all the way to the leaves, which are either an instance of
`E-IfTrue` or `E-IfFalse`.

An evaluation statement `t -> t'` is derivable iff a derivation tree exists where the root is `t -> t'` is useful for a
proof technique called *induction on derivations*.

3.5.4 is a theorem + proof on the fact that the evaluation `t -> t'` is unique, meaning that if given `t -> t''`, then
`t' = t''`.

~? I can't fully grasp the proof, so going to move on and take the theorem as a given.

A term is in *normal form* when there are no evaluation rules that apply, meaning that we cannot evaluate it further.
true and false are normal forms in the current system.

This is also another way to look at values, which is that values are all terms in normal form.

> being in normal form is part of what it *is* to be a value, and any language definition in which this ins not the case is simply broken

Notice that while every value is a normal form, not every normal form is a value (though this is true with the simple language so
far). Normal forms that are not values are *run-time errors*.

A *multi-step evaluation* relation, shown as `-->*` is defined as the *reflexive* and *transitive* closure of one-step evaluation.

~? Trying to get an intuition for the above... the transitivity I see as being able to just 'jump' to normal form, but I'm not so
~? sure about relexivity: does it mean that we can go 'backwards'? This seems wrong, as we cannot evaluate a value back into a term
~? I guess it's not that, but rather saying that any term can be evaluated to itself?
~? mmmmmaybe that's the identity function? what's the point though?

Every term evaluates to a value. This is not true in 'richer' languages, but it is with the current one.

----
The book now introduces numerical values.

Notice that we need to have exhaustive rules of evaluation for all terms. This includes `pred 0`, which is simply defined as
evaluating to 0, but also `pred true`, which does not have a rule, so that it is normal form, but not a value, which we refer to
as *stuck*

In this simple language of booleans and numbers, being stuck is exactly what a run-time error is.

