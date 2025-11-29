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

board1 = Array.new(2000, 0)
board2 = Array.new(2000, 0)

UDLRS.each do |u, d, l, r|
  (u..d).each do |y1|
    y = y1 - 1
    line = (2 ** r - 1) - (2 ** (l - 1) - 1)
    board2[y] |= (board1[y] & line)
    board1[y] |= line
  end
end

if $debug
  pp(
    10.times.map do |y|
      10.times.map do |x|
        board1[y][x]
      end.join('')
    end
  )
  pp(
    10.times.map do |r|
      10.times.map do |c|
        board2[r][c]
      end.join('')
    end
  )
end

sum1_all = board1.map do |z|
  z.to_s(2).chars.count { |c| c == '1' }
end.sum
pp(sum1_all:) if $debug


rs = []
UDLRS.each do |u, d, l, r|
  s2 = (u..d).each.map do |y1|
    y = y1 - 1
    line = (2 ** r - 1) - (2 ** (l - 1) - 1)
    line2 = board2[y] & line
    line2.to_s(2).chars.count { |c| c == '1' }
  end.sum
  s1 = (d - u + 1) * (r - l + 1)
  pp(s1:, s2:) if $debug
  rs << 2000 * 2000 - (sum1_all - (s1 - s2))
end

rs.each do |r|
  puts r
end


