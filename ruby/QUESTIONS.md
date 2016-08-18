# Questions

- How do I create an instance of a class and define the attributes for the
class at the same time?
- How do I print all the attributes set on the class?
- How do I print all the user set methods on a Class?
- 'Capture groups' exist in regex land but what do we do with these groups once
captured? Can we extract them individually?
  - The normal way to do this is by using the `match` method, and then calling `captures` on the resulting `MatchData`:
  ```@ruby
  "foo".match(/(oo)/).captures
   # => ["oo"]
  ```

- How do you call functions from other files, a lá node module exports?
