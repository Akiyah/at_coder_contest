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

# N = STDIN.gets.chomp.to_i
N, X = STDIN.gets.chomp.split.map(&:to_i)
SCPS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc()
  dp = {}

  (0..X).each do |x|
    dp[x] = Array.new(2 ** N) { 0 }
    SCPS.each_with_index do |(s, c, p), i|
      (0...(2 ** N)).each do |z|
        next if z[i] == 0

        if c <= x
          e = (p.to_f / 100) * (s + dp[x - c][z - 2 ** i])
          e += (1 - p.to_f / 100) * dp[x - c][z]
          dp[x][z] = e if dp[x][z] < e
        end
      end
    end
  end

  pp dp if $debug

  dp[X][2 ** N - 1]
end

r = calc()

if r.to_i == r
  puts r.to_i
else
  puts r
end
