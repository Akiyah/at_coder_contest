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
S = STDIN.gets.chomp

ss = S.chars

r = 0
N.times do |i|
  (i...N).each do |j|
    ts = ss[i..j].tally
    pp(i:, j:, ts:) if $debug
    na = ts['A'] || 0
    nb = ts['B'] || 0
    nc = ts['C'] || 0
    r += 1 unless na == nb || na == nc || nb == nc
  end
end

puts r
