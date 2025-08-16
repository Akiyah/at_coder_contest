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

bs = Array.new(N) { true }
pp(bs:) if $debug
LRS.each do |l, r|
  (l..r).each do |i|
    bs[i - 1] = !bs[i - 1]
  end
  pp(bs:) if $debug
end

ss = bs.map.with_index do |b, i|
  b ? S[i] : T[i]
end

puts ss.join('')

