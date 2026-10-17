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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



bs = []
N.times do |i|
  bs += AS[0..i]
end


LRS.each do |l1, r1|
  l = l1 - 1
  r = r1 - 1
  puts bs[l..r].sum
end
