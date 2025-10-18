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


def calc(c, d)
  r = 0
  (1..d).each do |x|
    b = f(c, c + x)
    pp(c:, x:, b:) if $debug
    if Math.sqrt(b).to_i ** 2 == b
      r += 1
      pp(x:) if $debug
    end
  end
  r
end


T.times do
  c, d = STDIN.gets.chomp.split.map(&:to_i)
  pp(c:, d:) if $debug


  puts calc(c, d)
end



