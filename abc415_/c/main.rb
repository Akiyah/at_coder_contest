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




def calc(n, ss)
  pp(n:, ss:) if $debug
  dp = { 0 => true }
  (1..n).each do |i| # 桁数を確定していく
    dp_new = {}
    dp.each do |x, v|
      (0...n).each do |d| # 何桁目か
        next if x[d] == 1

        x2 = x | (1 << d)
        next if ss[x2] == 1
        dp_new[x2] = true
      end
    end
    return false if dp_new.length == 0
    dp = dp_new
    pp(dp:) if $debug
  end
  true
end



T.times do
  n = STDIN.gets.chomp.to_i
  s = STDIN.gets.chomp
  ss = [0] + s.split('').map(&:to_i)
  puts calc(n, ss) ? 'Yes' : 'No'
end
