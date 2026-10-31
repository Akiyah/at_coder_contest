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

AS = (1..5).map do
  STDIN.gets.chomp.chars
end


r1 = 5.times.map do |i|
  (AS[i].tally['o'] || 0)
end.max

r2 = 5.times.map do |j|
  ( 5.times.map { |i| AS[i][j] }.tally['o'] || 0 )
end.max

r3 = 5.times.map { |i| AS[i][i] }.tally['o'] || 0
r4 = 5.times.map { |i| AS[i][4 - i] }.tally['o'] || 0

puts 5 - [r1, r2, r3, r4].max