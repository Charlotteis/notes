# Notes

## Basics

- Interpreted (i.e understood on the fly, no compilation)
- Object Oriented, **everything in Ruby is an Object**
- As everything is an Object, everything has in-built Methods

- Exponentiation: `2 ** 3`
- `print`: takes exact input and prints to screen
- `puts`: takes exact input, prints it and adds a `\n` after
- You can chain methods, e.g. `"Butts".downcase.upcase.reverse`

- `thing.upcase!` modifies the variable in place
- else you'd need to do `thing2 = thing.upcase`

- `class`: defines a single type of Object
- object: a single instance of a `class`
- object orientation: using classes and objects to model real concepts
- class names start with a capital letter
- `attr_accessor` defines the attributes you can set, modify and access
- define methods in a class to have it perform actions

- the `Kernel` module is a thing that exists, the core methods of Ruby
like `puts`

- Iterator: progresses through a list of items one by one
- Range: a continuous sequence
    - `3..11`: from/to and includingm 3 and 11
    - `3...11`: fron 3 to 11, excluding 11
- `===`: is the thing on the right a member or part of the thing on the left?

## Regular Expressions (regex)

- substitute once: `"hello world".sub('hello', 'butts')`
- substitute all: `"hello, hello, world!".gsub('hello', 'butts')`
- `\A` anchors to absolute start
- `\z` anchors to absolute end
- `\^` anchors to line start
- `$/` anchors to line end
- `.` equals any char
- `+` matches one or more
- `*` matches zero or more
- `{x, y}` match at least 'x' occurences and at most 'y'
- `/[aeiou]/`, `/[a-m]/` match against specific character set
- `=~` is the matching operator
    - `puts "yay" if "butts" =~ /aeiou/`

- Iterate something with a regex using `.scan() { |x| puts x }`
- Symbols are immutable

## Date & Time

- Current date and time: `Time.now`
- `time.year`, `time.yday`, `time.wday`
- `time.zone`, `time.localtime`, `time.gmtime`
- strftime for formatting
