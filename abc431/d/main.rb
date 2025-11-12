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

  dp = {}
  dp[0] = 0
  whs.each do |w, h|
    pp(w:, h:) if $debug
    # dp_new = dp.dup # body
    # pp(dp_new:) if $debug
    ws = dp.keys
    ws.each do |w2| # head
      next unless (w2 + w) * 2 <= w_sum

      c2 = dp[w2]
      next if dp[w2 + w] && c2 + h <= dp[w2 + w]
      dp[w2 + w] = c2 + h
    end
    # dp = dp_new
    pp(dp:) if $debug
  end

  cb_sum + dp.values.max
end


puts calc
