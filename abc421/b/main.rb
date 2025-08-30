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

def f(x)
  x.to_s.reverse.to_i
end

a = []
a[0] = X
a[1] = Y
(2...10).each do |i|
  a[i] = f(a[i - 1] + a[i - 2])
end

puts a[10 - 1]




