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

def calc(as, xis, yis)

  jx = 0
  jy = 0
  as.each.with_index do |a, j|
    while jx < Q && xis[jx][0] < a
      xis[jx][2] = j
      jx += 1
    end
    while jy < Q && yis[jy][0] < a
      yis[jy][2] = j
      jy += 1
    end
  end

  pp(as:, xis:, yis:) if $debug

  ds = []
  xis.each do |x, i, j|
    ds[i] = [x, j || N]
  end

  es = []
  yis.each do |y, i, j|
    x, jx = ds[i]
    es[i] = [x, y, (j || N) - jx]
  end

  rs = es.map do |x, y, j|
    x + y - 1 + j
  end
  rs
end

as = AS.sort
xis = XYS.map.with_index { |(x, y), i| [x, i] }.sort_by { |x, i| x }
yis = XYS.map.with_index { |(x, y), i| [y, i] }.sort_by { |y, i| y }
rs = calc(as, xis, yis)

rs.each do |r|
  puts r
end

