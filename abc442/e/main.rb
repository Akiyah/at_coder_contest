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
  xysris = XYS.map.with_index do |(x, y), i|
    s = ((0 < x || (x == 0 && 0 < y)) ? 1 : -1)
    r = (x == 0 ? -Float::INFINITY : -Rational(y, x))
    [x, y, s, r, i]
  end

  xysris.sort_by! { |(x, y, s, r, i)| [s, r] }

  sr2is = Hash.new{ |hash, key| hash[key] = [] }
  sr_counts_sum = {}
  last_sr = nil

  xysris.each.with_index do |(x, y, s, r, i), j|
    sr = [s, r]
    sr2is[sr] << i
    sr_counts_sum[sr] = j + 1
    last_sr = sr
  end

  sr_counts_by_i = []
  sr_counts_sum_by_i = []

  sr2is.each do |sr, is|
    sr_count_sum = sr_counts_sum[sr]
    is.each do |i|
      sr_counts_by_i[i] = is.length
      sr_counts_sum_by_i[i] = sr_count_sum
    end
  end

  ABS.each do |a, b|
    count0 = sr_counts_sum_by_i[a - 1]
    count_line0 = sr_counts_by_i[a - 1]
    count1 = sr_counts_sum_by_i[b - 1]

    if count0 <= count1
      ans = count1 - count0 + count_line0
    else
      ans = N - count0 + count1 + count_line0
    end
    puts ans
  end
end

calc