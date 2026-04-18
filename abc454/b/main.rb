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

N, M = STDIN.gets.chomp.split.map(&:to_i)
FS = STDIN.gets.chomp.split.map(&:to_i)


if FS.uniq.length < N
  puts 'No'
else
  puts 'Yes'
end

if FS.uniq.length < M
  puts 'No'
else
  puts 'Yes'
end

