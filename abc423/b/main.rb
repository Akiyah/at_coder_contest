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
LS = STDIN.gets.chomp.split.map(&:to_i)

l_left = nil
l_right = nil
LS.each.with_index do |l, i|
  j = i + 1
  l_left = j if l == 1 && l_left == nil
  l_right = N - j + 1 if l == 1
end

if l_left == nil
  puts 0
else
  pp(l_left:, l_right:) if $debug
  puts N + 1 - (l_left + l_right)
end

