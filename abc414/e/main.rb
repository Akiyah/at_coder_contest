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
  return 1 if N == 3


  r = 0

  r += (N + 1) * (N - 1 - 1)
  r %= MOD

  r -= (N - 1) * (N) / 2 - 1
  r %= MOD

  n1 = Math.sqrt(N).to_i

  b = N - 1
  while n1 <= b
    r1 = (N / b)
    b_min = 1 + N / (1 + N / b)
    db = b - (b_min - 1)
    pp(N:, b:, b_min:, r1:, r:) if $debug
    r -= r1 * db
    r %= MOD
    b = b_min - 1
  end


  while 2 <= b
    r1 = (N / b)
    r -= r1
    r %= MOD
    b -= 1
  end


  
  # (2...n1).each do |b|
  #   r1 = (N / b)
  #   r -= r1
  #   r %= MOD
  # end

  # (n1...N).each do |b|
  #   r1 = (N / b)
  #   r -= r1
  #   r %= MOD
  # end

  r
end


puts calc % MOD



