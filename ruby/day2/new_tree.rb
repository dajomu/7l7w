=begin
The Tree class was interesting, but it did not allow you to specify a new
tree with a clean user interface. Let the initializer accept a nested
structure of hashes. You should be able to specify a tree like this:
{'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
'child 4' => {} } } }.
=end

=begin 
# Old implementation -
class Tree
	attr_accessor :children, :node_name
	def initialize(name, children=[])
		@children = children
		@node_name = name
	end
	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new( "Ruby",
	[Tree.new("Reia"),
	Tree.new("MacRuby")] )

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
=end

class BetterTree
	# Added depth in to make visit_all print out prettier
	attr_accessor :children, :node_name, :depth

	def initialize(fam_hash, depth = 0)
		# Class expects a hash on init, so we convert to array if original ancestor
		if depth == 0
			fam_hash = fam_hash.to_a[0]
		end

		# Have to set children by mapping hash to array and generating new trees
		@children = fam_hash[1].to_a.map{|sibling| BetterTree.new(sibling, depth + 1)}
		@node_name = fam_hash[0]
		@depth = depth
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

hash_fam = {
	'grandpa' => { 
		'dad' => {
			'child 1' => {}, 
			'child 2' => {} }, 
		'uncle' => {
			'child 3' => {},
			'child 4' => {} } } }

new_tree = BetterTree.new(hash_fam)

puts "Visiting a node"
new_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
new_tree.visit_all  do|node|
	if node.depth > 0
		node.depth.times{print '  '}
		print '-'
	end
	puts node.node_name
end
