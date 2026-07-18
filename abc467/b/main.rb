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
ABSS = (1..N).map do
  a, b, s = STDIN.gets.chomp.split
  [a.to_i, b.to_i, s]
end

r = 0
ABSS.each do |a, b, s|
  if s == 'keep'
    r += b - a
  end
end


puts r
