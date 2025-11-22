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
SS = STDIN.gets.chomp.split
AS = SS.map(&:to_i)


als = []
(0..10).each do |l|
  als[l] = {}
end

N.times do |i|
  (1..10).each do |l|
    d = AS[i] * (10 ** l) % M
    als[l][d] ||= 0
    als[l][d] += 1
  end
end

pp(als:) if $debug

bs = []
(1..10).each do |l|
  bs[l] = {}
end
N.times do |i|
  l = SS[i].length
  pp(i:, ssi: SS[i], l:) if $debug
  d = AS[i] % M
  bs[l][d] ||= 0
  bs[l][d] += 1
end

pp(bs:) if $debug

r = 0
(1..10).each do |l|
  bs[l].each do |d, c|
    d2 = (M - d) % M
    r += (als[l][d2] || 0) * c
  end
end


puts r


