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

K = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)


as = AS.sort

if as[-1] == 9
  puts as[0]
else
  puts -1
end