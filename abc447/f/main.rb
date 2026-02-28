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

Q = STDIN.gets.chomp.to_i


def calc_one(n, abs)
  paths = {}
  abs.each do |a1, b1|
    a = a1 - 1
    b = b1 - 1
    paths[a] ||= []
    paths[a] << b
    paths[b] ||= []
    paths[b] << a
  end

  parents = {}
  dp = [[0, paths[0]]]
  while 0 < dp.length
    parent, childs = dp.unshift
    
  end


end

Q.times do
  n = STDIN.gets.chomp.to_i
  abs = (1...N).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end

  calc_one(n, abs)
end

