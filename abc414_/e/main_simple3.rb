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
MOD = 998244353





def calc
  r = 0
  (2..N).each do |b|
    x = N % b
    d = N / b
    # aの数を数える
    r += d * x + (d - 1) * (b - 1 - x)
  end
  r
end


puts calc % MOD



