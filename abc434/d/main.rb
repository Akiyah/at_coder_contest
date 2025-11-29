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
UDLRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

# board1 = Array.new(2000, 0)
# board2 = Array.new(2000, 0)
board1 = 0
board2 = 0

z2000 = 2 ** 2000

rows = [1]
(1...2000).each do |y|
  rows << rows[-1] + (1 << (2000 * y))
end
# rows_sum = []
# rows_sum[0] = rows[0] # 1
# (1...2000).each do |y|
#   rows_sum << rows_sum[y - 1] + rows[y]
# end


areas = []
UDLRS.each.with_index do |(u, d, l, r), i|
  pp(i:) if $debug
  line = (2 ** r - 1) - (2 ** (l - 1) - 1)
  # r = rows[(u - 1)..(d - 1)].sum
  if 0 < (u - 1)
    r = rows[d - 1] - rows[(u - 1) - 1]
  else
    r = rows[d - 1]
  end
  areas << line * r
end

areas.each do |area|
  board2 |= (board1 & area)
  board1 |= area
end

if $debug
  pp(
    10.times.map do |y|
      10.times.map do |x|
        board1[y * 2000 + x]
      end.join('')
    end
  )
  pp(
    10.times.map do |y|
      10.times.map do |x|
        board2[y * 2000 + x]
      end.join('')
    end
  )
end

sum1_all = board1.to_s(2).count('1')
pp(sum1_all:) if $debug


rs = []
areas.each.with_index do |(area), i|
  s2 = (board2 & area).to_s(2).count('1')
  u, d, l, r = UDLRS[i]
  s1 = (d - u + 1) * (r - l + 1)
  pp(i:, s1:, s2:) if $debug
  rs << 2000 * 2000 - (sum1_all - (s1 - s2))
end

rs.each do |r|
  puts r
end


