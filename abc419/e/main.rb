#!/usr/bin/env ruby

# acc N ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?


N, M, L = STDIN.gets.split.map(&:to_i)
AS = STDIN.gets.split.map(&:to_i)

INF = 1e18
dp = Array.new(M, INF)
dp[0] = 0

L.times do |l|
  xs = (l...N).step(L).map { |i| AS[i] }.sort

  now_sum = xs.sum
  d = xs.size
  dp_new = Array.new(M, INF)
  xs.reverse.each do |x|
    M.times do |j|
      idx = (x + j) % M
      dp_new[idx] = [
        dp_new[idx],
        dp[j] + x * d - now_sum
      ].min
    end
    now_sum -= M
  end

  (2 * M).times do |j|
    dp_new[(j + 1) % M] = [
      dp_new[(j + 1) % M],
      dp_new[j % M] + d
    ].min
  end

  dp = dp_new
end

puts dp[0]
