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
AS = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
UVS.each do |u, v|
  paths[u - 1] ||= []
  paths[u - 1] << v - 1
  paths[v - 1] ||= []
  paths[v - 1] << u - 1
end


rs = []

dp = []
dp << [0, nil, false, {}] # [node, parent]
pp(dp:) if $debug

rs[0] = false

while 0 < dp.length
  node, parent, b, node_as = dp.shift
  pp(node:, parent:, b:, node_as:) if $debug
  b_new = false

  pp(b:, node:, AS:, node_as:) if $debug
  if b || node_as[AS[node]]
    rs[node] = true
    b_new = true
  else
    rs[node] = false
    b_new = false
  end

  if paths[node]
    if paths[node].length == 2 # 子供が一本
      paths[node].each do |v|
        if v != parent
          if b_new
            dp << [v, node, b_new, {}]
          else
            node_as[AS[node]] = true
            dp << [v, node, b_new, node_as]
          end
        end
      end
    else
      paths[node].each do |v|
        if v != parent
          if b_new
            dp << [v, node, b_new, {}]
          else
            node_as_new = node_as.dup
            node_as_new[AS[node]] = true
            dp << [v, node, b_new, node_as_new]
          end
        end
      end
    end
  end
end

rs.each do |r|
  puts r ? 'Yes' : 'No'
end







