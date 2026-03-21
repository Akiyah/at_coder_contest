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
CS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp(CS:) if $debug

r = (0...N).to_a.combination(3).any? do |a, b, c|
  pp(a:, b:, c:) if $debug
  CS[a][b - a - 1] + CS[b][c - b - 1] < CS[a][c - a - 1]
end


puts r ? 'Yes' : 'No'