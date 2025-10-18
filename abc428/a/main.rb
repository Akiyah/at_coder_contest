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

S, A, B, X = STDIN.gets.chomp.split.map(&:to_i)

n = X / (A + B)
x = X - (A + B) * n 

puts A * S * n + (A < x ? A : x) * S
