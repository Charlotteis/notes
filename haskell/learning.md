# Notes

- In Haskell there are only expressions, no statements!
- The concatenation operator `++` is different from addition `+`

## A basic function
```ruby
# A ruby function
def hello(name)
  "Hello, #{name}"
end
```

```haskell
-- A Haskell function
hello name = "Hello, " ++name
```

## An anonymous function

- a.k.a a lambda
- the basis of the haskell language

```haskell
f = \x y -> x * y + x + y
```

## Types
```haskell
  sq :: Int -> Int -> Int
  sq x y = x * x + y * y
```

## Lists
```ruby
# Ruby example
my_list = [4, 5, 6]
list_two = [7, 8, 9]
newlist = my_list + list_two
```

```haskell
-- Haskell example
myList = [4,5,6]
listTwo = [7,8,9]
newList = myList ++ listTwo
```

## Expressions

```haskell
3 + 4
abs 5
min 3 8

-- Equations give name to values (like a variable-ish)
-- the left hand side and the right hand side denote the same value
-- Not an assignment, a name can only have ONE value.
-- They do not vary, so are not a variable. They are constant.
answer = 42
secondAnswer = 67
answer = secondAnswer -- wrong, can only have one definition
-- Once you give a value to a name, you can never change it.
```

- `fst` = first
- `let` defines a variable
- best to enclose negative numbers within parenthesis

## let expressions (blocks)

## conditional expressions (if, then, else)

```ruby
# Ruby
def max(x, y)
  return x if x > y
  y
end
```

```haskell
-- Haskell
-- Expressions, not a statement.
max x y = if x > y then x else y
```

## Higher Order Functions

- Functions that take functions as arguments or
- Functions that operate on functions
- Map, reduce etc.

```haskell
map (\x -> x*2+1) [1..10]
```

## Case statement

```ruby
# Ruby
red = 1
blue = 2
yellow = 3

color = set_color
case color
when red then thing
when blue then thing
when yellow then thing
end
```

```haskell
-- Haskell
-- uses type as the value to decide on the case
data Color = Red | Blue | Yellow
color = set_color
case color of
  Red -> thing
  Blue -> thing
  Yellow -> thing
```

## Reduction

- Converting an expression to simpler forms, how all Haskell programs
are executed
- All computation is achieved purely by reducing expressions
- When a reduction is performed there is only only possible answer
- There can be several reduction paths in an expressions

## List comprehension

```haskell
[3*x | x <- [1..10]]
```

## List index
```haskell
[1,2,3,4] !! 2 -- 3
```

```haskell
-- first list element
head :: [a] -- a
-- all the rest of the elements
tail :: [5,6,7] -- [6,7]
```
