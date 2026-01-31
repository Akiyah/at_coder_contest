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

T = STDIN.gets.chomp.to_i


def calc(n, c, board)
  pp(n:, c:) if $debug
  breakable = board[0]

  dp = 1 << c
  pp(dp: dp.to_s(2)) if $debug
  (1...n).each do |i|
    pp(i:) if $debug
    z = board[i]
    dp = (dp | (dp << 1) | (dp >> 1)) & (z | breakable)
    breakable &= (z | dp)
    pp(dp: dp.to_s(2)) if $debug
    break if dp == 0
  end

  r = dp.to_s(2)
  r = '0' * (n - r.length) + r
  r
end


T.times do
  n, c = STDIN.gets.chomp.split.map(&:to_i)
  board = (1..n).map do
    # STDIN.gets.chomp.chars.map.with_index { |c, i| c == '.' ? 1 << i : 0 }.sum
    STDIN.gets.chomp.tr('.#', '10').to_i(2)
  end.reverse

  puts calc(n, n - c, board)
end

