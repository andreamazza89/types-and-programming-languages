# 4 ML implementation of arith

This chapter introduces a concrete implementation of the language described so far (arith),
which includes a recursive type for the terms (the abstract syntax tree) and a function to
evaluate terms.

~ I am going to write this in Haskell.
~ Not sure why they keep source code information within the `term` type, but will skip for
~ now and will add if/when necessary. Actually thinking about it, this is necessary because
~ some of the errors are run-time ones rather than parse-time, so if we wanted to point out to
~ the user where they went wrong with a run-time error, we need to preserve this information
~ after parsing the source file into a term-tree.
~ Still going to not do it until needed though.
