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
  xis.map do |x, i|
    r = x
    PABS.each do |p, a, b|
      if r <= p
        r += a
      else
        r -= b
        r = 0 if r < 0
      end
    end
    [x, i, r]
  end
end

def calc
  xis = XS.map.with_index { |x, i| [x, i] }
  xis = xis.sort_by { |x, i| x }
  xirs = calc_xis(xis)

  xirs = xirs.sort_by { |x, i, r| i }
  xirs.each do |x, i, r|
    puts r
  end
end



calc
