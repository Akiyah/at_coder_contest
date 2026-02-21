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

LS = []
XS = []
N.times do
  LS << STDIN.gets.chomp.to_i
  XS << STDIN.gets.chomp.split.map(&:to_i)
end


rs = Array.new(N)
used = []
N.times do |i|
  LS[i].times do |j|
    m = XS[i][j]
    if used[m]
      next
    else
      rs[i] = m
      used[m] = true
      break
    end
  end
end


rs.each do |r|
  puts r || 0
end


