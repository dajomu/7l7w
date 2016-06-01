=begin
Print the contents of an array of sixteen numbers, four numbers at a time,
using just each. Now, do the same with each_slice in Enumerable.
=end

counter = 0
outText = ''

# instantiate array with set of 16 random numbers
silly_array = []
16.times{
	silly_array.push(rand(10).to_i)
}

puts silly_array

=begin
# iterate over full array with each
silly_array.each do|num| 
	outText = outText + num.to_s + ' '
	counter += 1
	# when we get to a count of 4 print result and reset
	if counter == 4
		puts outText
		counter = 0
		outText = ''
	end
end
=end

# iterate over full array with each_slice
silly_array.each_slice do|num| 
	puts "#{num}"
end