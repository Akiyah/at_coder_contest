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

T = STDIN.gets.chomp.to_i

def f(x, y)
  (x.to_s + y.to_s).to_i
end



def calc_one_l(c, c0, c1)
  pp(c:, c0:, c1:) if $debug
  x0 = f(c, c0)
  x1 = f(c, c1)

  y0 = Math.sqrt(x0)
  y1 = Math.sqrt(x1)

  if y0.to_i == y0
    r = y1.to_i - y0.to_i + 1
    pp(r:) if $debug
    r
  else
    r = y1.to_i - y0.to_i
    pp(r:) if $debug
    r
  end
end

def calc_one(c, c0, c1)
  pp(c:, c0:, c1:) if $debug
  r = 0
  l0 = c0.to_s.length
  l1 = c1.to_s.length
  (l0..l1).each do |l|
    c0_ = (10 ** (l - 1))
    c1_ = (10 ** l) - 1
    r += calc_one_l(c, [c0, c0_].max, [c1, c1_].min)
  end

  r
end

def calc(c, d)
  calc_one(c, c + 1, c + d)
end


T.times do
  c, d = STDIN.gets.chomp.split.map(&:to_i)
  pp(c:, d:) if $debug

  puts calc(c, d)
end



