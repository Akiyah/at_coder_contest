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

N, M = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp
T = STDIN.gets.chomp

ss = S.chars.map(&:to_i)
ts = T.chars.map(&:to_i)

def calc_one(ss, ts)
  r = M.times.map do |i|
    (ss[i] - ts[i]) % 10
  end.sum
  pp(ss:, ts:, r:) if $debug
  r
end

r = (N - M + 1).times.map do |i|
  calc_one(ss[i..], ts)
end.min


puts r

