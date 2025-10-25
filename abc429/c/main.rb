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
AS = STDIN.gets.chomp.split.map(&:to_i)

h = {}
AS.each do |a|
  h[a] ||= 0
  h[a] += 1
end

l = h.length
r = 0
h.each do |a, c|
  if 2 <= c
    r += (N - c) * (c * (c - 1) / 2)
  end
end

puts r





