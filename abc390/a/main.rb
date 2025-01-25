#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

AS = STDIN.gets.chomp.split.map(&:to_i)

bs = AS.sort

if bs == [AS[1], AS[0], AS[2], AS[3], AS[4]] || bs == [AS[0], AS[2], AS[1], AS[3], AS[4]] || bs == [AS[0], AS[1], AS[3], AS[2], AS[4]] || bs == [AS[0], AS[1], AS[2], AS[4], AS[3]]
  puts 'Yes'
else
  puts 'No'
end
