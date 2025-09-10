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

$nn = (N / 2 + 1) * (N / 2 + 1 - 1) / 2

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

def calc(xys)
  pp(xys:) if $debug

  n = xys.length * 20 / 100 # 20%
  pp(n:) if $debug

  rcs = {}
  abcs = []
  xys.combination(2).each do |xy1, xy2|
    abc = calc_abc(xy1, xy2)
    a, b, c = abc
    if a == 0 # y + t = 0
      s = Float::INFINITY
      t = Rational(c, b)
    else # x + s * y + t = 0
      s = Rational(b, a)
      t = Rational(c, a)
    end

    rcs[s] ||= {}
    rcs[s][t] ||= 0
    rcs[s][t] += 1
    if n * (n - 1) / 2 <= rcs[s][t]
      abcs << abc
    end
  end
  pp(abcs:) if $debug

  abcs.each do |abc|
    pp(abc:, count_xys: count_xys(*abc)) if $debug
    return abc if N <= count_xys(*abc) * 2
  end

  nil
end

xys = XYS.sample(100)
abc = calc(xys)

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
