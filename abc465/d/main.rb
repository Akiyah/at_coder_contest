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


def calc_one(x, y, k)
end

def calc(x, y, k)
  r = 0
  while x != y
    x, y = y, x if y < x
    y = y / k
    r += 1
  end

  r
end


T.times do
  x, y, k = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(x, y, k)
end


