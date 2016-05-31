=begin
Bonus problem: If you’re feeling the need for a little more, write a program that picks
a random number. Let a player guess the number, telling the player whether the guess is
too low or too high.
=end

def test_number(inputNum)
	if inputNum == 0
		puts "Hello, this is a random number guessing game, \nplease choose a number between 1 and 100"
		take_input()
	elsif inputNum < @rando
		puts 'Too low, try again!'
		take_input()
	elsif inputNum > @rando
		puts 'Too high, try again!'
		take_input()
	else
		puts 'You got it!'
	end
end

def take_input
	input = gets.strip
	# Get rid of any user input that is not a +ve number
	if !/\A\d+\z/.match(input) || input.to_i < 1
		puts 'You need to put in a positive NUMBER'
		take_input()
	else
		test_number(input.to_i)
	end
end

# global variable, I don't like it!
@rando = rand(100).to_i + 1
test_number(0)
