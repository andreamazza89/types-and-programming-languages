Some notes from the suggested reading to explore induction, that is
'The Formal Semantics of Programming Languages: An Introduction'.

# 3 Some principles of induction
The most used types of induction are mathematical and structural.
Both are a type of well-founded induction.

## 3.1 Mathematical induction
The principle is to show that a property is true for a base case, then that it is true
for n+1 (assuming n is true).
With these two, it follows that it's true in all cases. For example, using natural numbers, if you can
prove that a property is true for 0 and n+1, that's basically all natural numbers as they can all be
thought of as a repeated application of n+1 (e.g 2 is ((0+1)+1)).

Summarising, if

P(0) is true                            -- the *basis* of the induction
P(m+1) is true assuming P(m) is true    -- P(m) id the induction *hypothesis*, the whole thing the induction *step*

Then the property holds for all natural numbers

Sometimes you need to have multiple bases.


