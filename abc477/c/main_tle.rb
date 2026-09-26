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

Q = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
T = STDIN.gets.chomp
LRS = Q.times.map { STDIN.gets.chomp.split.map(&:to_i) }



LRS.each do |l1, r1|
  l = l1 - 1
  r = r1 - 1
  puts S[l..r].include?(T) ? 'Yes' : 'No'
end


