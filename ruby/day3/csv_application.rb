=begin
Modify the CSV application to support an each method 
to return a CsvRow object. Use method_missing on that 
CsvRow to return the value for the columnfor a given heading.

For example, for the file:
one, two
lions, tigers

allow an API that works like this:
csv = RubyCsv.new
csv.each {|row| puts row.one}
This should print "lions" .
=end

=begin
this is the example class with the missing method stuff
class Roman
	def self.method_missing name, *args
		roman = name.to_s
		roman.gsub!("IV", "IIII")
		roman.gsub!("IX", "VIIII")
		roman.gsub!("XL", "XXXX")
		roman.gsub!("XC", "LXXXX")

		(roman.count("I")
		roman.count("V")
		roman.count("X")
		roman.count("L")
		roman.count("C")
	end
end

=end

require "./acts_as_csv_module"

class RubyCsv # no inheritance! You can mix it in
	include ActsAsCsv
	acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect

csv.poo
csv.each {|row| puts row.one}