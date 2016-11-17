# Notes

- Clojure is both:
  - a compiler
  - a language
- Clojure is a _hosted language_, wherein it gets compiled into Java
- Leiningen is the defacto Clojure tool, helping you to build and run
  Clojure projects

- Prefix notiation: the operator always comes first in an expression
  - `(+ 1 2 3 4)` instead of `(1 + 2 + 3 + 4)`
- `[1 2 3 4]` is a vector (1 dimensional array)

- `nil` and `false` are Falsy
- Everything else is Truthy
- All data structures are immutable, you can't modify them in place

- Higher order function: a function that can take a function as an
  argument or return a function
  - e.g. `((or + -) 1 2 3)`
- Special form: an expression that doesn't always evaluate all its
  operands, like `if` with two branches. Can't use a special form as
  a function argument
- Arity: number of parameters a function has
- Function definitions can be changed based on Arity

- Clojure has implicit returns
