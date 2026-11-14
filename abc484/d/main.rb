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
AS = STDIN.gets.chomp.split.map(&:to_i)
pp(N:, AS:) if $debug


gs = []
last_a = nil
AS.each.with_index do |a, i|
  if last_a != a
    gs << [a, 1]
  else
    gs[-1][1] += 1
  end
  last_a = a
end

pp(gs:) if $debug



r = 0
sum_c = 0
left_s = {}
left_s1 = {}
left_t = {}
gs.each do |a, c|
  left_s[a] ||= 0
  left_s1[a] ||= 0
  left_t[a] ||= 0

  r0 = c * (c - 1) / 2
  r1 = left_s[a] * c - left_t[a]
  r2 = c * (sum_c - left_s1[a])

  r += r0 + r1

  left_s[a] += c
  left_s1[a] += c + 1
  left_t[a] += 1
  sum_c += c
end

puts N * (N - 1) / 2 - r


