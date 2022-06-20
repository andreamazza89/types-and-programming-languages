# 10 An ML implementation of Simple Types

~ Just followed along the overview of the implementation, where the meat of it is adding `typeof` to
~ type check.

~ An interesting point made in the book is that the type checking function leverages the inversion lemma
~ rather than the type evaluation rules. This is because when we write the implementation we have a case
~ statement switching directly on terms, which is what the inversion lemma gives us.
~ Though in this simple language the conversion is straightforward, more powerful ones will not be as
~ direct.

