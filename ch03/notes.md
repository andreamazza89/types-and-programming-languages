# 3 Untyped Arithmetic Expressions

This chapter establishes a very small language mad up of numbers and booleans that sets the basis
for having precise, mathematical tools to talk about the syntax and semantics of programs, which
will then allow us to talk about type systems.

## 3.1 Introduction

We are going to introduce a very simple language, where we have booleans, the number 0, the predicate
`isZero`, `succ`/`prec` to create more numbers and conditionals (if t then t else t).

The grammar given describes the abstract sysntax of the language. Each 'line' in the grammar is a `term`.
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

~ 2. given a finite set of possible terms, languages have a finite (though incredibly large) number of programs one could
~    write. This is kinda interesting philosophically, like one way to look at programming is to find the right program
~    amongst this huge set of syntactically valid ones - kinda trippy!

## 3.3 Induction on Terms

The fact that T (inductive/inference definition of the language syntax) and S (the generative one) are the same has
some implications that we'll explore

~? I am not sure I see how this is the case? Maybe it'll be clearer once I finish the chapter. The main insight
~? seems to be arond the fact that the metavariable `t1` in a term like `succ t1` is a *smaller* term.
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
~ ... as the book mentions, this is implicit: because they don't evaluate to anything, they do not appear

Notice that the rules include an order of evaluation, meaning that the if guard is first evaluated until we reach
true/false and only then do we continue evaluating either the then or else branches.
In a way, this makes the 'leaf' rules (ones where the predicate is a boolean) the ones that actually evaluate, whereas
the other one is more of a control-flow one. Because of this, the former ones are referred to as *computation rules* as
opposed to *congruence rules*.



