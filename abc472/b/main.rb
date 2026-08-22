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
LS = STDIN.gets.chomp.split.map(&:to_i)

l0 = 0
l1 = LS.sum
cs = (N - 1).times.map do |i|
  l = LS[i]

  l0 += l
  l1 -= l

  (l0 - l1).abs
end

puts cs.min
