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
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
ABS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  xyis = XYS.map.with_index { |(x, y), i| [x, y, i] }
  xyis_plus = xyis.select { |x, y, i| 0 < x || (x == 0 && 0 < y) }
  # xyis_minus = xyis.select { |x, y, i| !(0 < x || (x == 0 && 0 < y)) }
  xyis_minus = xyis.select { |x, y, i| x < 0 || (x == 0 && y < 0) }

  xysris_plus = xyis_plus.map do |x, y, i|
    r = (x == 0 ? -Float::INFINITY : -Rational(y, x))
    [x, y, 1, r, i]
  end

  xysris_minus = xyis_minus.map do |x, y, i|
    r = (x == 0 ? -Float::INFINITY : -Rational(y, x))
    [x, y, -1, r, i]
  end

  xysris_plus.sort_by! { |(x, y, s, r, i)| r }
  xysris_minus.sort_by! { |(x, y, s, r, i)| r }

  xysris = xysris_plus + xysris_minus

  pp(xysris:) if $debug

  # sr2is = {}
  # sr2is[1] = Hash.new{ |hash, key| hash[key] = [] }
  # sr2is[-1] = Hash.new{ |hash, key| hash[key] = [] }
  # sr_counts_sum = {}
  # sr_counts_sum[1] = {}
  # sr_counts_sum[-1] = {}

  # xysris.each.with_index do |(x, y, s, r, i), j|
  #   sr = [s, r]
  #   sr2is[s][r] << i
  #   sr_counts_sum[s][r] = j + 1
  # end

  # monster_counts = []
  # monster_counts_sum = []

  # sr2is.each do |s, r2is|
  #   r2is.each do |r, is|
  #     sr_count_sum = sr_counts_sum[s][r]
  #     is.each do |i|
  #       monster_counts[i] = is.length
  #       monster_counts_sum[i] = sr_count_sum
  #     end
  #   end
  # end

  sum = 0
  monster_counts = []
  monster_counts_sum = []
  xysris.chunk_while { |(x0, y0, s0, r0, i0), (x1, y1, s1, r1, i1)| s0 == s1 && r0 == r1 }.each do |line_xysris|
    pp(line_xysris:) if $debug
    l = line_xysris.length
    sum += l
    line_xysris.each do |x, y, s, r, i|
      monster_counts[i] = l
      monster_counts_sum[i] = sum
    end
  end

  pp(monster_counts:, monster_counts_sum:) if $debug

  rs = ABS.map do |a, b|
    count_sum0 = monster_counts_sum[a - 1]
    count0 = monster_counts[a - 1]
    count_sum1 = monster_counts_sum[b - 1]

    if count_sum0 <= count_sum1
      count_sum1 - count_sum0 + count0
    else
      N - count_sum0 + count_sum1 + count0
    end
  end
  puts rs
end

calc