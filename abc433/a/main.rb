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

X, Y, Z = STDIN.gets.chomp.split.map(&:to_i)


if X <= Y
  puts 'No'
else
  if 0 <= (X - Y * Z) && (X - Y * Z) % (Z - 1) == 0
    puts 'Yes'
  else
    puts 'No'
  end
end
