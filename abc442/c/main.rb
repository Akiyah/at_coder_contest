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
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = {}
ABS.each do |a, b|
  paths[a] ||= []
  paths[b] ||= []
  paths[a] << b
  paths[b] << a
end

def c(n, m)
  return 0 if n < 3
  return 1 if n == 3
  n * (n - 1) * (n - 2) / 6
end

rs = N.times.map do |i|
  a = i + 1
  m = paths[a] ? paths[a].length : 0
  m2 = N - 1 - m
  c(m2, 3)
end

puts rs.join(' ')



