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
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def calc(a, b, x, y)
  pp(a:, b:, x:, y:) if $debug

  x = x.abs
  y = y.abs

  pp(a:, b:, x:, y:) if $debug

  if b < a
    a, b = b, a
    x, y = y, x
  end

  pp(a:, b:, x:, y:) if $debug

  r = 0
  if x < y
    r += a * x * 2
    y -= x
    x = 0
  else
    r += a * y * 2
    x -= y
    y = 0
  end

  pp(a:, b:, x:, y:, r:) if $debug

  if y == 0
    if a * 3 <= b
      r += (x / 2) * (a + (a * 3)) + (x % 2) * a
    else
      r += (x / 2) * (a + b) + (x % 2) * a
    end
  else # x == 0
    if a * 3 <= b
      r += (y / 2) * ((a * 3) + a) + (y % 2) * (a * 3)
    else
      r += (y / 2) * (b + a) + (y % 2) * b
    end
  end


  pp(a:, b:, x:, y:, r:) if $debug

  r
end


T.times do |t|
  pp(t:) if $debug

  a, b, x, y = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(a, b, x, y)
end

