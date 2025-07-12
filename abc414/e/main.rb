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
  (1..(N / 2)).each do |d|
    b1 = N / (d + 1) + 1
    b2 = N / d
    (b1..b2).each do |b|
      x = N % b
      # d = N / b
      # aの数を数える
      # r += d * x + (d - 1) * (b - 1 - x)
      pp(d:, x:, x2: (b2 - b) * d + N % b2, b2:, b:) if $debug
      # r += x + (d - 1) * (b - 1)
      r += (b2 - b) * d + N % b2 + (d - 1) * (b - 1)
      r %= MOD
    end
  end
  r
end


puts calc % MOD



