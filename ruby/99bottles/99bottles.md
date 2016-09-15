# 99Bottles

Notes from reading the [99Bottles] book.

## Chapter One - Rediscovering Simplicity

- Object-Oriented Design (OOD): if you're willing to accept some increase in
complexity in some dimensions, you will get decreases in others.
- DRY is useful, but creates levels of indirection
- Design is about picking the _right_ abstractions
- As programmers, we tend to over anticipate abstractions, inferring them
prematurely (_charlotte: I think that TDD can help this_) with little info.
Resist abstractions until they are absolutely needed.
- Code must be concrete enough to be understood, but abstract enough to allow
for change

### Solution One

- Concise verse function to the point of incomprehensibility
- Lots of duplication
- Hidden unnamed concepts
- Mixture of ternary and `if` statements
- Ternaries within ternaries (_charlotte: yo dawg_)

- Logic should be split into methods (defined by an object, _contains_
  behaviour), and `def verse` should fill itself
  by sending messages (sent by an object to _invoke_ behaviour)

### Solution Two

- Lambdas taking arguments they don't refer to
- One hundred instances of `Verse` are created!
- Many levels of indirection
- Indirection = harder to change, need to understand first
- Unnecessary code taking time to write
- Still more comprehensible than Solution One
- Good job of exposing concepts, but job of making it worth it
- The code that chooses with template to use is costly, overly complicated
and doesn't pay its way

### Solution Three

- Too many small methods mean it's hard to understand the code
- No idea how many verse variants, or which verses are similar, different
or the rule of the song
- Difficult and time consuming to write, hard to understand the complete
picture
- Though small methods are easy to change, it's possible one change somewhere
will have a great impact on somewhere else
- Method names are specific to beer, if we wanted to change the drink
we'd have to change lots of methods
- Name methods after the concept they represent, rather than how they
currently behave!
- Many methods here represent the wrong abstractions

### Solution Four

- Much simpler code, easier to write
- Easier to comprehend
- Lack of complexity
- Cheap to change
- Best solution, though no-one writes it. Embarrassingly easy and missing
many qualities of what one expects in 'good code'. Duplication, few
abstractions
- No provision for change

## Chapter Two - Test Driving Shameless Green

- Test Driven Development: writing tests before the code.
- 'Red, Green, Refactor'
- The first test is often the most difficult to write
- `elsif` conditions are usually wildly different, `case` states that all
following conditions are explicitly referring to fundamentally the same
type of condition.
- 'thoughtful acts'
- One needs to write tests to confirm the _what_ of code, not the _how_
- The tests should not be tightly coupled to the code, else any code change
can make the suite very fickle.  

[99Bottles]: http://www.sandimetz.com/99bottles/
