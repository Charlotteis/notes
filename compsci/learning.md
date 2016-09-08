# Notes

- **Weak Law of Large Numbers**: the more you observe the outcome of a
supposedly random event, the more the outcome will converge onto some type of
relationship or _truth_.

## Big-O Notation

- How we measure how efficient a routine/algorithm is in the _worst case_,
'asymptotic complexity'. The complexity of an operation.
- `O` is synonymous with 'Order'.
- `O(n)` = 'Order n'
- `O(1)` = Order 1

- `O(1)`: The function will do one thing always, a static routine. Involves an
operation on one element in a list.
  - e.g. selecting an umbrella from a rack is an `O(1)` operation.
  - e.g. accessing an array by index is an `O(1)` operation.


- `O(n)`: The operation does _n_ things, depending on how many _n_s.
  - e.g. you are looking for your boxers, and they can be in one of five rooms.
  The worst case scenario is that you have to search all six rooms.


- `O(n^2)`
  - e.g Amazon displays 'frequently bought together' suggestions.
    - Work out what products go with X, `O(n)`
    - `O(n)` doesn't scale well!
    - Need to run process on every single product, meaning O(n^2), because
    for each product we need to run another process.
    - Each `n` needs a subsequent number of operations done to it (`n`).


- `O(LOG n)`, `O(n LOG n)`
  - Log territory when running sorts and searches
  - Logarithm: inverse of an exponent
  - Decrease logarithmically over time
  - Binary Search: divide sorted list continually in half until you find what
  you're looking for.
    - Only works if the items in the list are pre sorted

## P = NP

- Complexity over time
- Calculate this using a 'polynomial equation'
- If a problem can be solved in polynomial time, it is 'Part of P' or 'within P'
- Sorting/Searching are problems solvable and verifiable in polynomial time
- Problem is 'in NP' if the solution possibly takes exponential time (O10^n),
but you can verify the solution in polynomial time. Solving the problem takes
a long time, but verifying it is much quicker.
- NP: non-deterministic polynomial time
- N & P can both me verified in polynomial time, but only P has a solution
in polynomial time
- Are problems within NP actually P with an undiscovered solution?
- If you can recognise an algorithm as part of NP (or, not part of P), you can
avoid it
- NP Complete: if you can answer one NP-Complete problem, you have th keys to
answering them all by way of reduction
