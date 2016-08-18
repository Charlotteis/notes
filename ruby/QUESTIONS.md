# Questions

- How do I create an instance of a class and define the attributes for the
class at the same time?
- How do I print all the attributes set on the class?
  
  You can use [`Object#instance_variables`](http://ruby-doc.org/core-2.3.1/Object.html#method-i-instance_variables). It gives you an array of symbols representing the names of any instance variables currently stored for the object

- How do I print all the user set methods on a Class?

  Using [`Module#instance_methods`](http://ruby-doc.org/core-2.3.1/Module.html#method-i-instance_methods) sort-of does this, depending on what you want. `a_class.instance_methods(false)` returns methods defined directly in that class, not methods it inherited, so if you call it on your own class you won't get anything inherited from `Object` and `Kernel`, but you also won't get methods from other ancestors either. If this is a problem you can use [`Module#ancestors`](http://ruby-doc.org/core-2.3.1/Module.html#method-i-ancestors) to walk up the tree.
  
- 'Capture groups' exist in regex land but what do we do with these groups once
captured? Can we extract them individually?
- How do you call functions from other files, a lá node module exports?
