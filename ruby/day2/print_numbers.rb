=begin
Print the contents of an array of sixteen numbers, four numbers at a time,
using just each. Now, do the same with each_slice in Enumerable.
=end

silly_array = []
16.times{
	silly_array.push(rand(10).to_i)
}
puts silly_array
