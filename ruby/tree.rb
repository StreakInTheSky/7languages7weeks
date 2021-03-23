class Tree
  attr_accessor :children, :node_name

  def initialize(tree_hash)
    @node_name = tree_hash.keys[0]
    @children = tree_hash[@node_name].to_h {|node, children| [node, Tree.new(node => children)]}
  end

  def visit_all(&block)
    visit &block
    children.each {|node, children| children.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })


puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
