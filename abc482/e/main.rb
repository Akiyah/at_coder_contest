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
  leafs = {}

  dp = []
  dp << root

  while 0 < dp.length
    u = dp.shift
    pp(node:) if $debug
    node_u = tree[u]
    parent = node_u[:parent]
    children = node_u[:children]
    depth = node_u[:depth]

    (paths[u] || []).each do |v|
      next if v == parent

      children << v
      tree[v] = { parent: u, children: [], depth: depth + 1}

      dp << v
    end

    if children.length == 0
      leafs[depth] ||= []
      leafs[depth] << u
    end
  end

  [tree, root, leafs]
end


def calc_2(tree, root, leafs)
  depth_max = leafs.keys.max
  pp(depth_max:) if $debug

  lines = {}
  joints = {}
  length_max = 0

  dp = []
  l_max = 0
  [0..depth_max].reverse_each do |d|
    if leafs[d]
      leafs[d].each do |u|
        lines[u] = [0, [u]] # [l, us]
      end
      dp += leafs[d]
    end
    dp.each do |u|
      node_u = tree[u]
      parent = node_u[:parent]
      children = node_u[:children]
      depth = node_u[:depth]


      # parent = tree[u][:parent]
      # l_u = tree[u][:length]
      # l_p = tree[parent][:length]
      if !l
        l = tree[u][:length] + 1

        if l_max < l
          l_max = l
        end
      else
        if l < tree[u][:length] + 1
          l = tree[u][:length] + 1
        end
      end
    end

  end
  while 0 < dp.length

    
  end
end

def calc
  tree, root, leafs = create_tree()
  pp(tree:, root:, leafs:) if $debug

  calc_2(tree, root, leafs)
end

puts calc
