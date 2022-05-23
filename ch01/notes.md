# Chapter 1 - Introduction

## 1.1 Types in Computer Science
There are a number of *formal methods* to prove/assert that a system holds
certain properties.

Type systems are a the lightweight end of this spectrum and are what this book is about.

> A type system is a tractable syntactic method for proving the absence of centrain
> program behaviors by classifying phrases according to the kinds of values they
> compute.

~ It's interesting that the definition above specifies the *absence* of a behavior.
~ What about *presence*? I guess you could define a certain behavior in either way, so one
~ is sufficient? Like for a non-empty list you could say that it **must** have at least one
~ element OR that it **must not** be empty.

Type systems are applied to programming languages (the focus of this book), but exist in other
fields too.

(Related to my note above) - type systems can prove the absence of bad behaviors but not their
prsence, so they must be *conservative* and reject programs that would be ok, such as:

> `if <complex test> then 5 else <type error>` - in which `<complex test>` always evaluates to true.

An interesting tension is that type system can only guarantee that `some` 'bad' behaviors are not
present, but not all, e.g. division by zero.

As well as things like checking that a function invoked exists and to prevent adding an integer to
a color, type systems can also guard abstraction boundaries, making sure that the internals of
an abstraction are not reachable outside the module that hides it.

Type checkers are fully automated (i.e. don't need manual 'assistance') tools, but they require
some amount of type annotations. A proof that the program meets some specification can be 'encoded'
in type annotations, so the typechecker becomes a proof checker.

~ This is an interesting concept that I can't fully get my head around, but I'll re-word it to
~ try and get closer: writing type annotations is effectively writing a proof that your program
~ meets *some specification* (like I don't know - you never mix numbers and colors together?!);
~ the typechecker then becomes the tool that checks your proof.

Finally, a typechecker should be efficient - though what efficient means is a debated topic.
How fast is fast enough? What if certain programs are impossible to type check in very arcane
situations but the typechecker terminates early and tells you so?

## 1.2 What type systems are good for
### Detecting Errors
A large amount of errors are detected way faster and easier than if they were found at runtime.
This provides a better feedback loop and stop you from shipping a 'broken' system.

The more types a program needs the better this quality (detecting errors) - for example, the benefits
might manifest as much in a program that just computes numbers.

This is not a free lunch though - the developer must know how to use types and leverage the type checker:
e.g. you could write a web application where everything is just a String being the Request.

Finally, a type system can be an invaluable maintenance tool, as it exhaustively 'tells' you what to
change when you update something at the type level.

### Abstraction
### Documentation
### Language Safety
There is no universal definition of a 'safe' language, however in general

> safe languages can be defined as ones that make it impossible to shoot yourself in the foot while
> programming

more accurately

> a safe language is one that protects its own abstractions

Safety can be achieved with static type-checking, but also at runtime by dynamic languages.
Static typechecking is almost never sufficient to guarantee safety - e.g. array bounds being checked
at runtime.

### Efficiency
The type system affords optimising code generated. Amongst other things, a number of safety checks
can be performed at compile time, rather than run time.

## 1.3 Type systems and Language Design
It's hard if not impossible to retrofit a (static?) type system onto a dynamic language, so ideally
type system and language design go hand in hand.



