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
SS = (1..N).map do
  STDIN.gets.chomp
end



r0 = SS.tally.values.map { |c| c * (c - 1) / 2 }.sum
pp(r0:) if $debug

s1s = []
M.times do |i|
  SS.each do |s|
    s1 = s.dup
    s1[i] = '*'
    s1s << s1
  end
end
pp(s1s:) if $debug
r1 = s1s.tally.values.map { |c| c * (c - 1) / 2 }.sum
pp(r1:) if $debug

s2s = []
(0...M).to_a.combination(2).each do |i, j|
  SS.each do |s|
    s2 = s.dup
    s2[i] = '*'
    s2[j] = '*'
    s2s << s2
  end
end
pp(s2s:) if $debug
r2 = s2s.tally.values.map { |c| c * (c - 1) / 2 }.sum
pp(r2:) if $debug

r0_ = r0
r1_ = r1 - r0_ * M
r2_ = r2 - r1_ * (M - 1) - r0_ * M * (M - 1) / 2
pp(r0_:, r1_:, r2_:) if $debug

r = r0_ + r1_ + r2_
puts r
