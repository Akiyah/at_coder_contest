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

N, L, R = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp

ss = S.chars

cs1 = {}
cs2 = {}

(R + 1).times do |i|
  c = ss[i]
  cs1[c] ||= 0
  cs1[c] += 1
  if i < L
    cs2[c] ||= 0
    cs2[c] += 1
  end
end

pp(cs1:, cs2:) if $debug

r = 0
ss.each.with_index do |c, i|
  pp(c:, i:, cs1:, cs2:) if $debug
  r += cs1[c] - cs2[c]
  cs1[c] -= 1
  cs2[c] -= 1
  if i + R + 1 < N
    c1 = ss[i + R + 1]
    cs1[c1] ||= 0
    cs1[c1] += 1
  end
  if i + L < N
    c2 = ss[i + L]
    cs2[c2] ||= 0
    cs2[c2] += 1
  end
  pp(r:) if $debug
end

puts r




