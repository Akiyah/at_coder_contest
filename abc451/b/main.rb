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

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


x = {}
x.default = 0
y = {}
y.default = 0
ABS.each do |a, b|
  x[a] += 1
  y[b] += 1
end


(1..M).each do |i|
  puts y[i] - x[i]
end




