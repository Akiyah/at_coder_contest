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
XYS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(as, x, y)
  pp('---') if $debug
  pp(as:, x:, y:) if $debug
  s = (0..N).bsearch { |i| x <= as[i] }
  t = (s..N).bsearch do |i|
    pp(
      i:,
      a: as[i],
      x:,
      y:,
      s:,
      left: y,
      right: as[i] - x - (i - s),
      left_right: y <= as[i] - x - (i - s),
    ) if $debug
    y <= as[i] - x - (i - s)
  end

  pp(s:, t:, ans: x + y + (t - s)) if $debug

  x + y + (t - s) - 1
end

as = AS.sort + [10 ** 10]
rs = XYS.map do |x, y|
  calc(as, x, y)
end

rs.each do |r|
  puts r
end

# as =  [ 1, 2, 3, 9, 16, 10000000000]
# x = 1, y = 1
# s = 1 (x < as[s])

#  i, (as[i] - x + 1) - (i - s + 1)
#o  1, (1 - 1 + 1) - (0 - 1 + 1) = 1
#o  2, (2 - 1 + 1) - (1 - 1 + 1) = 1
#o  3, (3 - 1 + 1) - (2 - 1 + 1) = 1
#   4
#   5
#   6
#   7
#   8
#o  9, (9 - 1 + 1) - (3 - 1 + 1) = 6
#  10
#  11
#  12
#  14
#  15
#o 16, (16 - 1 + 1) - (4 - 1 + 1) = 12
#  17
#  18
