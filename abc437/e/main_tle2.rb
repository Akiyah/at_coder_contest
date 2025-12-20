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
  pp(node:) if $debug
  ps = node[0]
  child = node[1]
  ys = child.keys.sort
  ys.each do |y|
    child_node = child[y]
    ps += calc_ps(child_node)
  end
  ps
end

def calc
  nodes = []
  nodes[0] = [[], {}]
  nodes[0][0] << 0

  XYS.each.with_index do |(x, y), i|
    parent_node = nodes[x]
    unless parent_node[1][y]
      parent_node[1][y] = [[], {}]
    end
    parent_node[1][y][0] << i + 1
    nodes[i + 1] = parent_node[1][y]
  end

  
  ps = calc_ps(nodes[0])
  ps[1..]

  # assj = ass.map.with_index { |as, i| [as, i] }.sort_by { |as, i| as }
  # pp(assj:) if $debug
  # ps = assj[1..].map { |as, i| i }
  # pp(ps:) if $debug
  # ps
end


ps = calc
puts ps.join(' ')

