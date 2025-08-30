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
SS = (1..N).map do
  STDIN.gets.chomp
end
X, Y = STDIN.gets.chomp.split

pp(SS[X.to_i - 1], Y) if $debug
puts (SS[X.to_i - 1] == Y) ? 'Yes' : 'No'


