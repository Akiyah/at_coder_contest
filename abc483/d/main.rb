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
AS = STDIN.gets.chomp.split.map(&:to_i)


x = 0
xs = []
xs << x
AS.each do |a|
  x += a
  xs << x
end
pp(xs:) if $debug


x_min = xs[0]
x_max = xs[0]
x_min_s = []
x_max_s = []
xs.each do |x|
  x_min = [x_min, x].min
  x_min_s << x_min
  x_max = [x_max, x].max
  x_max_s << x_max
end
pp(x_min_s:) if $debug
pp(x_max_s:) if $debug

x_min = xs[-1]
x_max = xs[-1]
x_min_r_s = []
x_max_r_s = []
xs.reverse.each do |x|
  x_min = [x_min, x].min
  x_min_r_s << x_min
  x_max = [x_max, x].max
  x_max_r_s << x_max
end
x_min_s
x_max_s


pp(x_min_r_s:) if $debug
pp(x_max_r_s:) if $debug


d_max = (x_max_s[-1] - x_min_s[-1]).abs
pp(d_max:) if $debug
N.times do |i|
  a = AS[i]
  max_left = x_max_s[i]
  min_left = x_min_s[i]
  max_right = x_max_r_s[N - i - 1]
  min_right = x_min_r_s[N - i - 1]

  pp(i:, max_left:, min_left:, max_right:, min_right:) if $debug

  if 0 < a
    d = (max_left - (min_right - a * 2)).abs
  else
    d = (min_left - (max_right - a * 2)).abs
  end

  d_max = [d_max, d].max
  pp(d_max:) if $debug
end

puts d_max + 1
