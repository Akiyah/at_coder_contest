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
PABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
XS = (1..Q).map do
  STDIN.gets.chomp.to_i
end

def calc_xis(xis)
  d = 0
  xis_by_x = []

  pp(xis:, d:, xis_by_x:) if $debug
  PABS.each do |p, a, b|
    pp(p:, a:, b:) if $debug
    m = [p, b].max
    i = xis.bsearch_index { |x2, i2| m < x2 + d } # 十分に大きいので、個別に扱わないもの

    if i
      xis_low = xis[...i]
      xis_high = xis[i..]
    else
      xis_low = xis
      xis_high = []
    end

    pp(i:, xis_low:, xis_high:) if $debug

    xis_new = xis_high

    xis_by_x_new = []

    xis_by_x.each_with_index do |is, x|
      next unless is
      if x <= p
        x2 = x + a
      else
        x2 = x - b
        x2 = 0 if x2 < 0
      end
      if xis_by_x_new[x2]
        xis_by_x_new[x2] += is
      else
        xis_by_x_new[x2] = is
      end
    end

    xis_low.each do |x, i|
      if x + d <= p
        x2 = x + d + a
      else
        x2 = x + d - b
        x2 = 0 if x2 < 0
      end
      xis_by_x_new[x2] ||= []
      xis_by_x_new[x2] << i
    end

    xis_by_x = xis_by_x_new
    xis = xis_new
    d -= b
    pp(xis:, d:, xis_by_x:) if $debug
  end

  xis_result = xis.map { |x, i| [x + d, i] }
  xis_by_x.each_with_index do |is, x|
    next unless is
    xis_result += is.map { |i| [x, i] }
  end

  xis_result.sort_by { |x, i| i }.map { |x, i| x }
end

def calc
  xis = XS.map.with_index { |x, i| [x, i] }
  pp(xis:) if $debug
  xis = xis.sort_by { |x, i| x }
  pp(xis:) if $debug
  xis_result = calc_xis(xis)
  pp(xis_result:) if $debug

  xis_result.each do |x, i|
    puts x
  end
end

calc
