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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


cs = Array.new(N + 1, 1)
v_min = 1

XYS.each do |x, y|
  unless v_min <= x
    puts 0
    next
  end

  s = (v_min..x).map do |v|
    cs[v]
  end.sum
  cs[y] += s
  v_min = x + 1
  puts s
end








