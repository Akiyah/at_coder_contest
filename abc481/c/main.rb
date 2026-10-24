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
SS = (1..Q).map do
  STDIN.gets.chomp
end


as = {}
id = 1

SS.each do |s|
  if as[s]
  else
    as[s] = id
    id += 1
  end

  puts as[s]
end



