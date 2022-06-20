# Nameless representation of terms

This chapter formalises how we deal with variable names and making sure we avoid capturing.

Amongst a number of strategies to achieve this, the book uses a system to give 'canonical' names
to variables so that renaming is no longer necessary.

~ This is one of my favourite ways of solving a problem: removing it so that there's no need to
~ solve it anymore.

Basically, rather than using a name for variables, we reference them by their 'distance' from their
lambda binder, so λx . x simply becomes λ0

To handle free variables when converting from a standard lambda term, we have to 'fix' their amount
and use a context to convert to their nameless representation.
My current intuition for this is that the context tells you how much to add to the number of lambdas,
like if you have       λ a . λ b . c    and the context { c --> 3 }, then the conversion is λ.λ.5

## 6.2 Shifting and Substitution

In order to perform substitution in the nameless calculus, we need a new operation, called shifing.
This is to 'keep track' of how far away we are from the outermost lambda binder, so that we can
offset free variables while leaving bound ones alone.

## 6.3 Evaluation

This is pretty much the same as for the standard lambda calculus but the reduction rule now uses the
rules of substitution defined above. But with a couple of twists:

1. when we substitute, because we 'strip' a lambda binder, we need to lower the variables left unsubstituted
   by one to account for this.

2. for similar reasons, the argument needs its variables increased by one, as they are placed in a larger
   context than where they were before. In other words, if you have λ.0 0, the argument is referencing the
   first free variable, but once we place it within the abstraction, it needs to go up to 1 to keep that
   reference intact. Once we have done that and the susbstitution, we lower the result by 1, giving us 0.

