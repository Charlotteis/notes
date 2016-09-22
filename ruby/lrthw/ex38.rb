ten_things = 'Apples Oranges Crows Telephone Light Sugar'

puts 'Wait there are not 10 things in my list. Let us fix that.'

stuff = ten_things.split(' ')
more_stuff = %w(Day Night Song Frisbee Corn Banana Girl Boy)

while stuff.length != 10
  next_one = more_stuff.pop
  puts "Adding #{next_one}"
  stuff << next_one
  puts "There are #{stuff.length} items now."
end

puts "There we go: #{stuff}"
puts 'Let us do some things with stuff.'

puts stuff[1]
puts stuff[-1]
puts stuff.pop
puts stuff.join(' ')
puts stuff[3..5].join('#')
