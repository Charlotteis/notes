from_file, to_file = ARGV
puts "Copying from #{from_file} to #{to_file}"

indata = open(from_file).read

puts "The input file is #{indata.length} bytes long"
out_file = open(to_file, 'w')
out_file.write(indata)

puts "Alright, all done."

out_file.close
in_file.close
