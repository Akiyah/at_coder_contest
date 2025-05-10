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

# N = STDIN.gets.chomp.to_i
N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  as = AS.dup

  return 0 if as.uniq.sort != (1..M).to_a
  (1..N).each do |i|
    return i if as[0..(N - 1 - i)].uniq.sort != (1..M).to_a
  end
  N
end


puts calc

