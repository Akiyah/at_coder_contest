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

r = false
AS.each_cons(3) do |a, b, c|
  pp [a, b, c] if $debug
  r = true if a == b && b == c
end

puts r ? 'Yes' : 'No'


