=begin
Modify the CSV application to support an each method to return a CsvRow
object. Use method_missing on that CsvRow to return the value for the column
for a given heading.
For example, for the file:
one, two
lions, tigers
allow an API that works like this:
csv = RubyCsv.new
csv.each {|row| puts row.one}
This should print "lions" .
=end

require "./acts_as_csv_module"

class RubyCsv # no inheritance! You can mix it in
	include ActsAsCsv
	acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect