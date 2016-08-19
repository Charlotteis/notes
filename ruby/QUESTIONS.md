# Questions

- ** How do I print all the attributes set on the class? **

  You can use [`Object#instance_variables`][instance variables].
  It gives you an array of symbols representing the names of any instance variables
  currently stored for the object

- ** How do I print all the user set methods on a Class? **

  Using [`Module#instance_methods`][instance methods] sort-of does this, depending on what you want. `a_class.instance_methods(false)`
  returns methods defined directly in that class, not methods it inherited, so if
  you call it on your own class you won't get anything inherited from `Object` and
  `Kernel`, but you also won't get methods from other ancestors either. If this
  is a problem you can use [`Module#ancestors`][ancestors] to walk up the tree.
  
- ** 'Capture groups' exist in regex land but what do we do with these groups once
captured? **

  The normal way to do this is by using the `match` method, and then calling
  `captures` on the resulting `MatchData`:

  ```ruby
  "foo".match(/(oo)/).captures
   # => ["oo"]
  ```

- ** How do you call functions from other files, a lá node module exports? **

[instance variables]: http://ruby-doc.org/core-2.3.1/Object.html#method-i-instance_variables
[instance methods]: http://ruby-doc.org/core-2.3.1/Module.html#method-i-instance_methods
[ancestors]: http://ruby-doc.org/core-2.3.1/Module.html#method-i-ancestors
