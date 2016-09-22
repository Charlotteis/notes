the_count = [1, 2, 3, 4, 5]
fruits = %w(apples oranges pears apricots)
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# the first kind of for-loop goes through a list in a more traditional
# style found in other languages
# for number in the_count
#   puts "This is count #{number}"
# end

the_count.each do |number|
  puts "This is count #{number}"
end

# same as above, but in a more Ruby style. this and the next one are
# the preferred way Ruby for-loops are written
fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

# also we can go through mixed lists too, note this is yet another style,
# exactly like above but a different syntax
change.each { |i| puts "I got #{i}" }

# we can also build lists, first start with an empty one
elements = []

# then use the range operator to do 0 to 5 counts
(0..5).each do |i|
  puts "Adding #{i} to the list."
  # pushes the i variable on the end of the list
  elements << i
end

# now we can print them out too
elements.each { |i| puts "Element was: #{i}" }
