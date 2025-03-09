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
  STDIN.gets.chomp.split
end

rs = Array.new(100, 0)
QUERIES.each do |t, x|
  if t == '1'
    rs << x.to_i
  else # t == '2'
    puts rs.pop
  end
end

