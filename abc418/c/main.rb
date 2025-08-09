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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = (1..Q).map do
  STDIN.gets.chomp.to_i
end


def calc(b, ss)
  x = ss.bsearch_index { |a, l, s| b - 1 < a }
  pp(b:, ss:, x:) if $debug

  return -1 unless x

  a, l, s = ss[x]
  a1, l1, s1 = ss[x - 1]
  1 + s1 + (b - 1 - a1) * l
end

h = AS.group_by { |a| a }.transform_values { |as| as.length }
pp(h:) if $debug

ss = []
ss << [0, N, 0]
s = 0
last_a = 0
sum_l = 0
h.sort.each do |a, l|
  pp(a:, l:) if $debug
  s += (a - last_a) * (N - sum_l)
  ss << [a, N - sum_l, s]
  last_a = a
  sum_l += l
end

pp(ss:) if $debug

BS.each do |b|
  puts calc(b, ss)
end

