@numbers = []
def while_loop(number)
  i = 0
  while i < number
    puts "At the top, i is #{i}"
    @numbers.push(i)

    i += 1
    puts 'Numbers now: ', @numbers
    puts "At the bottom, i is #{i}"
  end
end

while_loop(6)

puts 'The numbers: '
@numbers.each { |num| puts num }
