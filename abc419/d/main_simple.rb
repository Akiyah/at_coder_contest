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
S = STDIN.gets.chomp
T = STDIN.gets.chomp
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

s = S
t = T
pp(s:, t:) if $debug
LRS.each do |l, r|
  pp(l:, r:) if $debug
  s2 = s[0...(l - 1)] + t[(l - 1)..(r - 1)] + (s[r..] || '')
  t2 = t[0...(l - 1)] + s[(l - 1)..(r - 1)] + (t[r..] || '')
  s = s2
  t = t2
  pp(s:, t:) if $debug
end


puts s

