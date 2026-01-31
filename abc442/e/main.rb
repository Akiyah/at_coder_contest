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

  xyis_plus.sort! { |(x0, y0, i0), (x1, y1, i1)| y1 * x0 <=> y0 * x1 }
  xyis_minus.sort! { |(x0, y0, i0), (x1, y1, i1)| y1 * x0 <=> y0 * x1 }

  xyis2 = xyis_plus + xyis_minus

  pp(xyis2:) if $debug

  s = 0
  monster_counts = []
  monster_counts_sum = []
  xyis2.chunk_while { |(x0, y0, i0), (x1, y1, i1)| y1 * x0 == y0 * x1 }.each do |line_xyis|
    pp(line_xyis:) if $debug
    l = line_xyis.length
    s += l
    line_xyis.each do |x, y, i|
      monster_counts[i] = l
      monster_counts_sum[i] = s
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