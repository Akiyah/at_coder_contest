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

N, X = STDIN.gets.chomp.split.map(&:to_i)
UDS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

m = UDS.map { |u, d| u + d }.min

puts UDS.sum { |u, d| u + d - m }
