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

N, S = STDIN.gets.chomp.split.map(&:to_i)
TS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  return false if S < TS[0]
  (1...N).each do |i|
    return false if S < TS[i] - TS[i - 1]
  end
  true
end


puts calc ? 'Yes' : 'No'
