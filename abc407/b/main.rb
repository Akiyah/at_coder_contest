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

X, Y = STDIN.gets.chomp.split.map(&:to_i)

r = 0
(1..6).each do |a|
  (1..6).each do |b|
    r += 1 if X <= a + b || Y <= (a-b).abs
  end
end


puts r / 36.0




