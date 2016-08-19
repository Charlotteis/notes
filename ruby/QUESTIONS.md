# Questions

- **How do I print all the attributes set on the class?**

  _Answered by @jcoglan_

  You can use [`Object#instance_variables`][instance variables].
  It gives you an array of symbols representing the names of any instance variables
  currently stored for the object

- **How do I print all the user set methods on a Class?**

  _Answered by @jcoglan_

  Using [`Module#instance_methods`][instance methods] sort-of does this, depending on what you want. `a_class.instance_methods(false)`
  returns methods defined directly in that class, not methods it inherited, so if
  you call it on your own class you won't get anything inherited from `Object` and
  `Kernel`, but you also won't get methods from other ancestors either. If this
  is a problem you can use [`Module#ancestors`][ancestors] to walk up the tree.
  
  _Answered by @andy-bell_

  Using the `methods` call will return all the methods assigned to an object
  (the methods will belong to the instance of the object, not the class object.
  The methods appear to be returned in an order which prioritises the public
  methods defined by the user (it will not return private methods)

  As it returns an array, there may be a way of trimming down the array to only
  return the values unique to that class, but that would likely involve creating
  an instance object of an "empty" class and compare the two with something like
  this:

  ```ruby
  class Blank
  end

  class Klass
    def hello
      puts "hello"
    end
    def woo
      puts "hello"
    end
  end

  blank = Blank.new
  klass = Klass.new

  klass.methods.keep_if{ |method| false == blank.methods.include?(method)

  => [:hello, :woo] 
  ```
  
- **'Capture groups' exist in regex land but what do we do with these groups once
captured?**

  _Answered by @AgentAntelope_

  The normal way to do this is by using the `match` method, and then calling
  `captures` on the resulting `MatchData`:

  ```ruby
  "foo".match(/(oo)/).captures
   # => ["oo"]
  ```

- **How do you call functions from other files, a lá node module exports?**

[instance variables]: http://ruby-doc.org/core-2.3.1/Object.html#method-i-instance_variables
[instance methods]: http://ruby-doc.org/core-2.3.1/Module.html#method-i-instance_methods
[ancestors]: http://ruby-doc.org/core-2.3.1/Module.html#method-i-ancestors
