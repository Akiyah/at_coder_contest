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

N, M, L = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

INF = N * M

def calc_cost(i, j) # i番目((i + nL)番目)に何個か足してjにするコストを計算
  (i...N).step(L).map do |i2|
    (j - AS[i2]) % M
  end.sum
end

def create_new_dp(i, dp)
  dp_new = Array.new(M, INF)

  costs2 = (0...M).map do |j2|
    calc_cost(i, j2)
  end

  (0...M).each do |j2|
    (0...M).each do |j1|
      cost = dp[j1] + costs2[j2]
      j = (j1 + j2) % M
      dp_new[j] = cost if cost < dp_new[j]
    end
  end
  dp_new
end


def calc()
  dp = Array.new(M, INF)
  dp[0] = 0

  (0...L).each do |i|
    dp = create_new_dp(i, dp)
  end

  dp[0]
end

puts calc()
