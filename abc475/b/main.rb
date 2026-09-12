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


x100 = 0
x10 = 0
x1 = 0
AS.each do |a|
  b = 1000 - (a % 1000)

  x100 += (b % 1000) / 100
  x10 += (b % 100) / 10
  x1 += (b % 10) / 1
end

puts [x1, x10, x100].join(' ')
