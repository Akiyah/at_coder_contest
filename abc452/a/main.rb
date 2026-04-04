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

M, D = STDIN.gets.chomp.split.map(&:to_i)

if [M, D] == [1, 7] || [M, D] == [3, 3] || [M, D] == [5, 5] || [M, D] == [7, 7] || [M, D] == [9, 9]
  puts 'Yes'
else
  puts 'No'
end

