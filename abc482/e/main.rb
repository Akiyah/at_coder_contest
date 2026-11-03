#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
UVS = (N - 1).times.map do
  STDIN.gets.chomp.split.map(&:to_i)
end
CS = STDIN.gets.chomp.split.map(&:to_i)


def create_tree()
  paths = {}
  UVS.each do |u, v|
    paths[u] ||= []
    paths[u] << v
    paths[v] ||= []
    paths[v] << u
  end
  pp(paths:) if $debug

  root = 1
  tree = {}
  tree[root] = { parent: nil, children: [], depth: 0}
  leafs = []

  dp = []
  dp << root

  while 0 < dp.length
    node = dp.shift
    pp(node:) if $debug
    parent = tree[node][:parent]
    children = tree[node][:children]
    depth = tree[node][:depth]

    (paths[node] || []).each do |v|
      next if v == parent

      children << v
      tree[v] = { parent: node, children: [], depth: depth + 1}

      dp << v
    end

    if children.length == 0
      leafs << node
    end
  end

  pp(tree:) if $debug
  pp(root:) if $debug
  pp(leafs:) if $debug

  [tree, root, leafs]
end


def calc

  tree, root, leafs = create_tree()
end

puts calc
