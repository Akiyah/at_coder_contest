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
QUERIES = (1..Q).map do
  STDIN.gets.chomp
end


qs = []
QUERIES.each do |query|
  t, x = query.split
  if t == '1'
    qs << x
  else
    puts qs.shift
  end
end


