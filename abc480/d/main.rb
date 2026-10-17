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
LRS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

a_sums = []
a_sum = 0
AS.each do |a|
  a_sum += a
  a_sums << a_sum
end
pp(a_sums:) if $debug

b_sums = []
b_sum = 0
N.times do |i|
  b_sum += a_sums[i]
  b_sums << b_sum
end
pp(b_sums:) if $debug


fs = (N + 1).times.map { |i| i * (i + 1) / 2 }
pp(fs:) if $debug


def calc(r, fs, a_sums, b_sums)
  i1_f = fs.bsearch_index { |f| r < f}
  i_f = i1_f - 1
  f = fs[i_f]

  x1 = a_sums[r - f]
  x2 = (0 < i_f ? b_sums[i_f - 1] : 0)
  x1 + x2
end

LRS.each do |l1, r1|
  l = l1 - 1
  r = r1 - 1

  x1 = (l == 0 ? 0 : calc(l - 1, fs, a_sums, b_sums))
  x2 = calc(r, fs, a_sums, b_sums)

  puts x2 - x1
end

