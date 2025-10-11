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

as = []
as[0] = 1

def f(a)
  a.to_s.chars.map(&:to_i).sum
end

(1..N).each do |i|
  as[i] = (0..(i - 1)).map{ |j| f(as[j]) }.sum
end

puts as[N]