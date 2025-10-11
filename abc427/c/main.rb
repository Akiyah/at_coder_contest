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

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc_one(z)
  r = 0
  UVS.each do |u, v|
    r += 1 if z[u - 1] == z[v - 1]
  end
  r
end


def calc
  (2 ** N).times.map do |z|
    calc_one(z)
  end.min
end


puts calc




