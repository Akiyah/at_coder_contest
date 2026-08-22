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

T = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

def route_to_1(a, parent_nodes)
  rs = []
  rs << a
  while true
    a = parent_nodes[a]
    if 0 < a
      rs << a
    else
      return rs
    end
  end
end

def route(a, parent, parent_nodes)
  rs_a = route_to_1(a, parent_nodes)
  rs_parent = route_to_1(parent, parent_nodes)

  while rs_a[-1] == rs_parent[-1] && rs_a[-2] == rs_parent[-2]
    rs_a.pop
    rs_parent.pop
  end

  rs_a + rs_parent[0...-1].reverse
end

def calc(n, m, abs)
  pp(n:, m:, abs:) if $debug

  paths = {}
  abs.each do |a, b|
    paths[a] ||= {}
    paths[b] ||= {}

    paths[a][b] = true
    paths[b][a] = true
  end
  pp(paths:) if $debug

  parent_nodes = []
  parent_nodes[1] = -1
  visited_nodes = []
  visited_nodes[1] = true
  node_digits = []
  node_digits[1] = 0 % 2 # 偶数
  dp = []

  paths[1].each do |b, _|
    dp << [b, 1]
  end

  while 0 < dp.length
    pp(dp:) if $debug
    a, parent = dp.shift
    pp(a:, parent:) if $debug
    if visited_nodes[a] # 合流したとき
      pp(node_digits:) if $debug

      if node_digits[a] != (node_digits[parent] + 1) % 2
        # 奇数閉路

        rs = route(a, parent, parent_nodes)
        return rs
      end
      next
    end

    parent_nodes[a] = parent
    visited_nodes[a] = true
    node_digits[a] = (node_digits[parent] + 1) % 2

    pp(a:, parent:, 'paths[a]' => paths[a]) if $debug
    paths[a].each do |b, _|
      if b != parent
        dp << [b, a]
      end
    end
  end

  -1
end

T.times do
  n, m = STDIN.gets.chomp.split.map(&:to_i)
  abs = (1..m).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end
  rs = calc(n, m, abs)
  pp(rs:) if $debug
  if rs == -1
    puts -1
  else
    puts rs.length
    puts rs.join(' ')
  end
end

