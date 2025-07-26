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

N, K, X = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..N).map do
  STDIN.gets.chomp
end


def calc_one(d, t)
  if d == 0
    return [t]
  end

  N.times.map do |i|
    calc_one(d - 1, t + SS[i])
  end.flatten
end


def calc
  calc_one(K, '').sort
end


puts calc[X - 1]
