module SexierArray
	include Array

	def self.method_missing name, *args
		column = name.to_s
		puts column
	end

end

class SuperArray # no inheritance! You can mix it in
	include SexierArray
end

module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include Enumerable
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			# note to self - create new class that extends array with method_missing 
			@csv_contents = SuperArray.new
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')
			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		def poo
			puts 'poo'
		end

		def each(&block)
			@csv_contents.each do |member|
				puts member
				puts block
				block.call(member)
			end
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end
	end
end