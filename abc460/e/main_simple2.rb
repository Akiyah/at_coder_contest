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

MOD = 998244353
T = STDIN.gets.chomp.to_i


def calc(n, m)

  ans = 0
  (1..18).each do |dy| # yの桁数
    r = 0
    y1 = 10 ** (dy - 1)
    y2 = 10 ** (dy) - 1
    pp(dy:, y1:, y2:, n:, m:) if $debug
    next if n < y1

    (1..n).each do |x|
      r += 1 if (x * (10 ** dy) - x) % m == 0
    end

    ans += ([y2, n].min - y1 + 1) * r
    ans %= MOD
  end

  ans % MOD
end


T.times do
  n, m = STDIN.gets.chomp.split.map(&:to_i)
  ans = calc(n, m)
  puts ans
end


