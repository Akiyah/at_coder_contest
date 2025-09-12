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

def calc_abc((x1, y1), (x2, y2))
  a = y2 - y1
  b = -(x2 - x1)
  c = - (b * y1) - (a * x1)
  [a, b, c]
end

def count_xys(a, b, c)
  XYS.count do |x, y|
    a * x + b * y + c == 0
  end
end

def calc_one
  xy1, xy2  = XYS.sample(2)
  abc = calc_abc(xy1, xy2)
  r = count_xys(*abc)
  return abc if N < r * 2
  nil
end

def calc
  20.times do
    abc = calc_one
    return abc if abc
  end
  nil
end

abc = calc()

if abc
  puts 'Yes'
  puts abc.join(' ')

  if $debug
    r = count_xys(*abc)
    pp(N:, abc:, count_xys: r, check: N <= r * 2)
  end
else
  puts 'No'
end
