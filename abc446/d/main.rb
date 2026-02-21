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
AS = STDIN.gets.chomp.split.map(&:to_i)



def calc

  dp = Hash.new(0)

  AS.each do |a|
    if dp[a] < dp[a - 1] + 1
      dp[a] = dp[a - 1] + 1
    end
  end

  dp.values.max
end


puts calc


