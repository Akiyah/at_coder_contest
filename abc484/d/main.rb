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
count_a_s = {}
length1_a_s = {}
gs.each do |a, c|
  pp(a:, c:) if $debug
  count_a_s[a] ||= 0
  length1_a_s[a] ||= 0

  r1 = count_a_s[a]
  r2 = sum_c - length1_a_s[a]
  pp(r1:, r2:) if $debug

  r += r1 + r2
  pp(r:) if $debug

  sum_c += c
  count_a_s[a] += 1
  length1_a_s[a] += c + 1
  pp(sum_c:, count_a_s:, length1_a_s:) if $debug
end

puts r + 1


