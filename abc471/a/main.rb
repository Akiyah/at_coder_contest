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

A, B = STDIN.gets.chomp.split.map(&:to_i)

if (A + B == 9) || (A - B == 9) || (A * B == 9) || (A == 9 * B)
  puts 'Nine'
else
  puts 'Nein'
end
