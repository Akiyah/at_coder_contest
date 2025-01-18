#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

R = STDIN.gets.chomp.to_i
RR = (2 * R) ** 2

def calc_x(i)
  a = RR - (2 * i + 1)**2
  return nil if a < 0

  x = (Math.sqrt(a) - 1.0) / 2.0
  x.floor
end

def calc
  x0 = calc_x(0)
  pp x0 if $debug

  r = x0
  (1..R).each do |i|
    x = calc_x(i)
    return r * 4 + 1 if !x
    r += x

    pp [i, x] if $debug
  end
end

puts calc
