=begin
Print the contents of an array of sixteen numbers, four numbers at a time,
using just each. Now, do the same with each_slice in Enumerable.
=end

counter = 0

# instantiate array with set of 16 random numbers
silly_array = []
16.times{
	silly_array.push(rand(10).to_i)
}

# iterate over full array with each
silly_array.each do|num| 
	print "#{num} "
	counter += 1
	# when we get to a count of 4 print result and reset
	if counter == 4
		counter = 0
		puts ''
	end
end

# iterate over full array with each_slice
silly_array.each_slice(4) do|num_array| 
	num_array.each {|num| print "#{num} "}
	puts ''
end

# that was a bit easier