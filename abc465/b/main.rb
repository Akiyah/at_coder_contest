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

X, Y, L, R, A, B = STDIN.gets.chomp.split.map(&:to_i)

r = 0
(A...B).each do |t|
  if L <= t && t < R
    r += X
  else
    r += Y
  end
end


puts r
