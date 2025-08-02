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



def calc_one(initial_x)
  x = initial_x
  PABS.each do |p, a, b|
    if x <= p
      x += a
    else
      x -= b
      x = 0 if x < 0
    end
  end
  x
end

def calc
  XS.each do |x|
    puts calc_one(x)
  end
end



calc
