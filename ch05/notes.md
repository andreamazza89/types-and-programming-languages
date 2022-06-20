# 5 The Untyped Lambda-Calculus

The Lambda Calculus is a very tiny language based on function abstraction and application to describe any computation.

Being super-tiny means that while being a language to describe computation, it also lends itself to proving cetrain
properties.

## 5.1 Basics

In lambda calculus everything is a function: the argument to a function is a function, and what it returns is a function.

The syntax of the Lambda Calculus is beautifully simple, with only 3 types of terms:

- variable      |  x
- abstraction   |  λx . t
- application   |  t t

A variable is either *bound* when found in the body of an abstraction. It's bound to whatever x is when applied.
Otherwise, x is *free* when appearing outside the abstraction.

A term that doesn't have any free variables is *closed*, also known as a *combinator*.
The simplest combinator is the identity function: λx.x

### Operational Semantics
By itself, the lambda calculus doesn't have all the primitives that you would expect from a language, things like
numbers, arithmetic, boolean, control flow and IO.

The only way to "compute" is to apply a function to arguments (which are themselves functions).

A term in the form (λx.t')t is called a *redex* - reducible expression and the operation of rewriting a redex is called
*beta-reduction*.

There are a number of reduction strategies, depending oh the order of which redex is worked on at each step:

- *full beta-reduction*, where any redex may be reduced at any time
- *normal order*, where you reduce the leftmost/outermost redex. With this and the following strategies, the reduction
  relation is a partial function.
- *call by name* - same as normal order, but not allowing reductions inside abstractions. I guess the idea is that the argument of
  a function call is not evaluated, so once you're left with something like λx.(λy. y x) you leave the argument alone?
- *call by value* - only the outermost redex are reduces **and** they are only reduced when the right hand side has already
  been reduced to a value. In this calculus the abstraction is the only value. This strategy is strict
  (you always evaluate all function arguments even if not used) and is the one used in this book.

## 5.2 Programming in the Lambda-Calculus

To get functions with multiple arguments, you simply use higher-order functions, in a process called currying.

Boolean values are functions that *represent* what a boolean does, that testing if the input is true or false.

A Pair (like Haskell's `(,)`) can be represented (ab)using booleans.
~ My intuition here is that we use an `if` construct where one member of the pair is 'stored' on the `then`
~ part, the other on the `else`. To access `fst` and `snd` are basically using `tru` and `fls` to retrieve the
~ approprate value.

Church numerals encode numbers. The idea is that you have a function that takes a successor and zero functions
and the number is however many times s is applied to z.
The intuition here is that we are iterating over z (zero) n times (n being the number being represented).

So a successor is simply taking a number and wrapping another s (successor) on it.

Addition of m + n is repeating the successor of zero n times and then doing the same m times starting from n.

Multiplication of m * n starts getting mind bending: the idea is that we partially apply addition of n + zero
and iterate over that m times.

The predicate `iszro` is nice and straightforward:

`iszro = λn . n (λx . fls) tru`

If the number if zero, then we return tru (which is the starting point of repeated application). If anything
else, we just have a constant lambda returning fls.
~ this is probably a moot point, especially as we're not concerned with efficiency here, but it's interesting
~ to note that this will take as many reductions as the number. In other words, `iszro 333` actually does
~ around 300 steps before giving us `fls`

#### Recursion

Certain terms cannot be evaluated to normal form; when this happens they are said to *diverge*.

For example omega just keeps on evaluating to itself:

`omega = (λx . x x) (λx . x x)`

~ so whether you could have proofs using structural induction in arith, I guess you can't here?

The `fix` function (y-combinator) lets you have recursion even though it's not natively supported by the language.
The way it works is that you give it a function that takes a function (the one it will use to recurse) and
the argument. It has sort of a self-replicating structure, a bit like omega above, that means every time you
use the recursive function it creates a new one to use in the next step.

#### Representation

This is linking the arith language into lambda calculus, showing that we can represent terms and operations
in it, so that any arith program can be rewritten as lambda calculus.

~? I like the idea that a church numera represents succ and pred using the two functions
~? (λscc . λprd . <num-here>), and I can see how scc is equivalent to succ when given a term, but I am not sure
~? I can see how prd is the equivalent to pred - as in, does that not stop being a Church numeral? Or what do
~? you then do with the scc?

#### Substitution

This section goes through the intricacies of substitution and introduces the issue of
variable capture. The strategy to avoid this is to rename bound variables with
alpha-conversion.

