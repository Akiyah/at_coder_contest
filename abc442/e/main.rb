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
  xysrs = XYS.map do |x, y|
    s = ((0 < x || (x == 0 && 0 < y)) ? 1 : -1)
    r = (x == 0 ? -Float::INFINITY : -Rational(y, x))
    [x, y, s, r]
  end

  xysrs.sort_by! { |(x, y, s, r)| [s, r] }

  srs = []
  sr_counts = Hash.new{ |hash, key| hash[key] = 0 }
  last_sr = nil

  xysrs.each do |x, y, s, r|
    sr = [s, r]
    srs << sr unless last_sr == sr
    sr_counts[sr] += 1
    last_sr = sr
  end

  sr_counts_sum = Hash.new{ |hash, key| hash[key] = 0 }
  last_count = 0
  srs.each do |sr|
    last_count += sr_counts[sr]
    sr_counts_sum[sr] = last_count
  end

  ABS.each do |a, b|
    x0, y0 = XYS[a - 1]
    x1, y1 = XYS[b - 1]

    s0 = ((0 < x0 || (x0 == 0 && 0 < y0)) ? 1 : -1)
    r0 = (x0 == 0 ? -Float::INFINITY : -Rational(y0, x0))
    s1 = ((0 < x1 || (x1 == 0 && 0 < y1)) ? 1 : -1)
    r1 = (x1 == 0 ? -Float::INFINITY : -Rational(y1, x1))

    sr0 = [s0, r0]
    count0 = sr_counts_sum[sr0]
    count_line0 = sr_counts[sr0]

    sr1 = [s1, r1]
    count1 = sr_counts_sum[sr1]
    count_line1 = sr_counts[sr1]

    if count0 == count1
      ans = count_line0
    elsif count0 < count1
      ans = count1 - count0 + count_line0
    else
      ans = N - (count0 - count1 + count_line1) + count_line0 + count_line1
    end
    puts ans
  end
end

calc