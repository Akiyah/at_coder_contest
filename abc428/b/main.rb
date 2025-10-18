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
S = STDIN.gets.chomp

ss = {}
(0..(N - K)).each do |i|
  s = S[i...(i + K)]
  ss[s] ||= 0
  ss[s] += 1
end

pp(ss:) if $debug

m = ss.values.max
pp(m:) if $debug

rs = []
ss.each do |s, c|
  rs << s if c == m
end
pp(rs:) if $debug

puts m
puts rs.sort.join(' ')




