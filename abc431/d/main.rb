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
WHBS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  cb_sum = 0
  wb_sum = 0
  w_sum = 0
  whs = []
  WHBS.each do |w, h, b|
    if h <= b
      wb_sum += w
    else
      whs << [w, h - b]
    end
    cb_sum += b
    w_sum += w
  end

  dp = []
  dp[0] = 0
  whs.each do |w, h|
    pp(w:, h:) if $debug
    dp_new = []
    dp.map.with_index do |c2, w2| # head
      next unless c2
      if (w2 + w) * 2 <= w_sum
        dp_new[w2 + w] = c2 + h
      end
      dp_new[w2] = c2 if !dp_new[w2] || dp_new[w2] < c2
    end
    pp(dp:) if $debug
    dp = dp_new
  end

  cb_sum + dp.compact.max
end


puts calc
