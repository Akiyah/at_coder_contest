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
  costs2 = (0...M).map do |j2|
    calc_cost(i, j2)
  end

  (0...M).map do |j|
    xs1 = (0..j).map do |j2|
      dp[j - j2] + costs2[j2]
    end
    xs2 = ((j + 1)...M).map do |j2|
      dp[j + M - j2] + costs2[j2]
    end
    (xs1 + xs2).min
  end
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
