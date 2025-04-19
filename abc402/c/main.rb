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
KAS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
BS = STDIN.gets.chomp.split.map(&:to_i)

rbs = []
BS.each.with_index do |b, i|
  rbs[b - 1] = i
end


ps = KAS.map do |k, *as|
  as.map { |a| rbs[a - 1] }.max
end

pp ps if $debug

ds = Array.new(N) { 0 }
ps.each do |p| ds[p] += 1 end

rs = []
r = 0
(0...N).each do |i|
  r += ds[i]
  rs << r
end

rs.each do |r|
  puts r
end
