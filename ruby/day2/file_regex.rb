=begin
Write a simple grep that will print the lines of a file having any occur- rences of a phrase
anywhere in that line. You will need to do a simple regular expression match and read lines
from a file. (This is surprisingly simple in Ruby.) If you want, include line numbers.
=end

default_filename ='file_regex_test.txt'
$marker = '-------------------------------'

def test_file_for_string(file_name, test_string)
	found_strings = []
	puts $marker
	puts "Testing {#{file_name}} for instances of {#{test_string}}"
	puts $marker
	# Open the file and check for string in each line
	File.open(file_name).each.with_index { |line, i|
	    if line =~ /#{test_string}/ then found_strings.push("ln#{i} - #{line}") end
	}
	# Print out results
	if found_strings.length == 0
		puts 'No instances of the word found, sorry!'
	else
		puts "Found #{found_strings.length} lines!"
		puts $marker
		found_strings.each{|line| puts line}
	end
	puts $marker
	puts
	# Re-run check if the user wants to
	puts "Would you like to check {#{file_name}} for any other words (n for no)?"
	test_string = gets.strip
	if test_string == 'n'
		puts 'thanks, have a nice day!'
	else
		test_file_for_string(file_name, test_string)
	end
end

puts 'Hello, we are going to test a file (that you choose) for any instances of a word (that you input).'
puts 'Please choose a file (leave blank for default file)'
# Request filename and see if file exists, if not revert to default
file_name = gets.strip
if file_name == '' then file_name = default_filename end
begin
	File.open(file_name)
rescue
	file_name = default_filename
	puts "File not found, reverting to default file: {#{file_name}}"
end

puts 'Please choose a word to search for'
test_string = gets.strip
puts

test_file_for_string(file_name, test_string)
