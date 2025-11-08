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

X = STDIN.gets.chomp.to_i
N = STDIN.gets.chomp.to_i
WS = STDIN.gets.chomp.split.map(&:to_i)
Q = STDIN.gets.chomp.to_i
PS = (1..Q).map do
  STDIN.gets.chomp.to_i
end


parts = {}
w = X
PS.each do |p|
  if parts[p - 1]
    w -= WS[p - 1]
    parts[p - 1] = false
  else
    w += WS[p - 1]
    parts[p - 1] = true
  end
  puts w
end



