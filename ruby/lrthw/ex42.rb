class Animal
end

## Dog is-a Animal
class Dog < Animal
  def initialize(name)
    # The dog has-a name
    @name = name
  end
end

## Cat is-a Animal
class Cat < Animal
  def initialize(name)
    # The cat has-a name
    @name = name
  end
end

## The Person is-a new class
class Person
  def initialize(name)
    ## A person has-a name
    @name = name

    # A person has-a pet
    @pet = nil
  end

  attr_accessor :pet
end

# Employee is-a type of Person
class Employee < Person
  def initialize(name, salary)
    # an employee has a name
    super(name)
    # an emaployee has a salary
    @salary = salary
  end
end

## The Fish is an object
class Fish
end

# Salmon is-a type of Fish
class Salmon < Fish
end

# Halibut is-a type of Fish
class Halibut < Fish
end

## Rover is-a Dog
rover = Dog.new('Rover')
## Satan is-a Cat
satan = Cat.new('Satan')
## Mary is-a Person
mary = Person.new('Mary')
## Mary has-a pet named Satan
mary.pet = satan
## Frank is-an Employee
frank = Employee.new('Frank', 120_000)
## Frank has a pet named Rover
frank.pet = rover
## Flipper is a fish
flipper = Fish.new
## Crouse is a Salmon
crouse = Salmon.new
## Harry is a Halibut
harry = Halibut.new
