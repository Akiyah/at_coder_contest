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
T = STDIN.gets.chomp

def calc_nxor(ts)
  r = ts.inject { |i, j| 1 - i ^ j }
  pp(ts:, r:) if $debug
  r
end


ts = T.split('').map(&:to_i)
r = 0

t_nxor = 1
ss = []
ss_1_count_0 = 0
ts.each do |t|
  r = 1 - t_nxor ^ t
  ss_1_count_0 += 1 if r == 1
  ss << r
  t_nxor = r
end

ss_1_count_sum = ss_1_count_0
ss_1_count_last = ss_1_count_0
pp(ss_1_count_sum:) if $debug
# 先頭の文字を削っていく
(0...(N - 1)).each do |i|
  t = ts[i]
  s = ss[i]
  if t == 1
    ss_1_count = ss_1_count_last - 1
  else
    ss_1_count = (N - i - 1) - ss_1_count_last
  end
  ss_1_count_sum += ss_1_count
  ss_1_count_last = ss_1_count
  pp(i:, t:, s:, ss_1_count:, ss_1_count_sum:) if $debug
end


# pp(ts:, ss:, ss_1_count:) if $debug



puts ss_1_count_sum
