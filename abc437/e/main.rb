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
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



def calc_ps(node)
  # pp(node:) if $debug

  ps = []

  stack = []
  node[:child_array] = node[:child].to_a.sort_by { |y, val| y }.map { |y, val| val}
  stack << [node, 0]

  while 0 < stack.length
    node, i = stack[-1]

    if i < node[:child_array].length
      next_child_node = node[:child_array][i]
      stack[-1][1] += 1 # i += 1
      next_child_node[:child_array] = next_child_node[:child].to_a.sort_by { |y, val| y }.map { |y, val| val}
      # ps += next_child_node[:is]
      next_child_node[:is].each { |i| ps << i }
      stack << [next_child_node, 0]
    else
      stack.pop
    end
  end
  ps
end

def calc
  nodes = []
  nodes[0] = { is: [], child: {}, parent: nil }
  nodes[0][:is] << 0

  XYS.each.with_index do |(x, y), i|
    parent_node = nodes[x]
    unless parent_node[:child][y]
      parent_node[:child][y] = { is: [], child: {}, parent: parent_node }
    end
    parent_node[:child][y][:is] << i + 1
    nodes[i + 1] = parent_node[:child][y]
  end

  ps = calc_ps(nodes[0])
  ps

  # assj = ass.map.with_index { |as, i| [as, i] }.sort_by { |as, i| as }
  # pp(assj:) if $debug
  # ps = assj[1..].map { |as, i| i }
  # pp(ps:) if $debug
  # ps
end


ps = calc
puts ps.join(' ')

