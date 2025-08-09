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
T = STDIN.gets.chomp

def calc(ts)
  r = ts.inject { |i, j| 1 - i ^ j }
  pp(ts:, r:) if $debug
  r
end


ts = T.split('').map(&:to_i)
r = 0
(0...N).each do |i|
  (i...N).each do |j|
    r += calc(ts[i..j])
  end
end

puts r
