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
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
UVS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


UVS.each do |u1, v1|
  u = u1 - 1
  v = v1 - 1

  if u < v
    u += N
  end

  x_sum = 0
  y_sum = 0
  (v..u).each do |i|
    x, y = XYS[i % N]
    x_sum += x
    y_sum += y
  end

  puts [x_sum.to_f / (u - v + 1), y_sum.to_f / (u - v + 1)].join(' ')
end



