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

T = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end



def calc(n, s)
  ss = []
  last_c = '0'
  l = 1
  s.chars do |c|
    if last_c == c
      l += 1
    else
      ss << [last_c.to_i, l]
      l = 1
    end

    last_c = c
  end

  if 0 < l
    ss << [s[-1].to_i, l]
  end

  pp(n:, s:, ss:) if $debug

  dp = [0, n, n] # 0->, 0->1->, 0->1->0->
  ss.each do |c, l|
    dp_new = [] # 0->, 0->1->, 0->1->0->
    if c == 1
      dp_new[0] = dp[0] + l
      dp_new[1] = [dp[0], dp[1]].min
      dp_new[2] = [dp[1] + l,  dp[2] + l].min
    else # c == 0
      dp_new[0] = dp[0]
      dp_new[1] = [dp[0] + l,  dp[1] + l].min
      dp_new[2] = [dp[1],  dp[2]].min
    end
    dp = dp_new
    pp(dp:) if $debug
  end

  dp.min
end




T.times do
  n = STDIN.gets.chomp.to_i
  s = STDIN.gets.chomp

  puts calc(n, s)
end

