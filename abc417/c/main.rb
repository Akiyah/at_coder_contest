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
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  bs = []
  AS.each_with_index do |a, i|
    bs[i] = a - i
  end

  hs = {}
  r = 0
  (0...N).to_a.reverse.each do |j|
    b = bs[j]
    r += hs[-(b + 2 * j)] || 0
    hs[b] ||= 0
    hs[b] += 1
  end
  r
end



puts calc

