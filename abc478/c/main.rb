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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)



as_sorted = AS.sort

ds = AS.map.with_index { |a, i| a == as_sorted[i] }

min_i = ds.find_index(false)
max_i = ds.rindex(false)

if min_i == nil || max_i == nil
  puts 'Yes'
else
  if max_i - min_i + 1 <= K
    puts 'Yes'
  else
    puts 'No'
  end
end
