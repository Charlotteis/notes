# Decorators

Before decorators, you might heavily rely on subclassing.

```ruby
class Cake
  def price
    10
  end
end

class CakeWithIcing < Cake
  def price
    super + 5
  end
end

def CakeWithIcingAndSprinkles < Cake
  def price
    super + 8
  end
end
```

The downside to this is, if you changed the method name of `price` you'd have to
change the method name in all of your subclasses. Subclasses are tightly reliant
on their parent classes. If we wanted to price up a cake with two lots of icing,
this would require yet another subclass, ad infinitum.

Decorators allow you to extend functionality of a class, without reliance on
a parent class. It allows you to compose classes with much more flexibility.

```ruby
class Icing
  def initialize(component)
    @component = component
  end

  def price
    @component.price + 5
  end
end

class Sprinkles
  def initialize(component)
    @component = component
  end

  def price
    @component.price + 8
  end
end
```

This allows us to do:

```ruby
# Cake with double icing, and sprinkles!
double_icing_with_sprinkles = Icing.new(Icing.new(Sprinkles.new(Cake.new))).price
```

The features of the cake are now separate from the cake. These means we can now
compose a variety of different cakes with only _two_ decorators, rather
than a number of exhaustive subclasses (CakeWithIcing, CakeWithDoubleIcing,
CakeWithIcingAndSprinkles, CakeWithDoubleIcingAndSprinkes)
