##How do I create an instance of a class and define the attributes for the class at the same time?

If I have understood the question correctly:

define a method inside the class called `initialize`, and then when invoking `self.new` you can passin arguments related to the
initialize arguments.

```
class Klass
  def initialise(name, awesome)
    @name = name
    @awesome = awesome
  end
end

ruby_is = Klass.new(ruby, true)
```


##How do I print all the user set methods on a Class?

I am unsure if you can just call the user set methods, however using the `methods` call will return all the methods assigned to
an object (the methods will belong to the instance of the object, not the class object. The methods appear to be returned in an
order which prioritises the public methods defined by the user (it will not return private methods)

(irb demonstration)
```
2.3.0 :009 > class Klass
2.3.0 :010?>   def hello
2.3.0 :011?>     p "hello"
2.3.0 :012?>     end
2.3.0 :013?>   def woooo
2.3.0 :014?>     p "wooo"
2.3.0 :015?>     end
2.3.0 :016?>   end
2.3.0 :017 > k = Klass.new
 => #<Klass:0x007f9692078db8>
2.3.0 :019 > k.methods
 => [:hello, :woooo, :instance_of?, :public_send, :instance_variable_get, :instance_variable_set, :instance_variable_defined?,
 :remove_instance_variable, :private_methods, :kind_of?, :instance_variables, :tap, :is_a?, :extend, :define_singleton_method,
 :to_enum, :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?, :freeze, :inspect, :display, :send, :object_id, :to_s,
 :method, :public_method, :singleton_method, :nil?, :hash, :class, :singleton_class, :clone, :dup, :itself, :taint, :tainted?,
 :untaint, :untrust, :trust, :untrusted?, :methods, :protected_methods, :frozen?, :public_methods, :singleton_methods, :!, :==,
 :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
```

as it returns an array, there may be a way of trimming down the array to only return the values unique to that class, but that
would likely involve creating an instance object of an "empty" class and compare the two with something like this:

```
class Blank
end

class Klass
  def hello
    p "hello"
  end
  def woo
    p "hello"
  end
end

blank = Blank.new
klass = Klass.new

klass.methods.keep_if{ |method| false == blank.methods.include?(method)

```

