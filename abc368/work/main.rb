# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


N, K = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
VS = STDIN.gets.chomp.split.map(&:to_i)


def create_tree(edges, depth_tree)
  d = 0

  while depth_tree[d] do
    depth_tree[d].each do |tree|
      tree[:child_nodes].each do |child_node|
        child_child_nodes = edges[child_node] - [tree[:node]]

        new_tree = { parent_node: tree[:node], node: child_node, depth: d + 1, child_nodes: child_child_nodes }
        depth_tree[d + 1] ||= []
        depth_tree[d + 1] << new_tree    
      end
    end

    d += 1
  end
end


def count_tree(depth_tree, edges, status)

  max_depth = depth_tree.length - 1

  (0..max_depth).to_a.reverse.each do |d|
    pp ['d', d] if $debug
    trees = depth_tree[d]
    trees.each do |tree|
      pp ['tree', tree] if $debug
      child_nodes = tree[:child_nodes]

      pp ['child_nodes', child_nodes, child_nodes&.any? { |child_node| status[child_node] } ] if $debug
      if child_nodes && child_nodes.any? { |child_node| status[child_node] }
        status[tree[:node]] = true
      end
    end
  end

  pp status if $debug
  status.count
end


def count()
  
  edges = Array.new { [] }
  ABS.each do |a, b|
    edges[a] ||= []
    edges[a] << b
    edges[b] ||= []
    edges[b] << a
  end

  status = {}
  VS.each do |i|
    status[i] = true
  end
  pp status if $debug
  
  tree = { parent_node: nil, node: VS[0], depth: 0, child_nodes: edges[VS[0]] || [] }
  depth_tree = [[tree]]
  create_tree(edges, depth_tree)

  pp tree if $debug
  pp depth_tree if $debug




  # parent_node = 1
  # nodes = edges[parent_node]

  
  count_tree(depth_tree, edges, status)

end



puts count()
