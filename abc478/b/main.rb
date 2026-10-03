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

N, V = STDIN.gets.chomp.split.map(&:to_i)
WS = STDIN.gets.chomp.split.map(&:to_i)
pp(WS:) if $debug

ws = WS.map.with_index { |w, i| [w, i + 1] }

m = 0
ws.combination(3).each do |(w0, i0), (w1, i1), (w2, i2), |
  s = w0 + w1 + w2
  # pp(vs:, s:) if $debug
  if i0 + i1 + i2 <= V && m < s
    m = s
  end
end

puts m
