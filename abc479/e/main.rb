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
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = []
ABS.each do |a1, b1|
  a, b = a1 - 1, b1 - 1
  paths[a] ||= []
  paths[a] << b
  paths[b] ||= []
  paths[b] << a
end

weights = [0]
