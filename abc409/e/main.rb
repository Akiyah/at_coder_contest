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
XS = STDIN.gets.chomp.split.map(&:to_i)
UVWS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc_tree(node)
end

def calc
  paths = {}
  UVWS.each do |u, v, w|
    paths[u - 1] ||= {}
    paths[u - 1][v - 1] = w
    paths[v - 1] ||= {}
    paths[v - 1][u - 1] = w
  end

  pp(paths:) if $debug
  nodes = []
  d = 0
  nodes[d] = []
  nodes[d] << { current: 0, parent: nil }

  while 0 < nodes[d].length
    nodes[d + 1] = []

    nodes[d].each do |node|
      pp(node:) if $debug
      u = node[:current]
      parent = node[:parent]
      paths[u].each do |v, w|
        next if v == parent
        
        nodes[d + 1] << { current: v, parent: u}
      end
    end

    d += 1
  end

  cost = 0
  xs = XS.dup
  nodes.reverse.each do |nodes_d|
    nodes_d.each do |node|
      u = node[:current]
      parent = node[:parent]
      if parent
        w = paths[u][parent]
        cost += xs[u].abs * w
        xs[parent] += xs[u]
      end
    end
  end

  cost
end


puts calc

