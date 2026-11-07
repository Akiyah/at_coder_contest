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
SS = (1..N).map do
  STDIN.gets.chomp
end


# r = 0
# SS.combination(2).each do |s1, s2|
#   c = M.times.count { |i| s1[i] != s2[i] }
#   r += 1 if c <= 2
# end

# puts r


ss = SS.uniq
r0 = SS.tally.values.inject(:*) # 以下の答えをr0倍する
pp(r0:) if $debug
n = ss.length

# ハミング距離=1を数える。ハミング距離2のときにこれらが(M-1)回登場する
r1s = []
M.times do |i|
  ss1 = ss.map { |s| s[...i] + s[(i + 1)..] }
  r1s << n - ss1.uniq.length
end
pp(r1s:) if $debug

# (1..6).to_a.combination(4).to_a
# ハミング距離=2を数える
r2s = []
# (1..6).to_a.combination(4).to_a
(0...M).to_a.combination(2).each do |i, j|
  ss2 = ss.map { |s| s[...i] + s[(i + 1)...j] + s[(j + 1)..] }
  r2 = n - ss2.uniq.length
  r2s << r2
  pp(i:, j:, r2:) if $debug
end
pp(r2s:) if $debug



r = (r2s.sum - r1s.sum * (M - 2)) * r0
puts r
