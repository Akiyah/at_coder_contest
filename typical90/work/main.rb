# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
ABS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
ABS.each do |a, b|
  paths[a] ||= []
  paths[a] << b
  paths[b] ||= []
  paths[b] << a
end

pp paths if $debug



def create_depth_leafs(paths)
  parent_child_nodes = [[nil, 1]]
  depth_leafs = {}

  depth = 0
  while !parent_child_nodes.empty?
    next_parent_child_nodes = []

    parent_child_nodes.each do |parent_node, child_node|
      descendant_nodes = paths[child_node] - [parent_node]
      if descendant_nodes.empty?
        depth_leafs[depth] ||= []
        depth_leafs[depth] << child_node
      else
        descendant_nodes.each do |descendant_node|
          next_parent_child_nodes << [child_node, descendant_node]
        end
      end    
    end

    parent_child_nodes = next_parent_child_nodes
    depth += 1
  end

  depth_leafs
end

depth_leafs = create_depth_leafs(paths)


pp depth_leafs if $debug


distances = Array.new(N)
max_distance = 0
depth_leafs.keys.sort.each do |depth|
  depth_leafs[depth].each do |leaf|
    # 親に登っていく
    parend_child_nodes = [leaf, nil]
    next_parend_child_nodes = []
    d = 0
    while !parend_child_nodes.empty?

      parend_child_nodes.each do |parent_node, child_node|
        distances[parent_node] = d
      end

      parend_child_nodes = next_parend_child_nodes
      d += 1
    end

    puts leaf
  end
end
