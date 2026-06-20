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

N, K = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


ds = LRS.combination(K).map do |lrs|
  pp('---') if $debug
  d = lrs.combination(2).map do |(l1, r1), (l2, r2)|
    score = [0 < l2 - r1 ? l2 - r1 : 0, 0 < l1 - r2 ? l1 - r2 : 0].max
    pp(lrs: [[l1, r1], [l2, r2]], score:) if $debug
    score
  end.min
  pp(lrs:, d:) if $debug
  d
end
pp(ds:) if $debug
ds = ds.filter { |d| 0 < d }
if 0 < ds.length
  puts ds.max
else
  puts -1
end
