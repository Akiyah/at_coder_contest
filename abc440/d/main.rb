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

def calc(as, xyis)
  pp(as:, xyis:) if $debug

  j = 0
  as.each.with_index do |a, i|
    while j < Q && xyis[j][:x] <= a
      xyis[j][:left_a_count_of_x] = i
      xyis[j][:left_count_of_x] = (xyis[j][:x] - 1) - i
      xyis[j][:left_count_of_y] = (xyis[j][:x] - 1) - i + (xyis[j][:y] - 1)
      j += 1
    end
  end
  while j < Q
    xyis[j][:left_a_count_of_x] = N
    xyis[j][:left_count_of_x] = (xyis[j][:x] - 1) - N
    xyis[j][:left_count_of_y] = (xyis[j][:x] - 1) - N + (xyis[j][:y] - 1)
    j += 1
  end

  # as: [1, 2, 3, 9, 16],
  # xyis:
  # [{x: 1, y: 1, i: 2},
  #  {x: 6, y: 10, i: 0},
  #  {x: 12, y: 4, i: 1},
  #  {x: 1000000000, y: 1000000000, i: 3}]}

  #  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
  #  a, a, a,                a,                          a,
  #  0, 0, 0, 0, 1, 2, 3, 4, 5,  5,  6,  7,  8,  9, 10, 11, 11, 12, 13, 14 : left_count
  # x0,            x1,                  x2,
  #          y0,                                    y2,     y1,


  xyis2 = xyis.sort_by { |xyi| xyi[:left_count_of_y] }

  pp(as:, xyis:, xyis2:) if $debug

  rs = []
  j = 0
  last_a = 0
  as.each.with_index do |a, i|
    pp(a:, i:) if $debug
    left_count_of_a = a - (i + 1)
    while j < Q && xyis2[j][:left_count_of_y] < left_count_of_a
      pp(j:) if $debug
      i2 = xyis2[j][:i]
      rs[i2] = a - (left_count_of_a - xyis2[j][:left_count_of_y])
      j += 1
      pp(rs:) if $debug
    end
    last_a = a
  end
  pp('as loop end') if $debug
  while j < Q
    pp(j:) if $debug
    i2 = xyis2[j][:i]
    rs[i2] = xyis2[j][:left_count_of_y] + N + 1
    j += 1
    pp(rs:) if $debug
  end

  rs
end

as = AS.sort
xyis = XYS.map.with_index { |(x, y), i| {x:, y:, i:} }.sort_by { |xyi| xyi[:x] }
rs = calc(as, xyis)

rs.each do |r|
  puts r
end

