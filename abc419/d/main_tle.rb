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
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

ms = []
LRS.each { |l, r| ms << l - 1 }
LRS.each do |l, r|
  ms << r + 1 - 1 if r + 1 - 1 < N
end

ms = ms.sort
pp(ms:) if $debug

b = true
bs = []
last_m = 0
ms.each do |m|
  if last_m < m
    bs += [b] * (m - last_m)
  end
  b = !b
  last_m = m
end

if last_m < N
  bs += [b] * (N - last_m)
end

pp(bs:) if $debug
ss = bs.map.with_index do |b, i|
  b ? S[i] : T[i]
end

puts ss.join('')

