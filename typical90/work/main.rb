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



def create_leafs(leafs, paths, current_leaf, parent_leaf = nil, level = 0)
  pp [leafs, paths, current_leaf, parent_leaf, level] if $debug
  leafs[level] ||= []
  leafs[level] << current_leaf
  pp leafs if $debug
  child_leafs = (paths[current_leaf] - [parent_leaf])
  child_leafs.each do |child_leaf|
    #if child_leaf != parent_leaf
    create_leafs(leafs, paths, child_leaf, current_leaf, level + 1)
    #end
  end
end

leafs = []
create_leafs(leafs, paths, 1)


pp leafs if $debug

