print 'Give me a number: '
number = gets.chomp.to_f

bigger = number * 100
puts "A bigger number is #{bigger}."

print 'Give me a another number: '
another = gets.chomp
number = another.to_f

smaller = number / 100
puts "A smaller number is #{smaller}."

# Study drill
print 'Give me some money!: '
money = gets.chomp.to_f
puts "Here, you can have #{money / 10}, which is 10% back."
