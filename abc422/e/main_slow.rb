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
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  rs = {}
  XYS.combination(2).each do |(x1, y1), (x2, y2)|
    if x2 - x1 != 0
      r = Rational(y2 - y1, x2 - x1)
    else
      r = Float::INFINITY
    end
    rs[r] ||= 0
    rs[r] += 1
    if N / 2 <= rs[r]
      return [[x1, y1], [x2, y2]]
    end
  end
  pp(rs:) if $debug
  false
end

xys = calc

if xys
  (x1, y1), (x2, y2) = xys
  pp(x1:, y1:, x2:, y2:) if $debug
  a = y2 - y1
  b = x2 - x1
  c = (b * y1) - (a * x1) 
  puts [a, -b, c].join(' ')
else
  puts 'No'
end








