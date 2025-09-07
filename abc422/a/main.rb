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

S = STDIN.gets.chomp

i = S[0].to_i
j = S[2].to_i

if j < 8
  j = j + 1
elsif i < 8 && j == 8
  i = i + 1
  j = 1
else
  i = 8
  j = 8
end

puts "#{i}-#{j}"

